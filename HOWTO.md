# HOWTO.md

# AegisIntel — Quick Git Workflow Guide

This document explains the basic Git workflow for collaborators working on AegisIntel.

Its purpose is to keep the project clean, avoid mistakes, and make collaboration easier.

---

## Branches used in this project

The repository uses the following branch structure:

- main → stable branch
- dev → integration branch
- feature/* → work branches for specific tasks

Examples:

- feature/ioc-validation
- feature/enrichment-engine
- feature/cli-initial
- feature/api-initial

---

## General rule

Do not work directly on main.

Do not commit random changes to dev unless explicitly agreed.

All work should be done in a dedicated feature/* branch.

---

## First-time setup

Clone the repository:

git clone https://github.com/felipealfonsog/aegisIntel.git
cd aegisIntel

Switch to the development branch:

git checkout dev
git pull origin dev

---

## Basic daily workflow

### 1. Move to dev

Before starting new work:

git checkout dev
git pull origin dev

---

### 2. Create or switch to your feature branch

If the branch already exists:

git checkout feature/ioc-validation
git pull origin feature/ioc-validation

If creating a new branch:

git checkout dev
git pull origin dev
git checkout -b feature/my-new-feature
git push -u origin feature/my-new-feature

---

### 3. Work on your changes

Check changes:

git status

---

### 4. Add and commit

git add .

git commit -m "Clear and specific message"

Examples:

- Add domain validation tests
- Refactor enrichment engine
- Add API health endpoint

Avoid:

- fix stuff
- changes
- update

---

### 5. Push changes

git push

First time:

git push -u origin feature/ioc-validation

---

## Creating a Pull Request

1. Go to GitHub
2. Open repository
3. Go to Pull Requests
4. Click New Pull Request
5. Set:

base = dev  
compare = your feature branch  

6. Add title and description  
7. Create Pull Request  

---

## After merge

Update your local repo:

git checkout dev
git pull origin dev

Delete local branch (optional):

git branch -d feature/ioc-validation

Delete remote branch (optional):

git push origin --delete feature/ioc-validation

---

## Useful commands

Check current branch:

git branch

---

Check status:

git status

---

See remote branches:

git branch -r

---

Fetch updates:

git fetch origin

---

Pull updates:

git pull

---

## Safe workflow summary

1. update dev  
2. create or switch to feature branch  
3. work  
4. git add .  
5. git commit  
6. git push  
7. open PR to dev  

---

## Important rules

Never work directly on main.

Always start from dev.

Always pull before working.

Commit clearly.

Check git status often.

---

## Example workflow

git checkout dev
git pull origin dev
git checkout -b feature/example-task
git push -u origin feature/example-task

git add .
git commit -m "Add example feature"
git push

Then create PR:

feature/example-task → dev

---

## If something goes wrong

Run:

git status

Check current branch and state before doing anything else.

---

## Final note

This project uses a simple professional workflow:

- main = stable
- dev = integration
- feature/* = development

Follow this and everything stays clean and predictable.
