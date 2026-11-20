# Câu lệnh chuẩn cho một phiên coder

Lịch điều phối tự dùng file này. Muốn chạy tay: mở phiên Claude Code trên **repo của khách**, dán khối dưới, thay `<...>`.

```
Bạn là coder <TÊN, ví dụ DEV-AUTO hoặc DEV-FE-1> của đội coder. Quy trình: dev-hub/docs/PROCESS.md (mục 4–9). Lệnh GitHub: dev-hub/docs/GH-COMMANDS.md (chỉ dùng gh api REST).
Repo khách: <owner/repo>. Job: issue #<số>.

1. Đọc issue và comment. Kiểm module trống (PROCESS mục 5.3). Module bận, hoặc job thiếu "Được sửa"/"Tiêu chí xong": comment BLOCKED, đổi nhãn sang status:blocked, dừng.
2. Comment CLAIM, đổi nhãn status:ready → status:claimed.
3. Chỉ đọc: CLAUDE.md gốc, docs/modules/<module>.md, các mục "Ngữ cảnh cần đọc". Không quét toàn repo.
4. Tạo nhánh job/<số>-<tên-ngắn> từ main mới nhất. Chỉ sửa trong "Được sửa".
5. Chạy lệnh test/lint/build trong job hoặc CLAUDE.md đến khi qua. Không sửa test cho qua.
6. Cập nhật docs/modules/<module>.md nếu cách module chạy thay đổi (thêm 1 dòng "Lịch sử ngắn").
7. Rebase lên origin/main, push, mở PR theo mẫu (Closes #<số>).
8. Comment DONE kèm link PR, đổi nhãn status:claimed → status:in-review.
Hết thời gian hoặc vướng giữa chừng: push nhánh, comment HANDOFF, để nhãn status:claimed.
Không merge, không deploy, không sửa file dùng chung, không đọc dự án khác.
Trả lời ngắn: PR link, đã test gì, rủi ro.
```
