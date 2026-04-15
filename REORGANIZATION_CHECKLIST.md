# Reorganization Checklist - Infinite Signal Labs

**Start Date:** ___________  
**Target Completion:** ___________  
**Completed:** ___________

---

## Pre-Flight Checks

- [ ] Read `REORGANIZATION_GUIDE.md` fully
- [ ] Backup all local repos (git clone or zip important ones)
- [ ] Ensure you have GitHub organization admin access to `infinite-signal-labs`
- [ ] Have all 10 repos information ready:
  - soundwave, bonesDSP, ledger, greylogs
  - diagnostix, agent-bones
  - apkclaw, tech-learning, ai-prompt-mastery
  - intro-to-git, billybones031-ui

---

## Phase 1: Code Consolidation (Local - Run Script)

- [ ] Run automation script: `bash reorganize.sh ~/work`
  - Creates `~/work/isl-repos/` directory
  - Clones all 10 repos
  - Consolidates soundwave + bonesDSP → `soundforge-consolidated/`
  - Consolidates ledger + greylogs → `ledger-consolidated/`

- [ ] Verify consolidations created:
  - [ ] `~/work/isl-repos/soundforge-consolidated/` exists with /dsp/ subdirectory
  - [ ] `~/work/isl-repos/ledger-consolidated/` exists with /greylog-archive/ subdirectory

- [ ] Review consolidated code:
  - [ ] soundforge: Check audio + DSP files are both present
  - [ ] ledger: Check logging + greylogs files are both present

---

## Phase 2: Create Organization & Transfer Repos

### Org Verification
- [ ] Verify `infinite-signal-labs` organization exists at https://github.com/infinite-signal-labs
  - If not: Create new organization on GitHub

### Transfer Existing Repos (4 repos)
Transfer these repos from `billybones031-ui` → `infinite-signal-labs`:

#### diagnostix
- [ ] Go to https://github.com/billybones031-ui/diagnostix
- [ ] Settings → Danger Zone → **Transfer repository**
- [ ] New owner: `infinite-signal-labs`
- [ ] Confirm and transfer
- [ ] Verify at: https://github.com/infinite-signal-labs/diagnostix

#### agent-bones
- [ ] Go to https://github.com/billybones031-ui/agent-bones
- [ ] Settings → Danger Zone → **Transfer repository**
- [ ] New owner: `infinite-signal-labs`
- [ ] Confirm and transfer
- [ ] Verify at: https://github.com/infinite-signal-labs/agent-bones

#### ledger
- [ ] Go to https://github.com/billybones031-ui/ledger
- [ ] Settings → Danger Zone → **Transfer repository**
- [ ] New owner: `infinite-signal-labs`
- [ ] Confirm and transfer
- [ ] Verify at: https://github.com/infinite-signal-labs/ledger

### Create & Upload soundforge (NEW CONSOLIDATED REPO)
- [ ] Create new repo at https://github.com/new
  - [ ] Name: `soundforge`
  - [ ] Owner: `infinite-signal-labs`
  - [ ] Public
  - [ ] Do NOT initialize with README
- [ ] Upload consolidated code:
  ```bash
  cd ~/work/isl-repos/soundforge-consolidated
  git remote set-url origin https://github.com/infinite-signal-labs/soundforge.git
  git branch -M main
  git push -u origin main
  ```
- [ ] Verify at: https://github.com/infinite-signal-labs/soundforge

---

## Phase 3: Delete Old (Merged) Repos

After successful transfers above, DELETE these repos from `billybones031-ui`:

#### soundwave
- [ ] Go to https://github.com/billybones031-ui/soundwave
- [ ] Settings → Danger Zone → **Delete this repository**
- [ ] Type `soundwave` to confirm
- [ ] Delete

#### bonesDSP
- [ ] Go to https://github.com/billybones031-ui/bonesDSP
- [ ] Settings → Danger Zone → **Delete this repository**
- [ ] Type `bonesDSP` to confirm
- [ ] Delete

#### greylogs
- [ ] Go to https://github.com/billybones031-ui/greylogs
- [ ] Settings → Danger Zone → **Delete this repository**
- [ ] Type `greylogs` to confirm
- [ ] Delete

---

## Phase 4: Archive Inactive Repos

These repos stay under `billybones031-ui` but are archived:

#### apkclaw
- [ ] Go to https://github.com/billybones031-ui/apkclaw
- [ ] Settings → Danger Zone → **Archive this repository**
- [ ] Confirm archive

#### tech-learning
- [ ] Go to https://github.com/billybones031-ui/tech-learning
- [ ] Settings → Danger Zone → **Archive this repository**
- [ ] Confirm archive

#### ai-prompt-mastery
- [ ] Go to https://github.com/billybones031-ui/ai-prompt-mastery
- [ ] Settings → Danger Zone → **Archive this repository**
- [ ] Confirm archive

---

## Phase 5: Rename Personal Profile Repo

#### billybones031-ui → obsidian
- [ ] Go to https://github.com/billybones031-ui/billybones031-ui
- [ ] Settings → General
- [ ] Under "Repository name" change from `billybones031-ui` to `obsidian`
- [ ] Click **Rename**
- [ ] Update local repo:
  ```bash
  cd /path/to/local/repo
  git remote set-url origin https://github.com/billybones031-ui/obsidian.git
  ```

---

## Phase 6: Verify Final Structure

### Infinite Signal Labs Organization
- [ ] Visit https://github.com/infinite-signal-labs
- [ ] Repos present (should be 4):
  - [ ] agent-bones
  - [ ] diagnostix
  - [ ] ledger
  - [ ] soundforge

### Personal Account (billybones031-ui)
- [ ] Visit https://github.com/billybones031-ui
- [ ] Active repos (should be 2):
  - [ ] obsidian (profile - renamed)
  - [ ] intro-to-git
- [ ] Archived repos visible (should be 3):
  - [ ] apkclaw (archived)
  - [ ] tech-learning (archived)
  - [ ] ai-prompt-mastery (archived)

### API Verification (Optional)
```bash
# Check org repos
curl https://api.github.com/orgs/infinite-signal-labs/repos | jq '.[] | .name'

# Check personal repos
curl https://api.github.com/users/billybones031-ui/repos | jq '.[] | .name'
```

---

## Phase 7: Update Documentation

- [ ] Update GitHub profile bio (if needed)
- [ ] Update project README files with new org links
- [ ] Update any CI/CD configuration with new repo URLs
- [ ] Update team documentation with new structure
- [ ] Check and update any external links to repos

---

## Cleanup

- [ ] Delete local consolidated directories (optional):
  ```bash
  rm -rf ~/work/isl-repos/soundforge-consolidated
  rm -rf ~/work/isl-repos/ledger-consolidated
  ```
- [ ] Keep backup clones in `~/work/isl-repos/` for reference (optional)

---

## Validation

- [ ] All repos transferred to correct org ✓
- [ ] All repos archived as planned ✓
- [ ] Consolidated repos created with merged code ✓
- [ ] Profile repo renamed to obsidian ✓
- [ ] Inactive repos archived ✓
- [ ] No data loss or broken links ✓

---

## Rollback Notes (If Needed)

If something goes wrong:
1. **Repo transfers can be reversed** - Transfer back from org → personal account
2. **Deleted repos recoverable** - GitHub Support can recover within 90 days
3. **Local backups saved** - All repos cloned in `~/work/isl-repos/`

Contact GitHub Support: https://github.com/contact

---

## Summary

**Repos transferred to organization:** 4  
**New consolidated repos:** 1 (soundforge)  
**Repos archived:** 3  
**Repos deleted:** 3 (merged into others)  
**Personal repos retained:** 2  

**Total before:** 10 public repos  
**Total after:** 7 public repos (4 in org, 2 personal, 1 consolidated new)

---

**Questions?** Refer to:
- `REORGANIZATION_GUIDE.md` - Detailed steps
- `reorganize.sh` - Automation script
- GitHub Help: https://docs.github.com/en/repositories/creating-and-managing-repositories/transferring-a-repository

---

## Notes Section

Use this space to track any issues or notes:

```
Date: ________
Issue: 
Resolution: 

---

Date: ________
Issue: 
Resolution: 
```
