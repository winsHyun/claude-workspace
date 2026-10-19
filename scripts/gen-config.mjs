// .env.local(로컬) 또는 환경변수(배포)에서 Supabase 공개 설정을 읽어 config.js 생성
// 사용: node scripts/gen-config.mjs
import { readFileSync, writeFileSync, existsSync } from 'node:fs';

const env = { ...process.env };
if (existsSync('.env.local')) {
  for (const line of readFileSync('.env.local', 'utf8').split(/\r?\n/)) {
    const m = line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/);
    if (m) env[m[1]] = m[2].replace(/^["']|["']$/g, '');
  }
}

const url = env.SUPABASE_URL;
const anonKey = env.SUPABASE_ANON_KEY;
if (!url || !anonKey) {
  console.error('SUPABASE_URL / SUPABASE_ANON_KEY 가 없습니다 (.env.local 확인)');
  process.exit(1);
}

// anon(공개) 키만 허용 — service_role 키가 브라우저로 나가는 사고 방지
const role = JSON.parse(Buffer.from(anonKey.split('.')[1], 'base64url').toString()).role;
if (role !== 'anon') {
  console.error(`anon 키가 아닙니다 (role=${role}). service_role 키는 절대 쓰면 안 됩니다.`);
  process.exit(1);
}

writeFileSync('config.js',
  `window.SUPABASE_CONFIG = ${JSON.stringify({ url, anonKey })};\n`);
console.log(`config.js 생성 완료 (url=${url}, key=${anonKey.slice(0, 8)}***)`);
