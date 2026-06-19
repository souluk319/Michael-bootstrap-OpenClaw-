# Secrets And Auth

This repo must stay safe to push to a private GitHub repository.

## Never commit

- `.env`
- `.env.local`
- OAuth tokens
- API keys
- Apple credentials
- Gmail credentials
- Google client secrets
- GitHub tokens
- Vercel tokens
- Render tokens
- Supabase service role keys
- local message databases

## Local env

Each machine gets:

```text
~/.openclaw/workspace/.env.local
```

This file is copied from:

```text
templates/.env.example
```

Fill values manually on each PC.

## Auth checklist

### GitHub

Install GitHub CLI separately if needed.

```bash
gh auth login
gh auth status
```

### Gmail / Google Workspace

Preferred in OpenClaw:

- use the Gmail connector when available
- use `gog` only after `gog auth list` confirms tokens exist

`gog` setup:

```bash
gog auth credentials /path/to/client_secret.json
gog auth add your@gmail.com --services gmail,calendar,drive,contacts,docs,sheets
gog auth list
```

### OpenAI

Set locally:

```text
OPENAI_API_KEY=<fill locally>
```

### iMessage

macOS only.

Check:

- Messages.app signed in
- required OpenClaw/automation permissions granted
- target chat can receive iMessage

### Project credentials

Set these only on machines that need them:

- Vercel
- Render
- Supabase
- database URLs
- public API keys

## Rule

Bootstrap installs the body.  
Auth connects the nerves.  
Do not weld the nerves into GitHub.
