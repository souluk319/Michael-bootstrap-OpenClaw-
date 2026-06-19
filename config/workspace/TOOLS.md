# TOOLS.md - Local Notes

이 파일은 성욱의 **실제 개발 작업 기준 치트시트**다.
공유 스킬 문서가 아니라, 이 로컬 환경에서 바로 써먹을 수 있는 운영 메모를 적는다.

## Machine / Environment

- Machine: Mac mini (M4)
- RAM: 16GB
- Internal SSD: 512GB
- External SSD: 2TB (USB 3.2)
- OS: macOS

## Working Reality

성욱의 현재 스택은 "절대 규칙"이 아니라 "경험해 본 축"에 가깝다.
즉, 아래 기술들은 고정 신앙이 아니라 **빠르게 만들기 위한 기본 출발점**으로 본다.

- Languages: Python, TypeScript
- Frameworks: FastAPI, Next.js
- DB: MySQL, PostgreSQL, Vector DB
- Deployment: Vercel, Render
- AI stack: OpenAI, LangChain, LangGraph
- Common tools: Git, Node, Python venv

중요한 원칙:
- 특정 스택에 과몰입하지 않는다.
- 더 단순하고 빠른 방법이 있으면 갈아탄다.
- 이미 아는 것보다, 지금 문제를 더 잘 푸는 도구를 우선한다.

---

## 1. Development commands

### Git
```bash
git status
git diff
git add -A
git commit -m "message"
git log --oneline --decorate --graph -20
```

### Node / TypeScript
```bash
node -v
npm install
npm run dev
npm run build
npm run test
npx tsc --noEmit
```

### Python / venv
```bash
python3 --version
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pip freeze > requirements.txt
python -m pytest
```

### Useful project inspection
```bash
pwd
ls -la
find . -maxdepth 2 -type f | head
```

### General rule
- 새 프로젝트면 먼저 `README`, `package.json`, `pyproject.toml`, `requirements.txt`, `docker-compose.yml` 유무를 본다.
- 실행 전에 "뭘로 돌아가는 프로젝트인지"부터 판별한다.
- 모르면 일단 구조를 읽고, 추측으로 바로 설치부터 때리지 않는다.

---

## 2. Run / Build / Test commands

프로젝트마다 다르므로 아래를 **기본 후보군**으로 본다.
실행 전에 실제 스크립트를 확인한다.

### FastAPI
```bash
uvicorn app.main:app --reload
uvicorn main:app --reload
pytest
```

### Next.js
```bash
npm run dev
npm run build
npm run start
npm run lint
```

### Python package style
```bash
python -m pytest
python -m unittest
python main.py
```

### TypeScript / Node app
```bash
npm run dev
npm run build
npm run test
npm run lint
npx tsx src/index.ts
```

### Validation rule
실행 후에는 가능하면 최소한 이것 중 하나를 확인한다:
- 서버 기동 로그
- 로컬 HTTP 응답
- 테스트 통과
- 빌드 성공
- 타입 체크 성공

---

## 3. Ports I commonly use

정해진 법은 없지만, 아래를 기본 후보로 자주 고려한다.
충돌 나면 그때 조정한다.

- `3000` → Next.js / 프론트엔드
- `3001` → 대체 프론트엔드
- `8000` → FastAPI / Python API
- `8080` → 범용 웹 서비스 / 프록시 / 대체 서버
- `5432` → PostgreSQL
- `3306` → MySQL
- `6379` → Redis
- `11434` → Ollama 계열 로컬 AI

### Port rule
- 프로젝트 시작 시 포트는 README나 env에 명시한다.
- 포트 충돌은 "고장"이 아니라 "정리 부족"인 경우가 많다.
- 열려 있는 포트를 확인하고 움직인다.

Useful:
```bash
lsof -i :3000
lsof -i :8000
lsof -i :5432
```

---

## 4. Deployment workflow

배포는 "마지막에 아무튼 올리기"가 아니라, 로컬 검증 후 밀어 올리는 흐름으로 간다.

### Default deployment order
1. 변경 내용 요약
2. 로컬 실행 확인
3. 테스트/빌드 확인
4. 환경변수 확인
5. 배포 대상 확인
6. 배포
7. 배포 후 헬스체크
8. 로그/에러 확인

### Vercel
적합한 경우:
- Next.js 프론트엔드
- 빠른 웹 배포
- 작은 풀스택/프론트 중심 프로젝트

체크 포인트:
- env 누락
- API route 런타임 제한
- edge/serverless 동작 차이
- 빌드 에러

### Render
적합한 경우:
- API 서버
- 백그라운드 워커
- 지속 실행 프로세스
- DB 붙는 백엔드

체크 포인트:
- start command
- build command
- health check path
- env / secret
- free tier sleep 여부

### Deployment rule
- 배포 전엔 "무엇이 바뀌는지"를 한 줄로 설명 가능해야 한다.
- 배포 후엔 반드시 최소 1개 이상 실제 요청으로 확인한다.
- 배포 실패 시 감정적으로 재시도하지 말고 로그부터 본다.

---

## 5. Docker usage

Docker는 멋 부리기용이 아니라 **환경 차이 줄이기용**이다.
필요할 때 쓰고, 필요 없으면 억지로 올리지 않는다.

### Use Docker when
- 로컬 DB 띄울 때
- 팀/환경 간 실행 차이를 줄이고 싶을 때
- 의존성 충돌이 심할 때
- 배포 환경과 비슷하게 맞출 필요가 있을 때

### Common commands
```bash
docker ps
docker compose up -d
docker compose down
docker compose logs -f
docker compose build
```

### Docker rule
- 앱만 띄우는 데 Docker가 오히려 느리면 로컬 네이티브 실행도 허용한다.
- DB/인프라성 서비스는 Docker가 편할 때가 많다.
- "컨테이너는 떴는데 앱은 안 됨"이면 포트/볼륨/env부터 본다.

---

## 6. SSH / server workflow

서버 작업은 빠르게 하되, 함부로 하지 않는다.

### Default SSH workflow
1. 접속 대상 확인
2. 작업 목적 확인
3. 바꾸려는 범위 확인
4. 현재 상태 확인
5. 필요한 변경만 수행
6. 로그/프로세스/헬스체크 확인

### Check first
```bash
pwd
whoami
hostname
uname -a
ps aux | head
```

### Server rule
- 운영 서버에서는 추측성 수정 금지
- 무엇을 바꾸기 전에 현재 상태를 먼저 캡처
- 설정 파일 수정 전 백업 또는 diff 의식하기
- 재시작 필요한 작업은 영향도 먼저 말하기

### Preferred mindset
- 서버는 실험실이 아니다.
- "한번 해보자"는 로컬에서 하고, 서버에서는 검증된 것만 한다.

---

## Project folder structure

새 프로젝트 작업은 기본적으로 아래 구조를 사용한다.

```bash
/Users/kugnus/.openclaw/workspace/projects/
  experiments/
  active/
  archived/
```

### Folder rule
- 새 실험, 찍먹 MVP, 검증용 프로토타입은 `projects/experiments/` 아래에 만든다.
- 계속 개발할 가치가 확인된 프로젝트만 `projects/active/`로 올린다.
- 끝난 작업이나 참고용 보관 프로젝트는 `projects/archived/`로 이동한다.
- 가능하면 `tmp/`보다 `projects/experiments/`를 우선 사용한다.
- 프로젝트 폴더 이름은 목적과 기술이 드러나게 짓는다. 예: `openshift-fastapi-mvp`

---

## 7. Repo conventions

### Default repo habits
- 루트에 README가 없으면 추가를 고려한다.
- 실행/설치/환경변수 방법은 문서화한다.
- `.env.example`이 있으면 유지한다.
- 디렉토리 이름은 역할이 드러나게 짓는다.
- 하나의 파일이 너무 많은 책임을 먹기 시작하면 분리 시점을 본다.

### Commit style
- 커밋은 가능하면 의미 단위로 끊는다.
- 메시지는 "무엇을 왜 바꿨는지" 드러나게 쓴다.
- WIP가 길어지면 나중에 읽는 사람을 괴롭힌다. 미래의 나도 사람이다.

### Branching
기본적으로 단순하게 간다:
- 작은 개인 작업 → main 기반으로 빠르게 진행 가능
- 커지는 작업 → 기능 단위 브랜치

### Repo rule
- 문서 없는 프로젝트는 결국 구전 신화가 된다.
- 최소한 실행법, 구조, env는 남긴다.

---

## 8. Debugging notes

### Default debugging flow
1. 증상 정리
2. 재현 조건 확인
3. 로그 확인
4. 가설 수립
5. 하나씩 검증
6. 원인 확정
7. 수정
8. 재검증

### Check in this order
- 에러 메시지
- 최근 변경점
- 환경변수
- 포트 충돌
- 의존성 버전
- API 응답
- DB 연결
- 권한 문제

### Debugging rule
- 여러 곳을 동시에 고치지 않는다.
- 수정 전에 관측 포인트를 만든다.
- "아마 이거"를 줄이고, "이 로그 때문에 이게 원인"까지 간다.
- 고친 뒤에는 재발 방지책을 남긴다.

---

## 9. Things that usually break

이상하게 자주 망가지는 건 보통 비슷하다.

- `.env` 누락 또는 값 불일치
- 로컬/배포 환경의 Node 또는 Python 버전 차이
- 패키지 설치는 됐는데 실제 런타임 경로가 꼬임
- 포트 충돌
- DB 연결 문자열 오타
- CORS 설정 누락
- Vercel/Render 환경변수 누락
- Docker compose는 떴는데 서비스 간 연결 실패
- 상대 경로/작업 디렉토리 가정이 틀림
- 타입은 맞는데 런타임 데이터 shape가 다름
- LangChain/LangGraph 체인에서 상태 전달 구조가 꼬임
- OpenAI 모델명/권한/쿼터 문제

### Breakage rule
문제가 생기면 먼저 아래를 의심한다:
1. env
2. 경로
3. 포트
4. 버전
5. 설정
6. 최근 변경점

대부분의 버그는 우주적 미스터리가 아니라 설정 파일의 소심한 복수다.

---

## 10. Personal dev rules

### Working style
- 먼저 작게 성공시킨다.
- 돌아가는 최소 단위를 만든 뒤 키운다.
- 설명보다 실행 가능한 결과를 우선한다.
- 선택지는 많이 주지 말고, 판단 가능한 범위로 압축한다.

### Stack stance
- 주 언어/프레임워크는 참고값일 뿐 절대 기준이 아니다.
- 새로운 도구가 더 적합하면 유연하게 바꾼다.
- 도구 자랑보다 문제 해결을 우선한다.

### Quality bar
- 과설계 금지
- 불필요한 추상화 금지
- 하지만 운영에서 터질 리스크는 미리 본다.
- 유지보수성을 해치지 않는 선에서 속도를 확보한다.

### Communication rule
- 항상 핵심부터 말한다.
- 작업 전에는 짧은 계획을 먼저 제시한다.
- 추천안 1개와 대안 몇 개만 준다.
- 장황한 튜토리얼식 설명은 필요할 때만 한다.

### Safety rule
- 위험한 명령, 삭제, 외부 반영 전에는 확인한다.
- 서버/배포/데이터 관련 작업은 영향 범위를 먼저 본다.

### Final note
성욱은 특정 스택의 신도가 아니라, 배우고 만들고 확장하는 개발자다.
그러므로 TOOLS.md도 고정 매뉴얼이 아니라 **계속 진화하는 작업 기준서**로 유지한다.
