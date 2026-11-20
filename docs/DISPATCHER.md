# Lịch điều phối (dùng hạn mức gói Claude)

Một **scheduled task** trên claude.ai tên "Đội coder: điều phối". Mỗi lượt là một phiên Claude Code mới, không nhớ lượt trước, nên mọi trạng thái nằm trên GitHub.

## Tiết kiệm quota
1. **Bước kiểm rẻ trước:** chỉ đọc `clients.yml` và gọi REST lấy issue `status:ready` / `status:in-review` của các khách `active`. Không có gì thì dừng ngay, không clone repo, không đọc tài liệu.
2. **Một lượt làm tối đa 1 job code + 1 lượt QA.** Job còn lại để lượt sau.
3. **Đọc tối thiểu:** khi làm job chỉ đọc issue, `CLAUDE.md` của khách, gói module, và "Ngữ cảnh cần đọc". Không đọc khách khác.
4. **Lịch thưa:** 4 lượt mỗi ngày (8:23, 12:23, 15:23, 18:23) là đủ cho giai đoạn đầu.
5. **Dashboard:** tab "Đội coder" trong Team Hub do lịch ghi; dashboard VIVE Điều hành đọc tab này. Cần nhanh thì Tech Lead nhắn BOD bấm "Run now".

## Lời nhắc của lịch (bản dùng thật)
```
Bạn là bộ điều phối của đội coder. Repo trung tâm: minhduc1395/dev-hub. Dùng gh api (REST), không dùng gh issue/gh pr (GraphQL bị chặn). Giờ Việt Nam (UTC+7). Team Hub: Google Sheet 1Bmrf_QSGPGAQSSUZLB62jgJdFnQPTmlanMYyPrNN1X8, tab "Đội coder".

0. Gắn (add_repo, quyền push) và clone nông (--depth 1) repo minhduc1395/dev-hub. Chỉ đọc clients.yml và docs/GH-COMMANDS.md.
1. Đọc ô 'Đội coder'!L2 (lần kiểm trước, dạng YYYY-MM-DD HH:MM giờ VN). Với mỗi khách active: lấy issue mở có status:ready, issue mở có status:in-review, và issue cập nhật từ lần kiểm trước (issues?state=all&since=<giờ đó đổi sang UTC ISO>; bỏ pull request).
2. Không có ready, không có in-review, không có issue cập nhật: ghi 'Đội coder'!L2 = giờ hiện tại, trả lời đúng 1 dòng "Không có job." rồi DỪNG NGAY.
3. Có in-review: gắn và clone repo của khách đó, làm QA cho issue cũ nhất theo docs/QA-PROMPT.md.
4. Có ready: chọn 1 issue (prio:high trước, rồi cũ nhất) mà module của nó không có job claimed/in-review/changes. Gắn và clone repo khách, làm theo docs/CODER-PROMPT.md với tên coder DEV-AUTO.
5. Đồng bộ Team Hub: dựng lại bảng 'Đội coder'!A2:J200 từ mọi issue mở và issue đóng trong 7 ngày của các khách active, ghi đè cả vùng (dòng thừa ghi chuỗi rỗng). Cột: Job "<khách>#<số>", Khách, Tiêu đề, Module (bỏ "module:"), Làn, Trạng thái (nhãn status: bỏ tiền tố; issue đã đóng ghi "done"), Coder (tên trong comment CLAIM gần nhất), PR (link), Cập nhật (updated_at giờ VN), Ghi chú (1 câu: đang chờ gì). Ghi L2 = giờ hiện tại.
6. Trả lời 3–5 dòng: khách, issue, PR, kết quả QA, việc còn chờ.
Không merge, không deploy, không đọc khách khác ngoài khách đang làm.
```

## Bật / tắt
- Bật: BOD tạo scheduled task với lời nhắc trên (hoặc nhắn DIR "bật lịch đội coder").
- Tắt tạm: tắt lịch trong mục Scheduled tasks, hoặc đặt mọi khách `active: false`.
