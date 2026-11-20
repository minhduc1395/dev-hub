# Việc của Tech Lead

Mỗi khách có 1 Tech Lead (ghi trong `clients.yml`). VIVE: phòng WEB.

## Chuẩn bị repo (một lần)
Theo `docs/ONBOARDING.md`. DIR chạy script; Tech Lead điền `CLAUDE.md` (dưới 150 dòng) và gói ngữ cảnh cho 3–5 module hay sửa nhất.

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
