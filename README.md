<p align="center">
  <img src="./assets/openclaw-michael-hero.svg" alt="OpenClaw mascot wearing a white fedora and curly hair for Michael - custom by www.kugnus.com" width="100%" />
</p>

# Michael for OpenClaw

**김성욱 개인 사용 버전 OpenClaw입니다. 이름은 Michael입니다.**

Michael은 새 Mac이나 Windows PC에 성욱의 OpenClaw 작업환경을 빠르게 붙이기 위한 개인 부트스트랩 키트입니다.
작업 규칙, Michael 정체성 파일, 기본 workspace 구조, 검증 스크립트를 한 번에 준비합니다.

**커스텀 바이 [www.kugnus.com](https://www.kugnus.com)**

## 한 줄 요약

OpenClaw를 그냥 설치하는 repo가 아니라, **김성욱이 쓰는 방식으로 커스텀된 Michael 작업환경 배포판**입니다.

## Michael이 최적화된 일

Michael은 내부 지침서 기준으로 **성욱의 개인 AI 개발 파트너**에 맞춰져 있습니다.
단순 Q&A보다, 흐릿한 아이디어를 실행 가능한 프로젝트로 바꾸고 코드/설계/디버깅/운영을 함께 밀어붙이는 쪽에 최적화되어 있습니다.

- **실행형 개발 파트너:** 멋있어 보이는 말보다 실제로 굴러가는 구조, 흐름, 인터페이스, 다음 액션을 우선합니다.
- **코드 작성과 수정:** 작동하는 코드, 읽기 쉬운 diff, 실행 명령어, 검증 방법을 중심으로 돕습니다.
- **디버깅:** 감으로 찍지 않고 `가설 -> 검증 -> 원인 -> 수정 -> 재발 방지` 흐름으로 문제를 잡습니다.
- **설계 판단:** 설계 허점, 과한 복잡도, 유지보수 리스크를 먼저 짚고 더 나은 선택지를 압축해서 제안합니다.
- **주니어 개발자 지원:** 성욱이 AI 개발자로 전환 중인 주니어라는 전제를 반영해, 큰 작업을 작게 쪼개고 관찰 가능한 성공 기준을 제공합니다.
- **프로젝트 운영:** `PROJECTS.md`, `memory/`, `docs/`, 검증 스크립트를 기준으로 프로젝트 상태와 다음 액션을 놓치지 않게 관리합니다.
- **실전 AI 개발 스택:** Python, TypeScript, FastAPI, Next.js, Vercel, Render, OpenAI/LangChain/LangGraph 계열 작업에 빠르게 붙는 기준으로 세팅되어 있습니다.
- **직설적인 한국어 협업:** 담백하게 말하고, 문제나 숨은 리스크가 보이면 먼저 짚어드립니다.

한마디로 Michael은 **김성욱이 새 PC에서도 같은 방식으로 다시 붙일 수 있는 개인 AI 개발 파트너 환경**입니다.

## 현실적인 포지션

이 repo는 OpenClaw 자체를 대체하거나, 새로운 AI 모델을 만드는 프로젝트가 아닙니다.
현재 버전의 핵심은 **OpenClaw 자동 설치 흐름 + Michael 프롬프트/작업규칙/워크스페이스 템플릿**입니다.

즉, 거창한 완제품이라기보다 **개인 AI 개발 파트너 환경을 빠르게 재현하는 bootstrap/config pack**에 가깝습니다.

다만 목표는 분명합니다. 이 작은 키트를 더 안정적이고, 더 안전하고, 더 쓰기 좋은 **개인 AI 개발 파트너 제품 경험**으로 발전시키는 것입니다.

## Michael을 더 좋게 만들어주세요

Michael은 성장 중인 개발자인 김성욱이 실제로 매일 쓰기 위해 만든 개인 AI 개발 파트너 환경입니다.

그래서 이 프로젝트는 단순한 설치 스크립트에 머무르지 않고, 주니어 개발자가 더 빠르게 배우고, 더 안전하게 만들고, 더 좋은 판단을 할 수 있게 돕는 OpenClaw 기반 작업환경을 목표로 합니다.

다른 개발자들의 조언, 개선 아이디어, issue, PR을 환영합니다.

특히 이런 피드백이 도움이 됩니다:

- 주니어 개발자가 실수하기 쉬운 설치/환경 설정 개선
- 더 안전한 시크릿 관리 방식
- 더 좋은 프로젝트 구조와 문서화 방식
- 디버깅/테스트/배포 흐름 개선
- Michael이 더 좋은 개발 파트너처럼 행동하도록 만드는 지침 개선
- 다른 개발자도 자기만의 Michael을 만들 수 있는 확장 구조
- macOS/Windows 원터치 설치 안정화

김성욱이 더 좋은 Michael을 사용할 수 있도록, 그리고 다른 개발자들도 자기만의 AI 개발 파트너를 만들 수 있도록 함께 발전시켜 주세요.

## 원터치 설치

### macOS

```bash
git clone https://github.com/souluk319/Michael-bootstrap-OpenClaw-.git michael-bootstrap && cd michael-bootstrap && bash scripts/bootstrap-macos.sh
```

### Windows PowerShell

```powershell
git clone https://github.com/souluk319/Michael-bootstrap-OpenClaw-.git michael-bootstrap; cd michael-bootstrap; powershell -ExecutionPolicy Bypass -File .\scripts\bootstrap-windows.ps1
```

## 설치되는 항목

- OpenClaw CLI
- ClawHub CLI
- Git / Node.js / Python 확인
- Michael workspace 정체성 파일
- 표준 프로젝트 폴더
- 시크릿이 없는 로컬 env 템플릿
- macOS / Windows 검증 스크립트

## 포함된 Michael 파일

아래 파일을 대상 workspace로 복사합니다:

- `AGENTS.md`
- `SOUL.md`
- `IDENTITY.md`
- `USER.md`
- `TOOLS.md`

기존 파일은 교체 전에 백업합니다.

## 기본 workspace 위치

macOS 기본 workspace 경로입니다:

```text
~/.openclaw/workspace
```

Windows 기본 workspace 경로입니다:

```text
%USERPROFILE%\.openclaw\workspace
```

## 설치 후 확인

### macOS

```bash
bash scripts/verify-macos.sh
```

### Windows

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify-windows.ps1
```

## 시크릿 관리

이 repo에는 시크릿을 저장하지 않습니다.

아래 항목은 커밋하지 마세요:

- API keys
- OAuth tokens
- Apple account credentials
- Gmail tokens
- GitHub tokens
- production `.env` files
- local message databases

아래 인증은 bootstrap 이후 직접 연결해 주세요:

- GitHub CLI
- Gmail connector or `gog`
- OpenAI / API keys
- iMessage / macOS permissions if needed
- Vercel / Render / Supabase credentials when needed

자세한 내용은 [`docs/secrets-and-auth.md`](docs/secrets-and-auth.md)를 확인해 주세요.

## 현재 상태

- macOS 설치 스크립트 준비 완료
- Windows 설치 스크립트 준비 완료
- workspace 설정 템플릿 포함
- 검증 스크립트 포함
- GitHub remote 연결 완료: `https://github.com/souluk319/Michael-bootstrap-OpenClaw-`
- 최초 `main` push 완료
