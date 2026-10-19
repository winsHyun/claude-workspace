# 📝 PROGRESS

> 한 일 요약. **추가만 하고(append-only) 지우지 않습니다.** 최신 기록이 아래에 쌓입니다.

---

## 2026-10-14

- `tasks/` 폴더 생성
- `tasks/todo.md` 생성 — 작업 환경 구축 계획 작성
- `tasks/progress.md` 생성 (이 파일)
- `CLAUDE_.md` → `CLAUDE.md` 이름 변경 (원본 백업: `CLAUDE_.md.bak`, 내용 동일 확인)
- `SECURITY.md` 작성 — 키 노출 비상 매뉴얼 (OpenRouter / Oracle SSH / WordPress / Git 대처 / 예방 수칙)
- `README.md` 작성 — 폴더 구조, 파일별 역할, 작업 흐름 정리
- 참고: `CLAUDE.md` 안의 경로(`D:\claude-workspace`)는 실제 경로(`D:\study\inflearn\claude-workspace`)와 다름 — 수정 보류
- `file-test` 폴더 정리: 이미지 7개 → `images/`, 문서 3개(pdf·pptx) → `docs/` (`mv -n`, 덮어쓰기 없음, 총 10개 유지 확인)
  - 백업은 사용자 요청으로 생략, `misc/`는 해당 파일 없어 미생성
- `scripts/weather.ps1` 작성 — Open-Meteo(키 불필요)로 강남구 날씨·미세먼지 조회 → `weather.txt` 덮어쓰기 저장
  - 직접 실행 2회 확인 (정상 저장, 덮어쓰기 동작 확인). 작업 스케줄러 등록은 사용자 요청으로 하지 않음
- `portfolio/index.html` 작성 — 포트폴리오 웹페이지 (소개·경력 3개(예시)·연락처(가짜 주소), 반응형·다크모드). 데스크톱·모바일(390px) 화면 캡처로 확인 후 브라우저에서 열기
- `portfolio/resume.html` 작성 — resume.pdf 기준 포트폴리오 (김수민, 경력 2 + 대표 프로젝트 1, 핵심 성과·스킬·연락처). 기존 index.html은 유지. 데스크톱·모바일(390px) 캡처 확인 후 브라우저에서 열기

## 2026-10-15 — GitHub 업로드

- gh는 이미 설치되어 있었음 (v2.102.0, winsHyun 로그인 상태) → 설치 생략
- `.gitignore` 생성: `.env`, `*.key`, `*.pem`, `id_rsa*`, `*credentials*`, `*.bak`, OS 임시 파일 제외
- `README.md` 폴더 구조 업데이트 (백업: `README.md.bak`)
- 작업 도중 사용자가 필요 없는 파일 8개(pdf, pptx, 이미지)를 직접 삭제 → 남은 15개 파일로 진행
- 첫 커밋 `addc007 Initial setup` → https://github.com/winsHyun/claude-workspace (PRIVATE 확인, `.env` 미포함 확인)

## 2026-10-15 — 포트폴리오 다크모드

- `feature/dark-mode` 브랜치에서 `portfolio/index.html`, `resume.html`을 항상 다크로 변경 (밝은 색 설정 삭제, `color-scheme: dark` 추가)
- Edge 헤드리스로 밝은 모드 설정에서 열어 스크린샷 → 두 페이지 모두 어두운 배경 확인
- main에 머지(fast-forward) 후 push: `896cafe Make portfolio always dark mode` → GitHub 내용 확인
- `work.txt`는 사용자가 수정 중이라 커밋하지 않음

## 2026-10-15 — 포트폴리오 Vercel 배포 준비

- 작업 폴더에서 `portfolio/` 폴더가 지워지고 최상위에 `portfolio.html` 이 생겨 있었음 → 사용자 선택: `portfolio.html` 기준으로 유지
- `portfolio/index.html` (← `portfolio.html`, 내용 동일) + `portfolio/vercel.json` (cleanUrls, 보안 헤더) 구성
- 최상위 `portfolio.html` → `portfolio.html.bak` 백업, `resume.html` 삭제 반영 (git 기록에서 복구 가능)
- 로컬 서버(`npx serve`)로 확인: HTTP 200, 제목 "Hyunjo · Portfolio" 정상
- 커밋 `3f84c59` → GitHub push 완료
- 남은 일(사용자): Vercel에서 Import 후 **Root Directory = `portfolio`** 로 지정해 배포

## 2026-10-15 — 포트폴리오 배포 구조 변경 (최상위 기준)

- 사용자가 `portfolio/` 폴더를 지우고 `portfolio.html`, `vercel.json` 을 최상위로 옮김 → 이 구조로 배포 준비
- 최상위 배포 시 SECURITY.md 등이 공개되는 문제 → `.vercelignore` 허용 목록(`/*`, `!portfolio.html`, `!vercel.json`) 추가
- `vercel.json` 에 `/` → `/portfolio.html` rewrite 추가
- 확인: 임시 git 저장소로 규칙 검사 → 올라가는 파일은 `portfolio.html`, `vercel.json` 2개, 14개 제외
- 확인: 허용 파일만 담아 로컬 서버 실행 → `/` 200(포트폴리오), `/SECURITY.md`·`/work.txt` 404
- 남은 일(사용자): Vercel Import 시 Root Directory 비워두기, 배포 후 `/SECURITY.md` 404 직접 확인

## 2026-10-18 — portfolio.html 현행화

- `이력서_20261018.doc`(Word가 HTML로 저장한 파일)에서 내용을 뽑아 `portfolio.html`을 새로 작성 (백업: `portfolio.html.bak`)
- 구성: 소개 + 터미널 타이핑 카드, 숫자 카운트업(경력·프로젝트 28건·발주기관 7곳), 기술 스택 6분류, 2007→현재 연도 막대 + 기술 필터 + 경력 타임라인 14건, 자격증, 연락처
- 아이콘: GitHub Octicons(@primer/octicons 19.15.0) 20개를 SVG로 페이지 안에 넣음 → 외부 요청 없이 표시
- 공개 페이지라 휴대폰 번호·나이·병역·희망연봉은 제외 (사용자 선택: 이메일·GitHub만), 운전면허는 직무와 무관해 제외
- 확인: Edge 헤드리스로 1280px·390px 화면 스크린샷 → 레이아웃·필터 개수·재직 기간 자동 계산(3년 9개월) 정상
- `README.md` 폴더 구조 갱신 (백업: `README.md.bak`), `.gitignore`의 `*이력서*` 규칙으로 이력서 미포함 확인

## 2026-10-18 — 포트폴리오 문구 수정 + GitHub 커밋 달력

- 제목 "공공 SI 18년차," → "안녕하세요," 로 변경 (페이지 설명 문구에서도 제거)
- "GitHub 활동" 섹션 추가: 최근 1년 기여 달력(53주×7일), 총 기여·활동한 날·최장 연속·최근 활동
  - 데이터: github-contributions-api.jogruber.de (GitHub 공개 기여 기록, 키 불필요) → 페이지 열 때마다 최신 기록
  - 불러오기 실패 시 안내 문구 + GitHub 링크 표시
- 확인: 1200px·390px 화면에서 달력 표시 확인 (17건, 7일, 최장 4일, 최근 10월 18일)

## 2026-10-19 — 포트폴리오 방명록 (Supabase)

- `supabase/messages.sql`: `messages`(id, name, content, created_at) + 길이 제한(이름 30·메시지 500) + RLS(누구나 읽기·쓰기, 수정·삭제 정책 없음) + 방문자는 `name`, `content` 컬럼만 INSERT 가능 → 사용자가 SQL Editor에서 실행
- `.env.local`(URL, anon 키) 생성 — 기존 `.gitignore`의 `.env.*` 규칙으로 제외 확인
- `scripts/gen-config.mjs`: `.env.local` → `config.js` 생성 (anon 키가 아니면 멈춤), `config.js`는 `.gitignore`에 추가
- `portfolio.html`: 연락처 아래 방명록 섹션(폼 + 최신 50개 목록) + 메뉴 링크, Supabase REST를 `fetch`로 직접 호출, 글은 `textContent`로 표시 (백업: `portfolio.html.20261019.bak`)
- 확인(REST): 읽기 200, 작성 201, 작성시간 조작 401, 빈 이름 400(check 제약), 수정·삭제 0건(RLS 차단)
- 확인(Edge 헤드리스): 페이지에 테스트 글 표시, PC 1280px·모바일 390px 스크린샷 정상
  - 참고: 헤드리스 Edge는 `#앵커` 주소로 찍으면 검은 화면(기존 페이지도 동일), 390px 요청 시 실제 폭 496px → 임시 복사본에서 다른 섹션 숨기고 폭 고정해 촬영
- 테스트 글 1건("테스트") DB에 남아 있음 → 대시보드 Table Editor에서 삭제 필요
- 남은 일: 브라우저에서 폼 직접 제출 테스트(사용자), Vercel 배포 설정(`.vercelignore`, 환경변수, config.js 생성), 커밋

## 2026-10-19 — Vercel 방명록 "config.js를 찾지 못했어요" 해결

- 원인: `config.js`는 `.gitignore`로 GitHub에 없고, `.vercelignore`가 `scripts/`도 막아 Vercel에서 생성 불가
- 사용자가 Vercel 환경변수 `SUPABASE_URL`, `SUPABASE_ANON_KEY` 등록
- `.vercelignore`: `scripts/gen-config.mjs`만 추가 허용 (백업 `.vercelignore.bak`)
- `vercel.json`: `buildCommand` = config.js 생성 → `public/`에 `portfolio.html`, `config.js`만 복사, `outputDirectory: "public"` (백업 `vercel.json.bak`)
  - 1차(79ce1d3) 실패: 스크립트 exit 1(환경변수 수정 후 해결) → `No Output Directory named "public"` → 2차(a8eebc6)에서 public 출력으로 해결
- 확인(a8eebc6 배포): `/`·`/config.js` 200, `/SECURITY.md`·`/.env.local`·`/vercel.json`·`/scripts/gen-config.mjs`·`/work.txt` 404, 배포된 config.js role=anon, 방명록 읽기 200(글 2개)
- 남은 일: `work.txt` 추적 해제(`git rm --cached`) 여부 결정, `.gitignore` 변경 미커밋
