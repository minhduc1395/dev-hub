# Quy trình đội coder

## 1. Vai trò
| Vai | Ai | Quyền |
|---|---|---|
| Tech Lead | Người đại diện của mỗi khách, ghi trong `clients.yml` (VIVE: phòng WEB; sandbox: DIR) | Viết job, gắn nhãn, trả lời `BLOCKED`, merge, deploy, sửa file dùng chung |
| Coder | Phiên Claude Code do lịch điều phối mở (DEV-AUTO) hoặc mở tay theo làn (`roster.md`) | Nhận 1 job, code trên nhánh riêng, mở PR |
| QA | Lịch điều phối (QA-PROMPT) hoặc QA riêng của khách | Review PR, chạy test, ghi `QA-PASS` / `QA-CHANGES` |
| Người dùng cuối của khách | BOD, các phòng của khách | Nêu nhu cầu với Tech Lead, không giao thẳng cho coder |

## 2. Job ở đâu
- Mỗi job là 1 Issue trong **repo dự án**, viết theo `templates/ISSUE_TEMPLATE/job.md`.
- Tiêu đề: `[<module>] <việc ngắn>` (có thể kèm mã cũ, ví dụ `[catalog] W061 lọc theo nhãn`).

## 3. Nhãn
Chạy `scripts/setup-labels.sh <owner/repo>` một lần cho mỗi repo dự án.

| Nhóm | Nhãn |
|---|---|
| Trạng thái (đúng 1) | `status:draft`, `status:ready`, `status:claimed`, `status:in-review`, `status:changes`, `status:qa-pass`, `status:blocked` |
| Module (đúng 1) | `module:<tên>` theo bản đồ module của repo; `module:shared` cho file dùng chung |
| Làn | `lane:fe`, `lane:be`, `lane:sec`, `lane:fix` |
| Loại | `type:feature`, `type:bug`, `type:security`, `type:refactor`, `type:docs` |
| Cỡ | `size:S` (≤ 2 giờ), `size:M` (≤ 1 phiên), `size:L` (phải chia nhỏ trước khi `ready`) |
| Ưu tiên | `prio:high`, `prio:normal`, `prio:low` |

## 4. Vòng đời
```
draft ─(Tech Lead viết xong)─▶ ready ─(coder CLAIM)─▶ claimed ─(mở PR, DONE)─▶ in-review
   in-review ─(QA-PASS)─▶ qa-pass ─(Tech Lead merge)─▶ đóng issue
   in-review ─(QA-CHANGES)─▶ changes ─(coder sửa, DONE)─▶ in-review
   bất kỳ ─(BLOCKED)─▶ blocked ─(Tech Lead trả lời, gắn lại)─▶ ready hoặc claimed
```
Ai đổi trạng thái thì gỡ nhãn trạng thái cũ, gắn nhãn mới, kèm comment theo mục 6.

## 5. Chống chồng chéo
1. Mỗi repo dự án có `docs/modules/README.md`: bảng module → thư mục → làn chính.
2. Job thuộc đúng 1 module, ghi "Được sửa" và "Không được sửa".
3. **Một module chỉ 1 job ở `claimed`, `in-review` hoặc `changes` cùng lúc.** Coder kiểm bằng lệnh "Module X có job đang chạy không" trong `docs/GH-COMMANDS.md`. Có kết quả lớn hơn 0 thì không nhận.
4. File dùng chung chỉ sửa qua job `module:shared`, làm tuần tự: `package.json`, lockfile, migration và schema DB, file cấu hình (`next.config.*`, `tsconfig*`, `.env*` mẫu, CI), layout gốc, `data/*.yaml` (dữ liệu giá, khuyến mãi).
5. Nhánh: `job/<số issue>-<tên-ngắn>`. Trước khi mở PR: `git fetch origin main && git rebase origin/main`.
6. PR nhỏ, lý tưởng dưới 400 dòng đổi. Lớn hơn thì Tech Lead chia job.
7. Cần đụng ngoài phạm vi: dừng, comment `BLOCKED`, không tự sửa.

## 6. Mẫu comment (chữ đầu dòng viết đúng để lọc được)
```
CLAIM <tên coder> · dự kiến xong <YYYY-MM-DD HH:MM> · nhánh job/<số>-<tên>
BLOCKED <câu hỏi cụ thể>. Phương án A: ... Phương án B: ...
DONE PR #<số> · Đã làm: ... · Test: <lệnh> → <kết quả> · Ảnh/clip: ... · Rủi ro: ... · Gói module đã cập nhật: có/không
HANDOFF Đã xong: ... · Còn lại: ... · Nhánh: ... · Lưu ý: ...
QA-PASS <tóm tắt kiểm theo từng tiêu chí>
QA-CHANGES 1) ... 2) ... (mỗi lỗi gắn với 1 tiêu chí xong)
```
Giờ ghi theo giờ Việt Nam.

## 7. Ngữ cảnh tối thiểu (tiết kiệm token)
Coder chỉ đọc, theo thứ tự:
1. Issue của job (kể cả comment).
2. `CLAUDE.md` ở gốc repo dự án (giữ dưới 150 dòng).
3. `docs/modules/<module>.md` (gói ngữ cảnh module, mẫu ở `templates/module-pack.md`).
4. Những file và link trong mục "Ngữ cảnh cần đọc" của job.
Không đọc dự án khác, không đọc issue cũ trừ khi job dẫn link, không quét toàn repo khi không cần.

Sau mỗi PR làm đổi cách module chạy: cập nhật `docs/modules/<module>.md` trong chính PR đó (1–5 dòng). Đây là trí nhớ của đội.

## 8. Kích hoạt
- Tự động: lịch điều phối trên claude.ai (hạn mức gói Claude), xem `docs/DISPATCHER.md`. Bước đầu mỗi lượt chỉ hỏi GitHub có job không; không có thì dừng ngay.
- Gấp: Tech Lead nhờ BOD bấm "Run now" cho lịch, hoặc mở tay một phiên Claude Code với `docs/CODER-PROMPT.md`.
- Lệnh GitHub: chỉ `gh api` (REST), xem `docs/GH-COMMANDS.md`.

## 9. Không bao giờ
- Merge hoặc deploy (trừ Tech Lead).
- Đẩy thẳng vào `main`.
- Đưa khóa bí mật, mật khẩu, dữ liệu cá nhân của khách vào code, issue hay log.
- Sửa test cho "qua" thay vì sửa lỗi.
