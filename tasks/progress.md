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

## 2026-10-19 — 기술 스택에 Vercel·Supabase 추가

- `portfolio.html` 기술 스택: Database 칸에 `Supabase`, Cloud 칸에 `Vercel` 칩 추가 (백업: `portfolio.html.20261019-2.bak`)
- 확인: Edge 헤드리스 1200px 스크린샷에서 두 칩 정상 표시

## 2026-10-29 — 포트폴리오에 바이브 코딩 프로젝트 추가

- VibeCoding 레포 README 참고, `portfolio.html`에 `#vibe` 섹션 추가: 작업 흐름(아이디어→PRD→Claude Code→QA→개선) + 6개 프로젝트 카드(각 GitHub 폴더 링크)
- 메뉴에 "바이브 코딩", AI 기술 칩에 OpenRouter·TensorFlow.js 추가
- 카드 클래스는 `.vibe` 사용 → `.projects li`로 세는 "참여 프로젝트 28건"에 영향 없음
- 확인: GitHub 폴더 6개 모두 존재, Chrome 헤드리스 1280px 스크린샷 정상
- 소개 문장 수정: "…인프런 바이브 코딩 실습입니다." → "…앱을 만들어 보며 인프런 바이브 코딩 강의를 듣고 학습한 내용입니다."

## 2026-10-29 — "꾸준한 성장" 보여주기

- 첫 화면에 "지금도 학습 중 · 2026.10.29 업데이트" 배지(→ #growth) 추가
- 새 `#growth` "성장 기록" 섹션 (바이브 코딩 섹션 위)
  - 숫자: 학습 기간 16일(10.14~), 작업 기록한 날 10일, 직접 만든 앱 6개 — progress.md·VibeCoding 커밋 날짜 기준
  - Claude Code 레벨업 Lv.1~6 (스크롤 시 막대 애니메이션, 동작 줄이기 설정 시 정지)
  - 날짜별 학습 여정 10.14~10.29 (마지막 항목 "진행 중" 깜빡임)
- 메뉴에 "성장" 링크 추가
- 확인: Chrome 헤드리스 PC 1280px·모바일 스크린샷 정상
- 유지보수 메모: 새로 학습하면 배지 날짜, 숫자 3개, 학습 여정 목록을 함께 갱신
- 성장 기록 소개 문장 수정: "18년 차", "2026년 10월부터", "배운 것을 바로 이 사이트에 적용" 삭제 → "배움은 멈추지 않습니다. Claude Code로 AI와 함께 개발하는 법을 지속적으로 학습하고 있습니다."
- 성장 기록 숫자 칸 이름 "학습 기간 (10.14~)" → "학습 기간"

## 2026-10-29 — VibeCoding 최신 내용 반영 + README

- 참고 레포에 새로 생긴 "📄 PDF 한눈 요약"(Study-05 PDF) 카드 추가 → 바이브 코딩 프로젝트 7개
- 성장 기록 학습 여정 10.28·10.29 갱신
- README: 포트폴리오 섹션 구성, 프로젝트 7개 표, Vercel 자동 배포 흐름, `scripts/gen-config.mjs`·`supabase/` 추가
- 커밋 4798743 push → Vercel 배포 성공, 배포 페이지에 새 카드·"7개" 확인
  - 참고: GitHub 배포 조회(`deployments?sha=`)는 커밋 번호 전체를 넣어야 찾아짐

## 2026-10-29 — 포트폴리오 디자인 다듬기 (mayeye.net 색감 참고)

- 백업: `portfolio.html.20261029-design.bak`
- 다크 → 라이트 테마: 흰 배경, 초록 포인트(#0fa958, 글자는 #0a7f42로 대비 5:1), 파랑→초록→주황 그라데이션, 섹션 흰/회색 번갈아
- 첫 화면: 점 격자 배경, 별똥별 캔버스(화면 밖이면 정지), 이름 그라데이션, 터미널 뒤 궤도 점
- 인터랙션: 카드 커서 빛(mix-blend multiply), 떠오르기, 화살표 이동, 버튼 자석 효과, 차례 등장, 메뉴 그라데이션 밑줄
  - 3D 기울기는 Windows 크롬에서 글자가 흐려져서 제외
  - 기존 버그 수정: `.js .reveal.in`이 hover transform을 덮어씀 → `:where(.js)`로 우선순위 낮춤
- 폭 960→1120px, 제목 크게 + 아이콘 상자, 카드 둥글기 16px·그림자 통일, 모바일 섹션 여백 72px
- 성장 기록 숫자: 학습 기간·작업한 날(며칠) → 직접 만든 앱 7개 · 함께 일한 AI 에이전트 8개 · Claude Code 활용 단계 6단계
- 확인: 헤드리스 크롬(DevTools 프로토콜)으로 PC 1280·모바일 390/500 스크린샷, hover 시 transform 값, 메뉴 강조, 콘솔 오류 0건
- 유지보수 메모: 새 앱·에이전트가 생기면 숫자 칸과 학습 여정, 배지 날짜 갱신
- 배포(73f772c) 확인: 성공, 새 디자인·config.js(anon) 반영, 비공개 파일 404 유지, 콘솔 오류 0건, hover 동작 정상
- ⚠️ 방명록 "불러오지 못했어요": Supabase 프로젝트 주소가 DNS에서 사라짐(NXDOMAIN) → 무료 프로젝트 일시정지 추정(마지막 사용 10.19)
  - 이번 변경과 무관. 사용자가 Supabase 대시보드에서 Restore project 필요 → 복구 후 재확인
- 학습 여정 10.29 항목 "진행 중…" → "라이트 테마로 새 단장, 완료" (깜빡이는 점 제거)

## 2026-10-29 — 배경 캐릭터 추가 (pickle.com 분위기 참고)

- 화면 아래 바닥을 걸어다니는 캐릭터 7종을 직접 SVG로 그려 추가: 새싹 말랑이·꼬마 유령·주황 버섯·치즈 고양이·파랑 로봇·반짝 별·보라 젤리곰 (모양·색·크기·속도·말풍선 모두 다름)
- 동작: 걷기/쉬기 반복, 눈 깜빡임, 눈이 마우스 따라봄, 마우스 가까이 가면 멈춰서 쳐다봄, 클릭하면 점프+하트, 가끔 말풍선
- 모바일은 3마리·80% 크기, 동작 줄이기 설정이면 표시 안 함, 캐릭터 없는 곳은 아래 화면 클릭 그대로 됨
- 확인: PC 7마리/모바일 3마리 이동, 클릭 점프·하트, 콘솔 오류 0건 (헤드리스 Chrome)
- 백업: portfolio.html.20261029-critter.bak
