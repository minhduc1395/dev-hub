# Lịch điều phối (dùng hạn mức gói Claude)

Một **scheduled task** trên claude.ai tên "Đội coder: điều phối". Mỗi lượt là một phiên Claude Code mới, không nhớ lượt trước, nên mọi trạng thái nằm trên GitHub.

## Tiết kiệm quota
1. **Bước kiểm rẻ trước:** chỉ đọc `clients.yml` và gọi REST lấy issue `status:ready` / `status:in-review` của các khách `active`. Không có gì thì dừng ngay, không clone repo, không đọc tài liệu.
2. **Một lượt làm tối đa 1 job code + 1 lượt QA.** Job còn lại để lượt sau.
3. **Đọc tối thiểu:** khi làm job chỉ đọc issue, `CLAUDE.md` của khách, gói module, và "Ngữ cảnh cần đọc". Không đọc khách khác.
4. **Lịch thưa:** 4 lượt mỗi ngày (8:23, 12:23, 15:23, 18:23) là đủ cho giai đoạn đầu.
5. **Dashboard:** tab "Đội coder" trong Team Hub do lịch ghi; dashboard VIVE Điều hành đọc tab này. Cần nhanh thì Tech Lead nhắn BOD bấm "Run now".

## Hai lịch chạy nối nhau
| Lịch | Khi chạy | Làm gì |
|---|---|---|
| "Đội coder: điều phối" | 8:23, 12:23, 15:23, 18:23, và khi lịch QA gọi | Nhận tối đa 1 job (job bị trả lại trước), giao coder; coder xong thì **gọi lịch QA ngay**. Không tự QA |
| "Đội coder: QA" | Chỉ khi được gọi (không có giờ cố định) | QA đúng 1 job. QA-PASS: khách có `auto_merge: true` thì tự merge và đóng issue; còn job ready thì gọi lại lịch điều phối. QA-CHANGES: gọi lịch điều phối sửa ngay (tối đa 2 lần trả lại; lần 3 gắn `status:blocked` cho Tech Lead) |

Khi có việc, đội chạy liền một chuỗi: code → QA → merge → job kế tiếp, không chờ giờ cố định. Hết job thì chuỗi dừng, không tốn gì. Giờ cố định chỉ để bắt job mới Tech Lead vừa giao và việc bị sót.

QA chạy ở phiên riêng, không cùng phiên với coder, nên không tự làm tự chấm. Lời nhắc đầy đủ nằm trong hai scheduled task.

## Bật / tắt
- Bật: BOD tạo scheduled task với lời nhắc trên (hoặc nhắn DIR "bật lịch đội coder").
- Tắt tạm: tắt lịch trong mục Scheduled tasks, hoặc đặt mọi khách `active: false`.
