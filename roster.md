# Danh sách coder

Coder là phiên Claude Code, không giữ trí nhớ giữa các phiên. Tên chỉ để biết ai nhận job nào trong comment `CLAIM`.

| Tên | Làn | Phạm vi điển hình | Kích hoạt | Trạng thái |
|---|---|---|---|---|
| DEV-AUTO | mọi làn | Job do lịch điều phối nhận (docs/DISPATCHER.md) | Lịch claude.ai, hạn mức gói Claude | Chờ bật sau dự án thử |
| DEV-FE-1 | fe | Giao diện, trang, component, CSS | Mở tay khi cần chạy song song | Chưa chạy |
| DEV-BE-1 | be | API, dữ liệu, Supabase, tích hợp | Như trên | Chưa mở |
| DEV-FIX-1 | fix | Sửa lỗi nhỏ từ QA, người dùng | Như trên | Chưa mở |
| DEV-SEC-1 | sec | Rà bảo mật định kỳ: chỉ mở issue `type:security`, không tự sửa | Lịch hằng tuần | Chưa mở |
| Antigravity | fe/be | Job WEB giao qua handoff như hiện nay | Thủ công | Đang dùng ở vive-swipe |

Thêm coder: thêm 1 dòng, không cần đổi quy trình. Hai coder cùng làn được chạy song song nếu nhận job ở hai module khác nhau.
