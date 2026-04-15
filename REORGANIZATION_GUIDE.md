# GitHub Repository Reorganization Guide
## Infinite Signal Labs - Consolidation & Hierarchy Setup

**Created:** April 15, 2026  
**Status:** Ready for execution

---

## Overview

This guide consolidates your 10 GitHub repositories into a hierarchical structure under **Infinite Signal Labs**.

### Final Structure

**Infinite Signal Labs Organization (4 repos):**
- `infinite-signal-labs/diagnostix` - AI OBD2 Vehicle Diagnostics
- `infinite-signal-labs/soundforge` - SOUNDFORGE + CLEARWAVE (soundwave + bonesDSP combined)
- `infinite-signal-labs/agent-bones` - Core ISL AI Agent
- `infinite-signal-labs/ledger` - Logging system (ledger + greylogs combined)

**Personal Account - billybones031-ui (2 repos):**
- `billybones031-ui/obsidian` - Personal profile (renamed from billybones031-ui)
- `billybones031-ui/intro-to-git` - Personal educational repo

**Archived (5 repos):**
- `billybones031-ui/bonesDSP` → merged into soundforge
- `billybones031-ui/greylogs` → merged into ledger
- `billybones031-ui/apkclaw`
- `billybones031-ui/tech-learning`
- `billybones031-ui/ai-prompt-mastery`

---

## Step-by-Step Execution Guide

### Phase 1: Consolidate Code Repos (Run Locally)

Execute these commands in your terminal to consolidate the code:

#### 1a. Consolidate soundwave + bonesDSP → soundforge

```bash
# Clone soundwave as the base
git clone https://github.com/billybones031-ui/soundwave.git soundforge-temp
cd soundforge-temp

# Add bonesDSP as a subdirectory/module
git remote add bonesDSP https://github.com/billybones031-ui/bonesDSP.git
git fetch bonesDSP

# Create a subdirectory for bonesDSP code
mkdir -p dsp
git read-tree -u -p bonesDSP/main:. dsp/

# Or manually merge: copy bonesDSP files into dsp/ subdirectory
# Then commit the consolidation
git add .
git commit -m "Merge bonesDSP into soundforge

- Consolidates SOUNDFORGE + CLEARWAVE with DSP processing
- bonesDSP code now under /dsp directory
- Both projects unified in single repo"

# Push to create new soundforge repo (you'll transfer this)
cd ..
```

#### 1b. Consolidate ledger + greylogs

```bash
# Clone ledger as the base
git clone https://github.com/billybones031-ui/ledger.git ledger-temp
cd ledger-temp

# Add greylogs as a subdirectory
git remote add greylogs https://github.com/billybones031-ui/greylogs.git
git fetch greylogs

mkdir -p greylog-archive
git read-tree -u -p greylogs/main:. greylog-archive/

# Commit the consolidation
git add .
git commit -m "Merge greylogs into ledger

- Consolidated logging system
- greylogs code archived under /greylog-archive
- Unified logging infrastructure"

cd ..
```

---

### Phase 2: Transfer Repos to Organization (GitHub Web UI)

For each repository, follow these steps:

#### For diagnostix, agent-bones, and ledger:

1. Go to repo → **Settings**
2. Scroll to **Danger Zone**
3. Click **Transfer repository**
4. New owner: `infinite-signal-labs`
5. Confirm by typing the repo name
6. Click **I understand, transfer this repository**

#### For soundforge (new consolidated repo):

1. Create new repo at https://github.com/new
   - Name: `soundforge`
   - Owner: `infinite-signal-labs`
   - Make public
2. Clone your consolidated soundforge-temp repo
3. Push to the new repo:
   ```bash
   cd soundforge-temp
   git remote set-url origin https://github.com/infinite-signal-labs/soundforge.git
   git push -u origin main
   ```

---

### Phase 3: Delete Old Repos (GitHub Web UI)

After successful transfer, delete the now-empty original repos:

For each of these from `billybones031-ui`:
- `soundwave` (after soundforge transfer)
- `bonesDSP` (after consolidation)
- `ledger` (after transfer - keep backup locally first!)
- `greylogs` (after consolidation)

Steps:
1. Go to repo → **Settings**
2. Scroll to **Danger Zone**
3. Click **Delete this repository**
4. Type the repo name to confirm
5. Click **Delete**

---

### Phase 4: Archive Inactive Repos (GitHub Web UI)

Archive these 3 repos (don't delete):

1. `apkclaw`
2. `tech-learning`
3. `ai-prompt-mastery`

For each:
1. Go to repo → **Settings**
2. Scroll to **Danger Zone**
3. Click **Archive this repository**
4. Confirm

---

### Phase 5: Rename billybones031-ui → obsidian (GitHub Web UI)

1. Go to `billybones031-ui/billybones031-ui` repo
2. **Settings** → **General**
3. Under "Repository name" change from `billybones031-ui` to `obsidian`
4. Click **Rename**

---

### Phase 6: Verify Final Structure

After all operations, verify:

```bash
# Check Infinite Signal Labs org
curl https://api.github.com/orgs/infinite-signal-labs/repos | jq '.[] | .name'

# Should show:
# - agent-bones
# - diagnostix
# - ledger
# - soundforge

# Check personal account
curl https://api.github.com/users/billybones031-ui/repos | jq '.[] | .name'

# Should show:
# - obsidian (renamed from billybones031-ui)
# - intro-to-git
# - (3 archived repos: apkclaw, tech-learning, ai-prompt-mastery)
```

---

## Rollback Plan (if needed)

If something goes wrong during transfer:

1. **Repos can be transferred back** - Settings → Transfer
2. **Deleted repos can be recovered** - Contact GitHub Support within 90 days
3. **Keep local clones** - Always keep a backup clone locally before deleting

---

## After Completion

Your GitHub presence will be:
- ✅ Organized hierarchically under Infinite Signal Labs
- ✅ Main projects consolidated (soundforge, ledger)
- ✅ Personal repos separated
- ✅ Inactive repos archived
- ✅ Professional structure ready for growth

Update your:
- GitHub profile bio/links
- Project documentation
- README files with org links
- CI/CD pipelines if any

---

## Consolidated Repos Local Backup

Keep these directories for reference:
- `soundforge-temp/` - Consolidated SOUNDFORGE + CLEARWAVE + DSP
- `ledger-temp/` - Consolidated LEDGER + GREYLOGS

You can delete them after successful transfer.

---

**Questions?** Refer to this guide or GitHub's repository transfer documentation.
