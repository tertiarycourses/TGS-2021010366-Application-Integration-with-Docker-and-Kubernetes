#!/bin/bash
# .claude/hooks/post-compile.sh
# Fires after Claude writes or edits build_courseware_v3.py
# Automatically re-runs the script to regenerate PPTX outputs

INPUT=$(cat)
FILE=$(echo "$INPUT" | python -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('file_path',''))" 2>/dev/null)

if [[ "$FILE" == *"build_courseware_v3.py" ]]; then
  echo "▶ build_courseware_v3.py updated — regenerating slides..."

  if python build_courseware_v3.py; then
    echo "✅ Slides rebuilt successfully"
    for f in Docker_Kubernetes_Day1_v3.pptx Docker_Kubernetes_Day2_v3.pptx; do
      if [ -f "$f" ]; then
        SIZE=$(du -k "$f" | cut -f1)
        echo "   📊 $f  (${SIZE}KB)"
      fi
    done
  else
    echo "❌ build_courseware_v3.py failed — check for Python errors" >&2
    exit 2
  fi
fi

exit 0
