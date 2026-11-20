# dev-hub

Trung tâm điều phối **đội coder (DEV)** của BOD. Đội làm như một công ty IT outsource: nhận job từ nhiều **khách hàng** (client). Mỗi khách có một **Tech Lead** giao việc và duyệt. Repo này **không chứa code dự án**: chỉ có quy trình, mẫu, danh sách khách và coder.

```
Khách hàng (Tech Lead) ──job = GitHub Issue có nhãn status:ready──▶ Lịch điều phối (mỗi vài giờ)
        ▲                                                              │ có job?
        │ merge, deploy                                                ▼
   QA-PASS ◀── QA review ◀── PR ◀────────────── Coder (phiên Claude Code mới, đọc tối thiểu)
```

Khách hiện có (xem `clients.yml`): **sandbox** (dự án thử, Tech Lead DIR), **vive-swipe** (VIVE, Tech Lead phòng WEB, đang tạm tự làm).

Đội dùng **hạn mức gói Claude** (lịch chạy Claude Code trên claude.ai), không dùng API key.

| Cần gì | Mở đâu |
|---|---|
| Đưa khách mới vào (5 bước) | [docs/ONBOARDING.md](docs/ONBOARDING.md) |
| Quy trình: nhãn, vòng đời job, chống chồng chéo, mẫu comment | [docs/PROCESS.md](docs/PROCESS.md) |
| Việc của Tech Lead bên khách | [docs/TECH-LEAD.md](docs/TECH-LEAD.md) |
| Lịch điều phối tự động và cách tiết kiệm quota | [docs/DISPATCHER.md](docs/DISPATCHER.md) |
| Câu lệnh chuẩn cho coder / QA | [docs/CODER-PROMPT.md](docs/CODER-PROMPT.md), [docs/QA-PROMPT.md](docs/QA-PROMPT.md) |
| Lệnh GitHub dùng được trong phiên Claude Code | [docs/GH-COMMANDS.md](docs/GH-COMMANDS.md) |
| Danh sách khách / coder | [clients.yml](clients.yml), [roster.md](roster.md), [projects/](projects/) |

Quy tắc cứng:
1. Một job = một Issue trong repo của khách, thuộc đúng 1 module.
2. Coder không merge, không deploy, không sửa ngoài phạm vi job, không sửa file dùng chung.
3. Không merge khi chưa có `QA-PASS` và Tech Lead duyệt.
4. Mọi trao đổi về job nằm trong Issue/PR của job, theo mẫu comment ở PROCESS.md mục 6.
5. Coder không đọc dự án của khách khác.

Bản tổ chức (vai trò trong team VIVE) nằm ở project doc `claude/TEAM-04-doi-coder.md` của project Claude "VIVE pop up". Repo này là bản kỹ thuật.
