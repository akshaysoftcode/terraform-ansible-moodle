#!/bin/bash
# ── AWS Security Dashboard — Mac Launcher ─────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║     AWS Security Dashboard  🛡           ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# Check Python
if ! command -v python3 &>/dev/null; then
  echo "❌  Python3 not found. Run: brew install python"; exit 1
fi

# Install Python deps
echo "📦  Checking Python dependencies..."
pip3 install flask flask-cors openpyxl --quiet --break-system-packages 2>/dev/null || \
pip3 install flask flask-cors openpyxl --quiet

# Check AWS CLI
if ! command -v aws &>/dev/null; then
  echo "❌  AWS CLI not found. Run: brew install awscli"; exit 1
fi

# Check AWS credentials
echo "🔐  Verifying AWS credentials..."
IDENTITY=$(aws sts get-caller-identity 2>/dev/null)
if [ -z "$IDENTITY" ]; then
  echo "❌  AWS credentials not configured. Run: aws configure"; exit 1
fi

ACCOUNT=$(echo $IDENTITY | python3 -c "import sys,json; print(json.load(sys.stdin)['Account'])")
USER=$(echo $IDENTITY    | python3 -c "import sys,json; print(json.load(sys.stdin)['Arn'])")

echo "✅  AWS Account : $ACCOUNT"
echo "✅  Identity    : $USER"
echo ""
echo "════════════════════════════════════════"
echo "📌  Open in browser:"
echo "    Security Dashboard → file://$SCRIPT_DIR/index.html"
echo "    Live S3 Sheet      → file://$SCRIPT_DIR/live-sheet.html"
echo "════════════════════════════════════════"
echo ""
echo "🟢  Backend starting on http://localhost:5001"
echo "    Press Ctrl+C to stop."
echo ""

python3 "$SCRIPT_DIR/app.py"
