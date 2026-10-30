# 📋 TODO

> 오늘 할 일 체크리스트. 작업 시작 시 확인하고, 끝나면 체크(`[x]`)합니다.

## 2026-10-14 — 작업 환경 구축

- [x] 1. `tasks/` 폴더 + `todo.md`, `progress.md` 생성
- [x] 2. `SECURITY.md` 비상 매뉴얼 작성
  - 키 노출 의심 시 즉시 할 일 (폐기 → 재발급 → 환경변수 교체 → 사용 이력 확인)
  - 서비스별 절차: OpenRouter API 키 / Oracle 서버 SSH 키 / WordPress 비밀번호
  - Git에 키가 올라간 경우 대처법
  - 예방 체크리스트 (`.gitignore` 등)
- [x] 3. `README.md` 작성 — 폴더 구조와 각 파일의 역할 정리
- [x] 4. `CLAUDE_.md` → `CLAUDE.md` 이름 변경 (백업: `CLAUDE_.md.bak`)
- [x] 5. 완료 후 `progress.md`에 기록

## 2026-10-14 — file-test 폴더 정리

- [~] 1. 백업: 사용자 요청으로 건너뜀
- [x] 2. `images/`, `docs/` 폴더 생성 (`misc/`는 해당 파일 없음 → 만들지 않음)
- [x] 3. 이미지 7개 → `images/` (png, jpg)
- [x] 4. 문서 3개 → `docs/` (pdf, pptx)
- [x] 5. 이동 시 같은 이름 파일이 있으면 덮어쓰지 않고 중단 (`mv -n`)
- [x] 6. 결과 확인 (파일 수 10개 그대로인지) → `progress.md`에 기록

## 2026-10-14 — 강남구 날씨·미세먼지 자동 저장

- [x] 1. `scripts/weather.ps1` 작성 (PowerShell — 이 PC에 Python 없음)
  - 날씨: Open-Meteo Forecast API (키 불필요)
  - 미세먼지: Open-Meteo Air Quality API (키 불필요)
  - 강남구 좌표 37.5172, 127.0473
  - 결과를 `weather.txt`에 덮어쓰기 저장 (사용자 요청으로 변경)
  - 미세먼지 등급은 환경부 기준(좋음/보통/나쁨/매우나쁨)으로 표시
- [x] 2. 직접 한 번 실행해서 `weather.txt` 내용 확인
- [~] 3. 작업 스케줄러 등록 — 사용자 요청으로 하지 않음
- [x] 4. `progress.md` 기록

## 2026-10-15 — GitHub 업로드 (private 레포)

- [x] 0. gh 설치 확인 → 이미 설치됨 (v2.102.0, winsHyun 로그인 완료) → 설치 생략
- [x] 1. `.gitignore` 생성 — `.env`, `*.key`, `*.pem`, `id_rsa*`, `credentials*`, `*.bak`, 100MB 넘는 PDF + (사용자가 고른) 개인 파일
- [x] 2. `README.md` 폴더 구조 정리 (기존 파일 → `README.md.bak` 백업 후 수정)
- [x] 3. `git init` → `git add` → 실제로 올라갈 파일 목록을 보여주고 민감 파일 없는지 확인
- [x] 4. 첫 커밋 "Initial setup"
- [x] 5. `gh repo create claude-workspace --private` 로 만들고 push
- [x] 6. GitHub에서 private인지, 파일이 맞는지 확인 → `progress.md` 기록

## 2026-10-15 — 포트폴리오 다크모드 (브랜치 작업)

- [x] 1. `feature/dark-mode` 브랜치 만들기
- [x] 2. `portfolio/index.html`, `portfolio/resume.html` 다크모드 적용 (방식은 사용자 선택)
- [x] 3. 브라우저로 열어서 실제로 어두워지는지 확인 (스크린샷)
- [x] 4. 브랜치에 커밋
- [x] 5. `main`으로 돌아와 머지(merge, 브랜치 작업을 main에 합치기)
- [x] 6. GitHub에 push → 올라간 내용 확인 → `progress.md` 기록

## 2026-10-15 — 포트폴리오 Vercel 배포 준비 (배포 자체는 사용자가 직접)

- [x] 1. `portfolio/` 폴더를 배포 전용 폴더로 만들기 — `portfolio.html` → `portfolio/index.html` 로 복사
  - 이유: 레포 최상위를 배포하면 `SECURITY.md`, `work.txt`, `docs/` 등이 공개됨 → 포트폴리오 폴더만 배포
- [x] 2. 최상위 `portfolio.html` 은 `portfolio.html.bak` 으로 백업(이름 변경)해서 중복 정리
- [x] 3. `portfolio/vercel.json` 추가 — 깔끔한 주소(cleanUrls) + 기본 보안 헤더
- [x] 4. 로컬에서 실제로 띄워서 페이지가 잘 나오는지 확인
- [x] 5. 커밋 (`resume.html` 삭제 포함) → GitHub에 push
- [x] 6. Vercel 설정 방법 안내 (Root Directory = `portfolio`) → `progress.md` 기록

## 2026-10-15 — 포트폴리오 배포 구조 변경 (최상위 portfolio.html 기준)

- [x] 1. `.vercelignore` 생성 — 전부 제외 후 `portfolio.html`, `vercel.json` 만 허용 (SECURITY.md 등 공개 방지)
- [x] 2. `vercel.json` 에 `/` → `portfolio.html` rewrite 추가
- [x] 3. 로컬 테스트 (`/` 접속 시 포트폴리오 표시)
- [x] 4. 커밋 + push (`work.txt` 제외)
- [x] 5. Vercel 안내 수정 (Root Directory 비워두기, 배포 후 `/SECURITY.md` 404 확인) → `progress.md` 기록

## 2026-10-18 — portfolio.html 현행화 (이력서_20261018.doc 기준)

- [x] 1. 이력서가 Git에 안 올라가는지 확인 — `.gitignore`의 `*이력서*` 규칙으로 `.doc`, `.files/` 모두 제외됨 (확인 완료)
- [x] 2. 기존 `portfolio.html` → `portfolio.html.bak` 백업
- [x] 3. `portfolio.html` 새로 작성
  - 다크모드 유지, 깔끔한 디자인 + Octicons(GitHub 아이콘)
  - 소개 / 핵심 숫자(경력 18년 10개월 등) / 기술 스택 / 경력 타임라인(2007→현재) / 자격증 / 연락처
  - 다이나믹 요소: 스크롤 등장 애니메이션, 숫자 카운트업, 타임라인 진행선, 기술 필터
  - 공개 페이지라 민감정보(휴대폰, 나이, 병역, 희망연봉)는 제외 (사용자 확인)
- [x] 4. 브라우저(Edge 헤드리스)로 열어 PC·모바일 화면 스크린샷 확인
- [x] 5. `README.md` 폴더 구조 다시 정리 (백업: `README.md.bak`)
- [x] 6. 커밋 "portfolio.html현행화" (이력서 파일 미포함 확인, push는 따로 확인)
- [x] 7. `progress.md` 기록

## 2026-10-19 — 포트폴리오 방명록 (Supabase)

- [x] 1. `supabase/messages.sql` 작성 — `messages` 테이블(id, name, content, created_at) + 길이 제한 + RLS(누구나 읽기·쓰기, 수정·삭제 불가) + name·content만 입력 허용
  - anon 키로는 테이블을 만들 수 없음 → **사용자가 Supabase 대시보드 SQL Editor에서 실행**
- [x] 2. `.env.local` 생성 (SUPABASE_URL, SUPABASE_ANON_KEY) — `.gitignore`의 `.env.*` 규칙으로 이미 제외되는지 `git check-ignore`로 확인
- [x] 3. `scripts/gen-config.mjs` 작성 — `.env.local`을 읽어 `config.js` 생성 (정적 HTML은 .env를 직접 못 읽기 때문). `config.js`도 `.gitignore`에 추가
- [x] 4. `portfolio.html` 맨 아래(연락처 다음)에 방명록 섹션 추가 — 작성 폼 + 최신순 목록, 기존 디자인·다크모드 맞춤 (백업: `portfolio.html.20261019.bak` — 기존 `.bak`은 덮어쓰지 않음)
  - 라이브러리 없이 Supabase REST API를 `fetch`로 호출, 글은 `textContent`로 표시(스크립트 삽입 방지)
- [x] 5. 로컬 테스트 — `node scripts/gen-config.mjs` → `npx serve` → 글 작성·목록 표시 확인 (SQL 실행 후)
- [x] 6. `progress.md` 기록 (커밋·Vercel 배포 설정은 따로 확인)

## 2026-10-19 — Vercel 방명록 "config.js를 찾지 못했어요" 해결

> 원인: `config.js`는 `.gitignore`로 GitHub에 안 올라가고, `.vercelignore`가 `scripts/`도 막아서 Vercel이 직접 만들 수도 없음
> 방법: 배포할 때 Vercel이 `node scripts/gen-config.mjs`를 실행해 `config.js`를 만들게 함 (키는 Vercel 환경변수에만 저장)

- [x] 1. **(사용자)** Vercel 대시보드 → Project → Settings → Environment Variables에 `SUPABASE_URL`, `SUPABASE_ANON_KEY` 등록 (`.env.local`과 같은 값, anon 키만)
- [x] 2. `.vercelignore`에 `!scripts/` + `!scripts/gen-config.mjs` 허용 추가 (나머지 파일은 계속 제외) — 백업 `.vercelignore.bak`
- [x] 3. `vercel.json`에 `"buildCommand": "node scripts/gen-config.mjs"` 추가 — 백업 `vercel.json.bak`
  - 1차 배포 실패: 출력 폴더(`public`) 없음 → 빌드 시 `public/`에 `portfolio.html`, `config.js`만 복사 + `outputDirectory: "public"`
- [x] 4. 커밋 + push (`config.js`, `.env.local`, `work.txt` 미포함 확인)
- [x] 5. 배포 후 확인: 사이트 방명록 표시, `/config.js` 열림, `/SECURITY.md`·`/.env.local` 404
- [x] 6. `progress.md` 기록

## 2026-10-29 — 포트폴리오에 바이브 코딩 프로젝트 추가

> 참고: https://github.com/winsHyun/VibeCoding README.md

- [x] 1. `portfolio.html`에 "바이브 코딩 프로젝트" 섹션(Study-01~05, 6개 카드) 추가 — 기술 스택 아래
- [x] 2. 메뉴에 "바이브 코딩" 링크, AI 칩에 `OpenRouter`·`TensorFlow.js` 추가
- [x] 3. 헤드리스 Chrome 스크린샷으로 확인 (참여 프로젝트 28건 그대로)
- [x] 4. 커밋 + push → Vercel 자동 배포
- [x] 5. `progress.md` 기록

## 2026-10-29 — "꾸준한 성장" 보여주기 (승인됨)

> 근거: `progress.md` 작업 날짜 + VibeCoding 레포 커밋 날짜 (지어낸 내용 없이 실제 기록만 사용)

- [x] 1. 첫 화면 배지 옆에 "지금도 학습 중 · 마지막 업데이트 날짜" 표시
- [x] 2. 새 섹션 **"성장 기록"** (바이브 코딩 섹션 바로 위)
  - 상단 숫자 3개: 학습 기간(2026-10-14~) · 작업 기록한 날 수 · 만든 앱 수 (새로 배운 기술 수는 근거 없어 제외)
  - **Claude Code 레벨업 단계**: 대화로 구현 → CLAUDE.md 규칙 → 커스텀 명령 → 서브 에이전트 3개 → 서브 에이전트 5개 팀 개발
    (스크롤하면 막대가 차오르는 애니메이션)
  - **날짜별 학습 타임라인**: 10/14 작업 환경·보안 규칙 → 10/15 Git/GitHub·다크모드·Vercel → 10/18 GitHub 기여 달력 → 10/19 Supabase 방명록 → 10/21~28 VibeCoding Study-01~05 → 10/29 포트폴리오 반영
- [x] 3. 메뉴에 "성장" 링크 추가
- [x] 4. PC·모바일 스크린샷으로 확인
- [x] 5. 커밋 + push → Vercel 배포 확인 → `progress.md` 기록

## 2026-10-29 — VibeCoding 최신 내용 반영 + README + 배포

- [x] 1. 백업: `portfolio.html.20261029.bak`, `README.md.20261029.bak`
- [x] 2. `portfolio.html` 바이브 코딩 섹션에 7번째 카드 "📄 PDF 한눈 요약"(Study-05 PDF) 추가
  - 설명: PDF 업로드 → 한 줄 요약·요점(근거 쪽)·섹션 요약·키워드, rerank로 긴 문서 처리, 워커 스레드 안전 추출
  - 칩: unpdf · OpenRouter · node --test / 링크: VibeCoding/Study-05
- [x] 3. 성장 기록 갱신: "직접 만든 앱" 6 → 7, 학습 여정 10.28에 "PDF 한눈 요약 기획(PRD)" 추가, 10.29 항목에 PDF 요약 완성 반영
- [x] 4. `README.md` 갱신: 포트폴리오 구성(섹션 목록), VibeCoding 링크, Vercel 자동 배포 흐름(push → 배포), 빠진 파일(`scripts/gen-config.mjs`, `supabase/`) 반영
- [x] 5. Chrome/Edge 헤드리스로 PC·모바일 스크린샷 확인
- [x] 6. git commit → git push (→ Vercel 자동 배포) → 배포 주소에서 새 카드 보이는지 확인
- [x] 7. `progress.md` 기록

## 2026-10-29 — 포트폴리오 디자인 다듬기 (mayeye.net 색감 참고)

> 참고: 색 체계·분위기만 참고 (로고·문구·브랜드는 가져오지 않음)

- [x] 1. 백업: `portfolio.html.20261029-design.bak`
- [x] 2. 색 토큰 교체 — 초록 포인트(#63b32e) + 파랑·초록·주황 그라데이션(#3366ff→#0fa958→#ff6a1a), 테마 방향은 사용자 선택
- [x] 3. 첫 화면(히어로) — 이름 그라데이션, 점 격자 배경, 별똥별 선 애니메이션, 궤도 도는 점 장식
- [x] 4. 인터랙션 — 카드에 마우스 따라오는 빛, ~~살짝 기울기(tilt)~~ → 글자 흐림 문제로 떠오르기로 대체, 버튼 자석 효과, 섹션 순차 등장, 현재 섹션 메뉴 강조
- [x] 5. 전체 정리 — 섹션 간격·제목 크기·카드 모양 통일, 폭 960→1120px
- [x] 6. 접근성 — "동작 줄이기" 설정이면 애니메이션 끄기, 글자 대비 확인
- [x] 7. 단계마다 PC·모바일 스크린샷 확인, 방명록·GitHub 달력 정상 동작 확인
- [x] 8. (사용자 OK 후) commit · push → Vercel 배포 확인
- [x] 9. `progress.md` 기록

## 2026-10-29 — 배경에 돌아다니는 귀여운 캐릭터 (pickle.com 분위기 참고)

> 참고: "작은 캐릭터들이 화면을 돌아다니는 느낌"만 참고 — 그림·이름은 가져오지 않고 직접 SVG로 새로 그림

- [x] 1. 백업: `portfolio.html.20261029-critter.bak`
- [x] 2. 서로 다른 캐릭터 7종 SVG로 그리기 (말랑이 블롭·유령·버섯·고양이·로봇·별·젤리곰 등) — 모양·색·크기·눈·걸음 속도 모두 다르게, 포트폴리오 색(초록·파랑·주황) 사용
- [x] 3. 움직임: 좌우로 걷기·통통 튀기·가끔 멈춰서 두리번·눈 깜빡임·눈이 마우스 따라보기, 방향 바뀌면 몸 뒤집기
- [x] 4. 클릭(탭)하면 점프 + 하트 뿅 — 그 외 영역은 클릭 방해 안 하게(pointer-events)
- [x] 5. 화면 밖일 땐 멈춤, 모바일은 3마리만·작게, "동작 줄이기" 설정이면 숨김
- [x] 6. PC·모바일 스크린샷 확인, 콘솔 오류 0건 확인
- [x] 7. (사용자 OK 후) commit · push → Vercel 배포 확인 → `progress.md` 기록

## 2026-10-29 — 캐릭터 선택·드래그 + 다양한 반응

- [x] 1. 백업: `portfolio.html.20261029-drag.bak`
- [x] 2. 클릭 = 선택(표시 링 + 이름표, 잠시 머묾), 드래그 = 잡아서 옮기기(버둥버둥) → 놓으면 던진 방향으로 날아감, 세게 던지면 어지러워함
- [x] 3. 반응 10종 이상 랜덤(직전과 겹치지 않게): 점프·하트, 회전, 부르르, 젤리 출렁, 커지기, 춤, 공중제비, 쿨쿨, 부끄부끄, 반짝이 + 캐릭터 전용(유령 사라지기·로봇 삐빅 등)
- [x] 4. 캐릭터 위만 클릭 받음(그 외는 아래 버튼 그대로), 모바일 터치 드래그
- [x] 5. PC·모바일 동작 확인, 콘솔 오류 0건
- [x] 6. commit · push → Vercel 배포 확인 → progress 기록

## 2026-10-30 — Study-06 쇼핑 리스트 포트폴리오 반영

- [x] 1. 백업: `portfolio.html.20261030-study06.bak`, `README.md.20261030-study06.bak`
- [x] 2. 포트폴리오: Study-06 카드 추가, 학습 여정 10.30 추가, "직접 만든 앱" 7→8, 배지 날짜 2026.10.30
- [x] 3. README: 바이브 코딩 프로젝트 7→8개, 표에 06 추가
- [x] 4. 로컬 화면 확인 → commit · push → Vercel 배포 확인
- [x] 5. `progress.md` 기록

## 2026-10-30 — ch/ 이미지 캐릭터 7종 포트폴리오에 추가 (14종 모두 띄우기)

- [x] 1. 백업: `portfolio.html.20261030-ch.bak`, `vercel.json`/`.vercelignore` 백업
- [x] 2. 배경 투명화: `ch/*.PNG` 원본은 그대로 두고, 연회색 배경만 지운 복사본을 `img/ch/` 에 영어 이름으로 저장 (chiikawa.png, hachiware.png, usagi.png, momonga.png, kuriman.png, shisa.png, kani.png)
- [x] 3. `portfolio.html`: 기존 떠다니는 캐릭터(SVG 7종)에 이미지 캐릭터 7종 추가 — 같은 둥둥·선택·반응·끌기·던지기 동작, 이름표는 한글 이름
- [x] 4. 배포 설정: `.vercelignore` 에 `img/` 허용, `vercel.json` 빌드에 `img/` 복사 추가
- [x] 5. 로컬 화면 확인 (투명 배경, 움직임, 클릭·드래그, 콘솔 오류 0건)
- [x] 6. commit · push → Vercel 배포 확인 → `progress.md` 기록

## 2026-10-30 — 이미지 캐릭터 7종 다시 빼기

- [x] 1. 백업: `*.20261030-ch-remove.bak` (portfolio.html, vercel.json, .vercelignore), 이미지 → `img-ch.20261030.bak/`
- [x] 2. 세 파일을 이미지 추가 직전(4f3ebdc)으로 되돌림, `img/ch` git에서 제거 (원본 `ch/`는 그대로)
- [x] 3. 로컬 확인: SVG 7마리만, 이미지 0, JS 오류 0건
- [x] 4. commit · push → Vercel 배포 확인 → `progress.md` 기록
