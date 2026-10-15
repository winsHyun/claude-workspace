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
- [ ] 1. `.gitignore` 생성 — `.env`, `*.key`, `*.pem`, `id_rsa*`, `credentials*`, `*.bak`, 100MB 넘는 PDF + (사용자가 고른) 개인 파일
- [ ] 2. `README.md` 폴더 구조 정리 (기존 파일 → `README.md.bak` 백업 후 수정)
- [ ] 3. `git init` → `git add` → 실제로 올라갈 파일 목록을 보여주고 민감 파일 없는지 확인
- [ ] 4. 첫 커밋 "Initial setup"
- [ ] 5. `gh repo create claude-workspace --private` 로 만들고 push
- [ ] 6. GitHub에서 private인지, 파일이 맞는지 확인 → `progress.md` 기록
