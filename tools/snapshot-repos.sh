#!/usr/bin/env bash
# Regenerate repos.json for udincloud.me.
#
# The landing page used to call the GitHub API from the visitor's browser. That
# is a 60-requests-per-hour budget shared by every visitor from the same IP, and
# it failed in practice: the page showed "tidak bisa memuat daftar repo" while
# the limit recovered. So the list is baked to a static file at build time
# instead, and the page only reads that file. No token, no rate limit, no
# third party involved when someone opens the page.
#
# Run it whenever the repos change:  bash tools/snapshot-repos.sh
set -euo pipefail

USER_NAME="1RDHWN1"
OUT="$(cd "$(dirname "$0")/.." && pwd)/repos.json"
TMP="$(mktemp)"

echo "Fetching repos for ${USER_NAME}..."

# gh is authenticated on this machine, so it is not subject to the anonymous
# 60/hour wall. Fall back to curl for an unauthenticated run.
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  gh api "users/${USER_NAME}/repos?per_page=100&sort=pushed" \
    --jq '[.[] | select(.fork == false) | {
      name, description, language, html_url,
      stars: .stargazers_count,
      pushed: .pushed_at,
      archived
    }]' > "$TMP"
else
  echo "gh not authenticated, using unauthenticated curl (60/hour)"
  curl -sS -H 'Accept: application/vnd.github+json' \
    "https://api.github.com/users/${USER_NAME}/repos?per_page=100&sort=pushed" \
    | python3 -c 'import sys,json; d=json.load(sys.stdin); print(json.dumps([{ "name":r["name"], "description":r.get("description"), "language":r.get("language"), "html_url":r["html_url"], "stars":r.get("stargazers_count",0), "pushed":r.get("pushed_at"), "archived":r.get("archived",False)} for r in d if not r.get("fork")]))' > "$TMP"
fi

COUNT="$(python3 -c "import json;print(len(json.load(open('$TMP'))))")"
if [ "$COUNT" -lt 5 ]; then
  echo "Refusing to write: only ${COUNT} repos returned, that looks like a failed fetch." >&2
  rm -f "$TMP"
  exit 1
fi

# Wrap with the fetch time so the page can say how fresh the list is.
python3 - "$TMP" "$OUT" <<'PY'
import json, sys
from datetime import datetime, timezone

src, dst = sys.argv[1], sys.argv[2]
repos = json.load(open(src))
# The homepage is deterministic about ordering, but keep the API's order too.
out = {
    "generated": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
    "source": "github.com/1RDHWN1",
    "repos": repos,
}
with open(dst, "w", encoding="utf-8") as fh:
    json.dump(out, fh, ensure_ascii=False, indent=2)
    fh.write("\n")
print(f"wrote {dst} with {len(repos)} repos")
PY

rm -f "$TMP"
