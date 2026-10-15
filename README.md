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
├── 🔐 .env               ← 환경변수·API 키 (Git 제외, 절대 공유 금지)
│
├── 📂 tasks/             ← 작업 기록
│   ├── ✅ todo.md        ← 오늘 할 일 체크리스트
│   └── 📈 progress.md    ← 한 일 기록 (append-only)
│
├── 📂 scripts/           ← 자동화 스크립트
│   └── ⚙️ weather.ps1    ← 날씨·미세먼지 조회 (Open-Meteo, 키 불필요)
│
├── 📂 portfolio/         ← 포트폴리오 웹페이지
│   ├── 🌐 index.html
│   └── 📄 resume.html
│
├── 📂 docs/              ← 참고 자료
│   └── 📊 sales.csv
│
└── 📂 file-test/         ← 파일 정리 실습용
    └── images/           ← 샘플 이미지 (png)
```

> 💾 `*.bak` 백업 파일과 `.env`는 `.gitignore`로 GitHub에 올리지 않아요.

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
| [`portfolio/`](portfolio/) | 포트폴리오·이력서 웹페이지 | 포트폴리오 수정할 때 |
| `.gitignore` | GitHub에 올리지 않을 파일 목록 | 새 민감 파일이 생겼을 때 |

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
- 노출이 의심되면 → **[SECURITY.md](SECURITY.md)** 를 열고 순서대로 따라 해요.
