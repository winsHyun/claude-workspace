# 🗂️ claude-workspace

Claude Code와 함께 작업하는 **개인 작업 공간**이에요.
Claude가 따를 규칙, 할 일 기록, 보안 비상 매뉴얼을 한곳에 모아 두었어요.

---

## 📁 폴더 구조

```
claude-workspace/
├── 📜 CLAUDE.md          ← Claude Code 지침서 (자동으로 읽힘)
├── 🚨 SECURITY.md        ← 키 노출 비상 매뉴얼
├── 📖 README.md          ← 지금 보고 있는 이 파일
├── 🙈 .gitignore         ← Git에 올리지 않을 파일 목록
├── 📝 work.txt           ← 작업 요청 메모
├── 🌤️ weather.txt        ← 강남구 날씨·미세먼지 결과 (scripts/weather.ps1이 생성)
│
├── 🌐 portfolio.html     ← 포트폴리오 웹페이지 (Vercel 배포 대상)
├── ⚙️ vercel.json        ← Vercel 설정 (/ → 포트폴리오, 보안 헤더)
├── 🚧 .vercelignore      ← Vercel에 올릴 파일만 허용 (portfolio.html, vercel.json, gen-config.mjs)
│
├── 📂 tasks/             ← 작업 기록
│   ├── ✅ todo.md        ← 할 일 체크리스트
│   └── 📈 progress.md    ← 한 일 기록 (append-only)
│
├── 📂 scripts/           ← 자동화 스크립트
│   ├── ⚙️ weather.ps1    ← 날씨·미세먼지 조회 (Open-Meteo, 키 불필요)
│   └── 🧩 gen-config.mjs ← 배포 때 방명록용 config.js 생성 (Supabase 공개 키만 허용)
│
├── 📂 supabase/          ← 방명록 DB
│   └── 🗄️ messages.sql   ← 방명록 테이블·보안 정책 (SQL Editor에 붙여넣기)
│
├── 📂 docs/              ← 참고 자료
│   └── 📊 sales.csv
│
├── 📂 file-test/         ← 파일 정리 실습용
│   └── images/           ← 샘플 이미지 (png)
│
│  ── 아래는 내 PC에만 있고 GitHub에는 올라가지 않아요 ──
├── 🔐 .env               ← 환경변수·API 키 (절대 공유 금지)
├── 📄 이력서_*.doc       ← 개인 이력서 (포트폴리오 원본, .files 폴더 포함)
└── 💾 *.bak              ← 수정 전 백업 파일
```

> 🙈 `.env`, 이력서(`*이력서*`), `*.bak` 백업 파일은 `.gitignore`로 GitHub에 올리지 않아요.

---

## 📄 파일별 역할

| 파일 | 역할 | 언제 보나요? |
|---|---|---|
| [`CLAUDE.md`](CLAUDE.md) | Claude Code가 지킬 규칙 (보안, 소통 방식, 작업 원칙) | 규칙을 바꾸고 싶을 때 |
| [`SECURITY.md`](SECURITY.md) | 키가 노출됐을 때 따라 할 순서 (폐기 → 재발급 → 교체 → 이력 확인) | 🚨 **키 노출이 의심될 때 바로** |
| [`tasks/todo.md`](tasks/todo.md) | 오늘 할 일. 큰 작업은 여기에 계획부터 적어요 | 작업을 **시작할 때** |
| [`tasks/progress.md`](tasks/progress.md) | 한 일 요약. 지우지 않고 아래에 계속 추가해요 | 작업을 **끝낼 때** |
| `.env` | API 키, 비밀번호 같은 비밀값 보관 | 키를 교체할 때만 |
| `work.txt` | 작업 요청 메모 | 필요할 때 |
| [`scripts/weather.ps1`](scripts/weather.ps1) | 강남구 날씨·미세먼지를 받아 `weather.txt`에 저장 | 날씨 확인할 때 |
| [`portfolio.html`](portfolio.html) | 이력서를 바탕으로 만든 포트폴리오 (경력 타임라인, 기술 스택) | 경력·연락처가 바뀌었을 때 |
| [`vercel.json`](vercel.json) · `.vercelignore` | Vercel 배포 설정 · 공개할 파일 허용 목록 | 배포 방식을 바꿀 때 |
| [`scripts/gen-config.mjs`](scripts/gen-config.mjs) | Vercel 환경변수로 방명록 `config.js` 생성 (anon 키가 아니면 중단) | 방명록 설정을 바꿀 때 |
| [`supabase/messages.sql`](supabase/messages.sql) | 방명록 테이블과 보안 정책(RLS) | DB를 새로 만들 때 |
| `이력서_*.doc` | 포트폴리오의 원본 이력서 (Git 제외) | 포트폴리오를 다시 만들 때 |
| `.gitignore` | GitHub에 올리지 않을 파일 목록 | 새 민감 파일이 생겼을 때 |

---

## 🌐 포트폴리오 (`portfolio.html`)

이력서와 학습 기록을 한 페이지에 담은 웹페이지예요. 메뉴 순서대로 이런 섹션이 있어요.

| 섹션 | 내용 |
|---|---|
| 소개 | 총 경력·참여 프로젝트·발주기관 숫자, "지금도 학습 중" 배지 |
| 기술 | 언어·프레임워크·DB·클라우드·AI 도구 칩 |
| 📈 성장 | 직접 만든 앱·함께 일한 AI 에이전트 수·Claude Code 활용 단계, Claude Code 레벨업(Lv.1~6), 날짜별 학습 여정 |
| 🤖 바이브 코딩 | [VibeCoding](https://github.com/winsHyun/VibeCoding) 저장소의 실습 앱 **8개** 카드 |
| GitHub | 기여 달력·저장소 통계 |
| 경력 | 회사·프로젝트 타임라인 |
| 자격증 · 연락처 | 자격증 목록, 이메일·GitHub |
| 방명록 | Supabase에 저장되는 응원 메시지 |

**바이브 코딩 프로젝트 8개**

| # | 프로젝트 | 핵심 기술 |
|:-:|---|---|
| 01 | ✍️ 손글씨 숫자 인식기 | TensorFlow.js · Electron |
| 02 | ✅ 할 일 관리 앱 | HTML · CSS · JS · localStorage |
| 03 | 🧠 상식 퀴즈 게임 (기본) | HTML · CSS · JS |
| 03+ | 🎯 상식 퀴즈 게임 (고급) | 커스텀 슬래시 명령 14개 |
| 04 | 🥬 냉장고를 부탁해 | Express · OpenRouter · sharp · 서브 에이전트 3개 |
| 05 | 📔 공감 AI 다이어리 | Express · OpenRouter · 서브 에이전트 5개 |
| 05+ | 📄 PDF 한눈 요약 | unpdf · OpenRouter rerank · 워커 스레드 |
| 06 | 🛒 쇼핑 리스트 | Supabase · Vercel · HTML · CSS · JS |

> ✏️ 새로 학습하면 **배지 날짜, 성장 기록 숫자 3개, 학습 여정 목록, 프로젝트 카드**를 함께 갱신해요.

### 🚀 배포 (Vercel 자동 배포)

```
portfolio.html 수정  →  git commit  →  git push (main)  →  Vercel이 자동으로 빌드·배포
```

- Vercel이 GitHub 저장소와 연결돼 있어서 **`main`에 push하면 자동으로 배포**돼요.
- 빌드할 때 `scripts/gen-config.mjs`가 Vercel 환경변수(`SUPABASE_URL`, `SUPABASE_ANON_KEY`)로 `config.js`를 만들고, `portfolio.html`과 함께 `public/`에 복사해요.
- `.vercelignore`가 허용한 파일만 올라가서 `SECURITY.md`, `.env` 같은 파일은 공개되지 않아요.

---

## 🔄 하루 작업 흐름

```
1. 시작  →  tasks/todo.md 확인
2. 계획  →  큰 작업(3단계 이상)은 todo.md에 계획 → 확인 받고 진행
3. 실행  →  한 단계씩 바꾸고 → 실제로 돌려보고 → 다음 단계
4. 종료  →  tasks/progress.md에 한 일 기록
```

---

## 🔒 보안 한눈에 보기

- 비밀값은 **`.env`에만** 저장하고, 코드에는 환경변수 이름만 써요.
- `.env`, `*.key`, `*.pem`, `id_rsa`, `credentials` 파일은 **절대 Git에 올리지 않아요.**
- 이력서 파일은 `*이력서*` 규칙으로 Git에서 제외되고, 공개 포트폴리오에는 **이메일·GitHub만** 적어요.
- 노출이 의심되면 → **[SECURITY.md](SECURITY.md)** 를 열고 순서대로 따라 해요.
