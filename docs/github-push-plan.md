# GitHub Push Plan

GitHub push is intentionally deferred.

## Recommended repo

```text
michael-bootstrap
```

Recommended visibility:

```text
private
```

## Pre-push safety checklist

Run before first push:

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

## First push flow

```bash
git init
git add -A
git commit -m "Bootstrap Michael OpenClaw setup"
gh repo create souluk319/michael-bootstrap --private --source . --remote origin --push
```

If `gh` is not authenticated:

```bash
gh auth login
```

## After push

On a new machine:

```bash
git clone git@github.com:souluk319/michael-bootstrap.git
```

Then run the OS-specific bootstrap script.
