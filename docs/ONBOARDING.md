# Đưa khách hàng mới vào đội coder

Khách là bất kỳ dự án nào thuê đội coder: VIVE (web vive-swipe), một app khác, một dự án nội bộ. Setup mất khoảng 30 phút.

## Khách cần có
- 1 repo GitHub (nhánh chính `main`), BOD có quyền ghi.
- 1 **Tech Lead**: người hoặc khung chat Claude viết job và duyệt (ví dụ phòng WEB của VIVE).
- Lệnh chạy được: cài, test, build (không có test thì job đầu tiên là tạo test).

## 5 bước
| # | Việc | Ai |
|---|---|---|
| 1 | Gắn repo khách vào phiên Claude Code (add repo) và clone | DIR |
| 2 | Chạy `scripts/onboard-client.sh <clone> <owner/repo> <module...>`: chép mẫu job/PR, tạo khung `CLAUDE.md` và `docs/modules/`, tạo bộ nhãn | DIR |
| 3 | Điền `CLAUDE.md` (dưới 150 dòng) và gói ngữ cảnh cho mỗi module, commit vào `main` | Tech Lead (hoặc DIR làm nháp, Tech Lead duyệt) |
| 4 | Thêm `projects/<tên>.md` và 1 mục trong `clients.yml` (`active: true`) | DIR |
| 5 | Tech Lead viết job đầu tiên cỡ S, gắn `status:ready`. Lịch điều phối nhận ở lượt kế tiếp | Tech Lead |

## Tạm dừng hoặc kết thúc khách
Đặt `active: false` trong `clients.yml`. Job đang làm vẫn chạy tới PR; không nhận job mới.

## Giao - nhận việc (tóm tắt cho Tech Lead của khách)
- **Giao:** tạo Issue theo mẫu "Job cho đội coder", điền đủ Phạm vi và Tiêu chí xong, gắn nhãn module/làn/cỡ, rồi `status:ready`.
- **Theo dõi:** nhãn trạng thái trên Issue; comment `CLAIM`, `BLOCKED`, `DONE`, `HANDOFF`.
- **Trả lời vướng:** comment dưới `BLOCKED`, gỡ `status:blocked`, gắn lại `status:ready`.
- **Nhận:** khi có `QA-PASS`, xem nhanh PR rồi merge; deploy theo cách của dự án.
