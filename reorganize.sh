#!/bin/bash
# GitHub Repository Reorganization Automation Script
# Infinite Signal Labs - Repo Consolidation
# Usage: bash reorganize.sh [work_directory]

set -e

WORK_DIR="${1:-.}"
REPOS_BASE="$WORK_DIR/isl-repos"

echo "======================================================"
echo "Infinite Signal Labs - Repository Reorganization"
echo "======================================================"
echo ""
echo "Work directory: $WORK_DIR"
echo "Repos will be cloned to: $REPOS_BASE"
echo ""

# Create working directory
mkdir -p "$REPOS_BASE"
cd "$REPOS_BASE"

echo "[1/5] Cloning repositories..."
echo "---"

# Clone all repos
REPOS=(
  "soundwave"
  "bonesDSP"
  "ledger"
  "greylogs"
  "diagnostix"
  "agent-bones"
  "apkclaw"
  "tech-learning"
  "ai-prompt-mastery"
  "intro-to-git"
)

for repo in "${REPOS[@]}"; do
  if [ ! -d "$repo" ]; then
    echo "Cloning $repo..."
    git clone "https://github.com/billybones031-ui/$repo.git" "$repo" || echo "⚠ Failed to clone $repo (may not exist or network issue)"
  else
    echo "✓ $repo already cloned"
  fi
done

echo ""
echo "[2/5] Consolidating soundwave + bonesDSP → soundforge"
echo "---"

if [ -d "soundwave" ] && [ -d "bonesDSP" ]; then
  cp -r soundwave soundforge-consolidated
  cd soundforge-consolidated

  # Create DSP subdirectory and add bonesDSP code
  mkdir -p dsp
  cp -r ../bonesDSP/* dsp/ 2>/dev/null || echo "⚠ Could not copy all bonesDSP files"

  # Git operations
  git add dsp/
  git commit -m "Merge bonesDSP into soundforge

- Consolidates SOUNDFORGE + CLEARWAVE with DSP processing
- bonesDSP code now under /dsp directory
- Both projects unified in single repo" || echo "⚠ No changes to commit"

  cd ..
  echo "✓ soundforge consolidated (soundforge-consolidated/)"
else
  echo "⚠ Cannot consolidate: soundwave or bonesDSP not found"
fi

echo ""
echo "[3/5] Consolidating ledger + greylogs"
echo "---"

if [ -d "ledger" ] && [ -d "greylogs" ]; then
  cp -r ledger ledger-consolidated
  cd ledger-consolidated

  # Create archive subdirectory for greylogs
  mkdir -p greylog-archive
  cp -r ../greylogs/* greylog-archive/ 2>/dev/null || echo "⚠ Could not copy all greylogs files"

  # Git operations
  git add greylog-archive/
  git commit -m "Merge greylogs into ledger

- Consolidated logging system
- greylogs code archived under /greylog-archive
- Unified logging infrastructure" || echo "⚠ No changes to commit"

  cd ..
  echo "✓ ledger consolidated (ledger-consolidated/)"
else
  echo "⚠ Cannot consolidate: ledger or greylogs not found"
fi

echo ""
echo "[4/5] Summary of Consolidated Repos"
echo "---"
echo ""
echo "Ready to transfer to infinite-signal-labs:"
echo "  • diagnostix/ → infinite-signal-labs/diagnostix"
echo "  • agent-bones/ → infinite-signal-labs/agent-bones"
echo "  • soundforge-consolidated/ → infinite-signal-labs/soundforge (NEW)"
echo "  • ledger-consolidated/ → infinite-signal-labs/ledger"
echo ""
echo "Personal repos (billybones031-ui):"
echo "  • intro-to-git/ (keep as-is)"
echo "  • obsidian (rename billybones031-ui → obsidian)"
echo ""
echo "To archive:"
echo "  • apkclaw/"
echo "  • tech-learning/"
echo "  • ai-prompt-mastery/"
echo ""
echo "To delete after transfer:"
echo "  • soundwave/ (merged into soundforge)"
echo "  • bonesDSP/ (merged into soundforge)"
echo "  • greylogs/ (merged into ledger)"
echo ""

echo "[5/5] Next Steps (Manual - GitHub Web UI)"
echo "---"
echo ""
echo "1. Transfer consolidated repos to infinite-signal-labs org:"
echo "   - Go to repo Settings → Danger Zone → Transfer repository"
echo "   - For soundforge: Create NEW repo in org, push from soundforge-consolidated/"
echo ""
echo "2. Rename billybones031-ui → obsidian"
echo "   - Go to repo Settings → General → Change repository name"
echo ""
echo "3. Archive inactive repos:"
echo "   - Settings → Danger Zone → Archive this repository"
echo "   - apkclaw, tech-learning, ai-prompt-mastery"
echo ""
echo "4. Delete old repos after transfer:"
echo "   - soundwave, bonesDSP, greylogs (only after successful transfer)"
echo ""

echo ""
echo "✓ Consolidation complete!"
echo "  Repository consolidations ready in: $REPOS_BASE"
echo "  - soundforge-consolidated/"
echo "  - ledger-consolidated/"
echo ""
echo "======================================================"
