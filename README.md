<p align="center">
  <img src="./assets/openclaw-michael-hero.svg" alt="OpenClaw mascot wearing a white fedora and curly hair for Michael - custom by www.kugnus.com" width="100%" />
</p>

# Michael for OpenClaw

**김성욱 개인 사용 버전 OpenClaw. 이름은 Michael.**

Michael은 새 Mac이나 Windows PC에 성욱의 OpenClaw 작업환경을 빠르게 붙이기 위한 개인 부트스트랩 키트다.  
작업 규칙, Michael 정체성 파일, 기본 workspace 구조, 검증 스크립트를 한 번에 준비한다.

**커스텀 바이 [www.kugnus.com](https://www.kugnus.com)**

## 한 줄 요약

OpenClaw를 그냥 설치하는 repo가 아니라, **김성욱이 쓰는 방식으로 커스텀된 Michael 작업환경 배포판**이다.

## Michael이 최적화된 일

Michael은 내부 지침서 기준으로 **성욱의 개인 AI 개발 파트너**에 맞춰져 있다.  
단순 Q&A보다, 흐릿한 아이디어를 실행 가능한 프로젝트로 바꾸고 코드/설계/디버깅/운영을 같이 밀어붙이는 쪽에 최적화되어 있다.

- **실행형 개발 파트너:** 멋있어 보이는 말보다 실제로 굴러가는 구조, 흐름, 인터페이스, 다음 액션을 우선한다.
- **코드 작성과 수정:** 작동하는 코드, 읽기 쉬운 diff, 실행 명령어, 검증 방법을 중심으로 돕는다.
- **디버깅:** 감으로 찍지 않고 `가설 -> 검증 -> 원인 -> 수정 -> 재발 방지` 흐름으로 문제를 잡는다.
- **설계 판단:** 설계 허점, 과한 복잡도, 유지보수 리스크를 먼저 짚고 더 나은 선택지를 압축해서 제안한다.
- **주니어 개발자 지원:** 성욱이 AI 개발자로 전환 중인 주니어라는 전제를 반영해, 큰 작업을 작게 쪼개고 관찰 가능한 성공 기준을 준다.
- **프로젝트 운영:** `PROJECTS.md`, `memory/`, `docs/`, 검증 스크립트를 기준으로 프로젝트 상태와 다음 액션을 놓치지 않게 관리한다.
- **실전 AI 개발 스택:** Python, TypeScript, FastAPI, Next.js, Vercel, Render, OpenAI/LangChain/LangGraph 계열 작업에 빠르게 붙는 기준으로 세팅되어 있다.
- **직설적인 한국어 협업:** 담백하게 말하고, 문제나 숨은 리스크가 보이면 먼저 지적한다.

한마디로 Michael은 **비서형 챗봇이 아니라, 김성욱이 새 PC에서도 바로 데려갈 수 있는 개인 AI 개발팀 코어 멤버**다.

## One-touch Install

### macOS

```bash
git clone https://github.com/souluk319/Michael-bootstrap-OpenClaw-.git michael-bootstrap && cd michael-bootstrap && bash scripts/bootstrap-macos.sh
```

### Windows PowerShell

```powershell
git clone https://github.com/souluk319/Michael-bootstrap-OpenClaw-.git michael-bootstrap; cd michael-bootstrap; powershell -ExecutionPolicy Bypass -File .\scripts\bootstrap-windows.ps1
```

## What This Sets Up

- OpenClaw CLI
- ClawHub CLI
- Git / Node.js / Python checks
- Michael workspace identity files
- Standard project folders
- Local env template without secrets
- macOS / Windows verification scripts

## Included Michael Files

These files are copied into the target workspace:

- `AGENTS.md`
- `SOUL.md`
- `IDENTITY.md`
- `USER.md`
- `TOOLS.md`

Existing files are backed up before replacement.

## Workspace Target

Default workspace path on macOS:

```text
~/.openclaw/workspace
```

Default workspace path on Windows:

```text
%USERPROFILE%\.openclaw\workspace
```

## Verify After Install

### macOS

```bash
bash scripts/verify-macos.sh
```

### Windows

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify-windows.ps1
```

## Secrets Policy

This repo does **not** store secrets.

Do not commit:

- API keys
- OAuth tokens
- Apple account credentials
- Gmail tokens
- GitHub tokens
- production `.env` files
- local message databases

Manual auth still happens after bootstrap:

- GitHub CLI
- Gmail connector or `gog`
- OpenAI / API keys
- iMessage / macOS permissions if needed
- Vercel / Render / Supabase credentials when needed

See [`docs/secrets-and-auth.md`](docs/secrets-and-auth.md).

## Current Status

- macOS installer ready
- Windows installer ready
- workspace config templates included
- verification scripts included
- GitHub remote connected: `https://github.com/souluk319/Michael-bootstrap-OpenClaw-`
- Initial `main` push completed
