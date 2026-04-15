#### HOWTO.md

##### AegisIntel — Simple Git Workflow Guide

This document explains how to work with Git in this project.

This workflow is intentionally simple.

---

##### Branches used

We only use:

- main → stable version
- dev → development branch

---

##### General rules

- Never work directly on main
- All work is done in dev
- main only receives stable code via Pull Request

---

##### First-time setup

Clone the repository:

git clone https://github.com/felipealfonsog/aegisIntel.git
cd aegisIntel

Switch to dev:

git checkout dev
git pull origin dev

---

##### Daily workflow

##### 1. Update dev

Before starting:

git checkout dev
git pull origin dev

---

##### 2. Work on the project

Edit files normally.

Check status:

git status

---

##### 3. Add changes

git add .

---

##### 4. Commit

git commit -m "Clear message describing changes"

Examples:

- Add root API endpoint
- Improve IOC validation
- Refactor enrichment logic
- Fix CLI output formatting

Avoid:

- update
- changes
- fix stuff

---

##### 5. Push changes

git push

---

##### Creating a Pull Request (dev → main)

When dev is stable:

1. Go to GitHub
2. Open repository
3. Go to Pull Requests
4. Click New Pull Request
5. Set:

base = main  
compare = dev  

6. Create Pull Request
7. Merge

---

##### After merge

Update local repo:

git checkout main
git pull origin main

git checkout dev
git pull origin dev

---

##### Useful commands

Check current branch:

git branch

---

Check status:

git status

---

Pull latest changes:

git pull

---

##### Safe workflow summary

1. work only on dev  
2. pull before starting  
3. commit clearly  
4. push regularly  
5. merge dev into main when stable  

---

##### Important notes

- main must always stay clean and stable
- dev is where all development happens
- no feature branches for now (keep it simple)
- if the project grows, the workflow can evolve later

---

##### If something goes wrong

Run:

git status

Check current branch and changes before doing anything else.

---

##### Final note

This project uses a minimal workflow:

main = stable  
dev = development  

Keep it simple, consistent, and predictable.
