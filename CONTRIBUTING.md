#### CONTRIBUTING.md

##### Contributing to AegisIntel

Thank you for your interest in contributing to AegisIntel.

This document defines how contributions should be made to keep the project clean, consistent, and maintainable.

---

##### Project philosophy

AegisIntel is designed as a defensive threat intelligence platform.

Key principles:

- clarity over complexity
- modular architecture
- real-world applicability
- defensive-first mindset

---

##### Development workflow

All work is done on the `dev` branch.

The `main` branch is reserved for stable versions only.

##### Workflow

1. Pull latest changes from dev:

git checkout dev  
git pull origin dev  

2. Make your changes

3. Add and commit:

git add .  
git commit -m "Clear and specific message"

4. Push:

git push

---

##### Pull Requests

All changes must go through Pull Requests.

##### Base rules

- base branch: `main`
- compare branch: `dev`

##### PR requirements

- clear title
- clear description
- describe what was changed
- explain why it was changed

Example:

Title:
Improve IOC validation logic

Description:
Refactors validation logic to improve domain parsing and edge case handling.

---

##### Code guidelines

##### General

- keep code simple and readable
- avoid unnecessary abstractions
- prefer explicit logic over "magic"

##### Structure

- respect existing project structure
- do not mix responsibilities across modules

##### Naming

- use clear, descriptive names
- avoid abbreviations unless standard

---

##### Commit guidelines

Write meaningful commit messages.

##### Good examples

- Add root API endpoint
- Implement basic enrichment engine
- Refactor validation utilities
- Add unit tests for validators

##### Bad examples

- update
- fix
- changes

---

##### Testing

Whenever possible:

- add tests for new features
- ensure existing tests pass

Run tests with:

pytest

---

##### What not to do

- do not commit directly to main
- do not introduce breaking changes without explanation
- do not mix multiple unrelated changes in one commit

---

##### Issues and discussions

Use GitHub Issues to:

- report bugs
- propose features
- discuss improvements

---

##### Scope of contributions

Relevant contributions include:

- IOC enrichment improvements
- new OSINT integrations
- correlation logic
- performance improvements
- API enhancements
- CLI improvements

---

##### Final note

AegisIntel is intended to grow as a serious, structured security project.

Consistency, clarity, and discipline in contributions are more important than speed.
