# GitHub Push Plan

Initial GitHub push completed on 2026-06-19.

## Current repo

```text
https://github.com/souluk319/Michael-bootstrap-OpenClaw-
```

Current branch:

```text
main
```

Observed visibility on 2026-06-19: `public`.

Recommended visibility remains `private` if this repo should not expose personal workspace rules.

## Pre-push safety checklist

Run before any future push:

```bash
git status
find . -maxdepth 3 -type f | sort
rg -n "sk-[A-Za-z0-9]|OPENAI_API_KEY=[A-Za-z0-9]|GITHUB_TOKEN=[A-Za-z0-9]|PASSWORD=[A-Za-z0-9]|SECRET=[A-Za-z0-9]|TOKEN=[A-Za-z0-9]" .
```

Expected:

- no real tokens
- no `.env.local`
- no OAuth client secret JSON
- no local message database

## First push flow used

```bash
git init -b main
git remote add origin https://github.com/souluk319/Michael-bootstrap-OpenClaw-.git
git add -A
git commit -m "Bootstrap Michael OpenClaw setup"
git push -u origin main
```

If `gh` is not authenticated:

```bash
gh auth login
```

## After push

On a new machine:

```bash
git clone https://github.com/souluk319/Michael-bootstrap-OpenClaw-.git
```

Then run the OS-specific bootstrap script.
