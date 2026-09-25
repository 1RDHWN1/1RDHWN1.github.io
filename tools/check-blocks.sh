#!/usr/bin/env bash
# Reports which .reveal block, if any, is still transparent after settling.
set -u
cd "$(dirname "$0")/.."

python3 - <<'PY'
src = open('index.html', encoding='utf-8').read()
probe = """
<script>
(function(){
  function report(o){ var p=document.createElement('pre'); p.id='probe';
    p.textContent=JSON.stringify(o); document.body.appendChild(p); }
  setTimeout(function(){
    var rows = [].slice.call(document.querySelectorAll('.reveal')).map(function(n){
      var cs = getComputedStyle(n);
      return {
        tag: n.tagName.toLowerCase(),
        cls: n.className,
        op: cs.opacity,
        anim: cs.animationName,
        delay: cs.animationDelay,
        rectTop: Math.round(n.getBoundingClientRect().top)
      };
    });
    report({ rows: rows });
  }, 2600);
})();
</script>
"""
open('__probe2.html', 'w', encoding='utf-8').write(src.replace('</body>', probe + '</body>'))
PY

python3 -m http.server 8923 >/dev/null 2>&1 &
SRV=$!
sleep 2
timeout 90 chromium --headless --disable-gpu --no-sandbox \
  --window-size=1000,700 --virtual-time-budget=20000 \
  --dump-dom "http://127.0.0.1:8923/__probe2.html" 2>/dev/null \
  | grep -o '<pre id="probe">.*</pre>' | sed 's/<[^>]*>//g'
echo
kill $SRV 2>/dev/null
rm -f __probe2.html
