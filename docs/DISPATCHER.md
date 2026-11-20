# Lịch điều phối (dùng hạn mức gói Claude)

Một **scheduled task** trên claude.ai tên "Đội coder: điều phối". Mỗi lượt là một phiên Claude Code mới, không nhớ lượt trước, nên mọi trạng thái nằm trên GitHub.

## Tiết kiệm quota
1. **Bước kiểm rẻ trước:** chỉ đọc `clients.yml` và gọi REST lấy issue `status:ready` / `status:in-review` của các khách `active`. Không có gì thì dừng ngay, không clone repo, không đọc tài liệu.
2. **Một lượt làm tối đa 1 job code + 1 lượt QA.** Job còn lại để lượt sau.
3. **Đọc tối thiểu:** khi làm job chỉ đọc issue, `CLAUDE.md` của khách, gói module, và "Ngữ cảnh cần đọc". Không đọc khách khác.
4. **Lịch thưa:** 4 lượt mỗi ngày là đủ cho giai đoạn đầu. Cần nhanh thì Tech Lead nhắn BOD bấm "Run now".

## Lời nhắc của lịch (bản dùng thật)
```
Bạn là bộ điều phối của đội coder. Repo trung tâm: minhduc1395/dev-hub. Dùng gh api (REST), không dùng gh issue/gh pr (GraphQL bị chặn). Giờ Việt Nam.

0. Gắn và clone nông (--depth 1) repo minhduc1395/dev-hub. Chỉ đọc clients.yml và docs/GH-COMMANDS.md.
1. Với mỗi khách active: lấy danh sách issue mở có status:ready, và có status:in-review.
   Không có gì ở mọi khách: trả lời đúng 1 dòng "Không có job." rồi DỪNG NGAY.
2. Nếu có in-review: gắn và clone repo của khách đó, làm QA cho issue cũ nhất theo docs/QA-PROMPT.md.
3. Nếu có ready: chọn 1 issue (prio:high trước, rồi cũ nhất) mà module của nó không có job claimed/in-review/changes.
   Gắn và clone repo khách, làm theo docs/CODER-PROMPT.md với tên coder DEV-AUTO.
4. Trả lời 3–5 dòng: khách, issue, PR, kết quả QA, việc còn chờ.
Không merge, không deploy, không đọc khách khác ngoài khách đang làm.
```

## Bật / tắt
- Bật: BOD tạo scheduled task với lời nhắc trên (hoặc nhắn DIR "bật lịch đội coder").
- Tắt tạm: tắt lịch trong mục Scheduled tasks, hoặc đặt mọi khách `active: false`.
