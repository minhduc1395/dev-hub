# Việc của Tech Lead

Tech Lead của VIVE là phòng WEB. Dự án khác ghi Tech Lead trong `projects/<tên>.md`.

## Chuẩn bị một repo dự án (một lần)
1. `scripts/setup-labels.sh <owner/repo>` để tạo bộ nhãn.
2. Chép `templates/ISSUE_TEMPLATE/job.md` vào `.github/ISSUE_TEMPLATE/job.md` và `templates/PULL_REQUEST_TEMPLATE.md` vào `.github/PULL_REQUEST_TEMPLATE.md`.
3. Viết `CLAUDE.md` gốc theo `templates/CLAUDE.project.md`, dưới 150 dòng.
4. Lập `docs/modules/README.md` (bảng module) và 1 file `docs/modules/<module>.md` cho mỗi module chính theo `templates/module-pack.md`. Bắt đầu với 3–5 module hay sửa nhất.
5. Thêm dự án vào `projects/` của dev-hub.

## Viết một job
- Một job = một kết quả kiểm được, thuộc 1 module, cỡ S hoặc M. Việc lớn thì chia.
- Điền đủ: Mục tiêu, Phạm vi (Được sửa / Không được sửa), Tiêu chí xong (QA kiểm theo đúng danh sách này), Ngữ cảnh cần đọc (ít nhất có thể), Ngoài phạm vi.
- Gắn nhãn `module:`, `lane:`, `type:`, `size:`, `prio:`, rồi `status:ready`.
- Job chạm file dùng chung: `module:shared`, Tech Lead tự làm hoặc giao riêng, không chạy song song với job khác cùng đụng file đó.

## Hằng ngày
- Trả lời `BLOCKED` trong ngày.
- Merge PR có `QA-PASS` sau khi tự xem nhanh; deploy theo lịch của dự án.
- Đóng issue, kiểm gói module đã cập nhật.
- Mốc đáng kể (tính năng xong, bản phát hành, sự cố) thì ghi 1 dòng Nhật ký Team Hub. Không ghi từng job.

## Khi một coder làm sai phạm vi
Comment `QA-CHANGES` hoặc đóng PR, ghi rõ tiêu chí bị vi phạm, gắn lại `status:ready` cho job.
