HOWTO.md

AegisIntel — Git Workflow Guide

This document explains how to work with Git in this project.

The workflow is intentionally simple but structured enough to avoid mistakes.

---

Branches used

We use only two branches:

- main → stable version (production-ready)
- dev → development branch (active work)

---

Core principles

- Never work directly on main
- All changes go through dev
- main only receives stable code via Pull Request
- Keep commits clean and meaningful

---

First-time setup

Clone the repository:

git clone https://github.com/felipealfonsog/aegisIntel.git
cd aegisIntel

Switch to dev:

git checkout dev
git pull origin dev

---

Daily workflow

1. Always update before working

git checkout dev
git pull origin dev

---

2. Make your changes

Edit files normally.

Check current state:

git status

---

3. Add changes

git add .

---

4. Commit

git commit -m "Clear and specific message"

Good examples:

- Add root API endpoint
- Improve IOC validation logic
- Refactor enrichment engine
- Fix CLI JSON output formatting

Bad examples:

- update
- changes
- fix stuff

---

5. Push

git push

---

Pull Request process (dev → main)

When dev is stable:

1. Go to GitHub
2. Open repository
3. Go to Pull Requests
4. Click New Pull Request
5. Set:

base = main  
compare = dev  

6. Add a clear title and description
7. Create Pull Request
8. Merge

---

After merging

Update your local repository:

git checkout main
git pull origin main

git checkout dev
git pull origin dev

---

Useful commands

Check current branch:

git branch

---

Check status:

git status

---

Pull latest changes:

git pull

---

Fetch updates without merging:

git fetch origin

---

Safe workflow summary

1. work only on dev  
2. always pull before starting  
3. commit clearly  
4. push regularly  
5. merge dev into main when stable  

---

Important rules

- main must always stay clean and stable
- dev is the only working branch
- no feature branches for now (keep it simple)
- avoid large unstructured commits

---

If something goes wrong

Run:

git status

This command will tell you:

- which branch you are on
- what changed
- what is staged or not

Do not run random commands without understanding the state.

---

Final note

This project follows a minimal and practical workflow:

main = stable  
dev = development  

Simplicity is intentional. Complexity will be added only when needed.
