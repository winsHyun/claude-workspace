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
