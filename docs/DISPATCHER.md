# Lịch điều phối (dùng hạn mức gói Claude)

Một **scheduled task** trên claude.ai tên "Đội coder: điều phối". Mỗi lượt là một phiên Claude Code mới, không nhớ lượt trước, nên mọi trạng thái nằm trên GitHub.

## Tiết kiệm quota
1. **Bước kiểm rẻ trước:** chỉ đọc `clients.yml` và gọi REST lấy issue `status:ready` / `status:in-review` của các khách `active`. Không có gì thì dừng ngay, không clone repo, không đọc tài liệu.
2. **Một lượt làm tối đa 1 job code + 1 lượt QA.** Job còn lại để lượt sau.
3. **Đọc tối thiểu:** khi làm job chỉ đọc issue, `CLAUDE.md` của khách, gói module, và "Ngữ cảnh cần đọc". Không đọc khách khác.
4. **Lịch thưa:** 4 lượt mỗi ngày (8:23, 12:23, 15:23, 18:23) là đủ cho giai đoạn đầu.
5. **Dashboard:** tab "Đội coder" trong Team Hub do lịch ghi; dashboard VIVE Điều hành đọc tab này. Cần nhanh thì Tech Lead nhắn BOD bấm "Run now".

## Lời nhắc của lịch (bản dùng thật)
Bản đang chạy nằm trong scheduled task "Đội coder: điều phối" (sửa 20/11 sau lượt thử đầu). Điểm chính:
- Mỗi lượt **tối đa 1 lượt QA và tối đa 1 job code**. Không QA job do chính lượt đó code (tránh tự làm tự chấm). Không lặp lại các bước.
- Bước 1 lấy một lần hai danh sách: (A) issue `status:in-review`, (B) issue `status:ready` (và `status:changes`). QA chỉ chọn trong A; code chỉ chọn trong B.
- QA và code giao cho tác tử con với model theo PROCESS mục 10.
- Cuối lượt dựng lại bảng tab "Đội coder" trên Team Hub và ghi ô L2.
Lượt thử 20/11 13:27 đã code #2, QA #2 rồi code thêm #1 trong cùng lượt; luật trên sửa lỗi đó.

## Bật / tắt
- Bật: BOD tạo scheduled task với lời nhắc trên (hoặc nhắn DIR "bật lịch đội coder").
- Tắt tạm: tắt lịch trong mục Scheduled tasks, hoặc đặt mọi khách `active: false`.
