# vive-swipe (web VIVE Quẹt)

- Repo: minhduc1395/vive-swipe · Nhánh chính: main
- Tech Lead: phòng WEB (khung chat "Web builder - VIVE"). Khách VIVE, `auto_merge: false`: WEB duyệt và merge.
- QA: lịch "Đội coder: QA" cho job GitHub Issue; lịch cũ "VIVE Quẹt: Claude QA tự động" vẫn QA task W.
- Công nghệ: Next.js 16 (đọc `node_modules/next/dist/docs/` trước khi code), React 19, Supabase, three.js, Tailwind 4, Vitest, Playwright.
- Lệnh: `npm ci` (≈20 giây) · `npm run lint` · `npm run typecheck` · `npm test` (≈5 giây, 104 test) · `npm run e2e` khi có giao diện (pixel-7, iphone-13).
- Không cần khóa Supabase để build/test: ngoài production app dùng kho tạm. CI GitHub chạy lint, typecheck, test, e2e cho mọi PR.
- Deploy: Cloud Build → Cloud Run (`cloudbuild.yaml`). Merge vào main có thể lên web thật, nên chỉ WEB merge.
- Bản đồ module: `docs/modules/README.md` (trang-chu, quet, deal, giu-hang, noi-bo, shared). Điều chung: `docs/modules/_chung.md`.
- Quy tắc riêng:
  - Giá, quà, combo lấy từ `data/` (file dùng chung, chỉ WEB sửa). Không gõ số trên giao diện.
  - Claim giải thưởng chỉ gắn đúng sản phẩm có bằng chứng; LEG rà.
  - Ảnh, video là việc của Antigravity Media, không giao đội coder.
  - Task W và handoff cũ chạy song song; WEB không giao job vào module đang có task W Doing.
