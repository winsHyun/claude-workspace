-- 포트폴리오 방명록 테이블
-- Supabase 대시보드 → SQL Editor 에 붙여넣고 Run

create table if not exists public.messages (
  id          bigint generated always as identity primary key,
  name        text not null,
  content     text not null,
  created_at  timestamptz not null default now(),

  -- 빈 값·너무 긴 글 막기
  constraint messages_name_length    check (char_length(trim(name)) between 1 and 30),
  constraint messages_content_length check (char_length(trim(content)) between 1 and 500)
);

-- 최신순 조회용 인덱스
create index if not exists messages_created_at_idx on public.messages (created_at desc);

-- RLS 켜기 (정책이 없는 동작은 전부 막힘 → 수정·삭제 불가)
alter table public.messages enable row level security;

drop policy if exists "Anyone can read messages" on public.messages;
create policy "Anyone can read messages"
  on public.messages for select
  to anon, authenticated
  using (true);

drop policy if exists "Anyone can write messages" on public.messages;
create policy "Anyone can write messages"
  on public.messages for insert
  to anon, authenticated
  with check (true);

-- 방문자는 name, content 만 넣을 수 있게 (id·작성시간 조작 방지)
revoke insert on public.messages from anon, authenticated;
grant insert (name, content) on public.messages to anon, authenticated;
