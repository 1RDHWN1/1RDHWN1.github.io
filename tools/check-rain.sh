#!/usr/bin/env bash
# Does the rain canvas actually advance? Loads the real page with a probe
# injected via a data: URL wrapper is fragile, so instead this uses a copy of
# the page with a tiny probe appended, served from the same origin.
set -u
cd "$(dirname "$0")/.."

python3 - <<'PY'
src = open('index.html', encoding='utf-8').read()
probe = """
<script>
// Probe appended by tools/check-rain.py. Reports to the DOM so --dump-dom can
// read it. Only used for verification, never shipped.
(function(){
  function hash(ctx,w,h){
    var d=ctx.getImageData(0,0,w,h).data, x=2166136261;
    for (var i=0;i<d.length;i+=64){ x^=d[i]; x=(x*16777619)>>>0; }
    return x;
  }
  function report(o){ var p=document.createElement('pre'); p.id='probe';
    p.textContent=JSON.stringify(o); document.body.appendChild(p); }
  var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  var cv = document.getElementById('rain');
  var out = { reduce: reduce, canvas: !!cv };
  if (!cv || !cv.getContext) { report(out); return; }
  var ctx = cv.getContext('2d'), W = cv.width, H = cv.height;
  out.size = W + 'x' + H;
  var a = hash(ctx, W, H);
  setTimeout(function(){
    var b = hash(ctx, W, H);
    setTimeout(function(){
      var c = hash(ctx, W, H);
      out.frames = [a, b, c];
      out.animating = (a !== b) || (b !== c);
      out.panelOpacity = getComputedStyle(document.querySelector('.panel')).opacity;
      out.panelRepos = document.getElementById('pRepos').textContent;
      out.panelTime = document.getElementById('pTime').textContent;
      out.blocksOpaque = [].slice.call(document.querySelectorAll('.reveal'))
        .filter(function(n){ return getComputedStyle(n).opacity === '1'; }).length;
      out.blocksTotal = document.querySelectorAll('.reveal').length;
      out.marks = document.querySelectorAll('.elsewhere .mark').length;
      out.emDash = (document.body.innerHTML.match(/\\u2014/g) || []).length;
      report(out);
    }, 700);
  }, 700);
})();
</script>
"""
open('__probe.html', 'w', encoding='utf-8').write(src.replace('</body>', probe + '</body>'))
print('wrote __probe.html')
PY

# Serve, then render the probe page directly (no iframe) and read the report.
python3 -m http.server 8921 >/dev/null 2>&1 &
SRV=$!
sleep 2
timeout 90 chromium --headless --disable-gpu --no-sandbox \
  --window-size=1000,700 --virtual-time-budget=20000 \
  --dump-dom "http://127.0.0.1:8921/__probe.html" 2>/dev/null \
  | grep -o '<pre id="probe">.*</pre>' | sed 's/<[^>]*>//g' | head -c 1200
echo
kill $SRV 2>/dev/null
rm -f __probe.html
