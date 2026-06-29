#!/bin/bash
# .claude/hooks/validate-slides.sh
# Fires on Stop event — validates the v3 courseware build
# Course: TGS-2021010366 | Instructor: Dr. Alfred Ang

SCRIPT="build_courseware_v3.py"
DAY1="Docker_Kubernetes_Day1_v3.pptx"
DAY2="Docker_Kubernetes_Day2_v3.pptx"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Slide validation — TGS-2021010366 (v3)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check build script exists
if [ ! -f "$SCRIPT" ]; then
  echo "  ⚠  build_courseware_v3.py not found"
  exit 0
fi

# Check for retired references
V20=$(grep -c "v20.pptx\|Courseware_v2\|build_courseware\.py" "$SCRIPT" 2>/dev/null || echo 0)
if [ "$V20" -gt 0 ]; then
  echo "  ❌ $V20 references to retired v20/v2 files found in build script" >&2
else
  echo "  ✅ No retired file references"
fi

# Check KillerCoda references
KC=$(grep -c "killercoda" "$SCRIPT" 2>/dev/null || echo 0)
echo "  KillerCoda URL references in script: $KC"
if [ "$KC" -lt 10 ]; then
  echo "  ⚠  Low KillerCoda references — labs may be missing URLs" >&2
fi

# Check colour palette
DARK=$(grep -c "21201C\|C_DARK" "$SCRIPT" 2>/dev/null || echo 0)
ORANGE=$(grep -c "D97757\|C_ORANGE" "$SCRIPT" 2>/dev/null || echo 0)
echo "  Dark palette uses: $DARK  |  Orange accent uses: $ORANGE"

# Check Day 1 output
if [ -f "$DAY1" ]; then
  SIZE=$(du -k "$DAY1" | cut -f1)
  echo "  ✅ $DAY1  (${SIZE}KB)"
  if [ "${SIZE:-0}" -lt 50 ]; then
    echo "  ⚠  File very small — may have generation issues" >&2
  fi
else
  echo "  ⚠  $DAY1 not found — run: python build_courseware_v3.py"
fi

# Check Day 2 output
if [ -f "$DAY2" ]; then
  SIZE=$(du -k "$DAY2" | cut -f1)
  echo "  ✅ $DAY2  (${SIZE}KB)"
else
  echo "  ℹ  $DAY2 not yet built (Day 2 — Kubernetes)"
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
exit 0
