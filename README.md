# dev-hub

Trung tâm điều phối đội coder (DEV) của BOD. Repo này **không chứa code dự án**: chỉ có quy trình, mẫu, sổ dự án và danh sách coder.

Đội chạy như một công ty outsource:

```
BOD / các phòng ──nhu cầu──▶ Tech Lead (WEB) ──job (GitHub Issue)──▶ Coder (Claude Code)
                                   ▲                                      │
                                   └── merge, deploy ◀── QA review ◀── PR ┘
```

| Cần gì | Mở đâu |
|---|---|
| Quy trình đầy đủ: nhãn, vòng đời job, nhánh, PR, chống chồng chéo | [docs/PROCESS.md](docs/PROCESS.md) |
| Việc của Tech Lead (viết job, chia module) | [docs/TECH-LEAD.md](docs/TECH-LEAD.md) |
| Câu lệnh chuẩn cho một phiên coder | [docs/CODER-PROMPT.md](docs/CODER-PROMPT.md) |
| Câu lệnh chuẩn cho QA review PR | [docs/QA-PROMPT.md](docs/QA-PROMPT.md) |
| Dự án đang phục vụ | [projects/](projects/) |
| Danh sách coder và làn | [roster.md](roster.md) |
| Mẫu để chép sang repo dự án | [templates/](templates/) |
| Tạo bộ nhãn cho repo dự án | `scripts/setup-labels.sh <owner/repo>` |

Quy tắc cứng:
1. Một job = một GitHub Issue trong repo dự án, thuộc đúng 1 module.
2. Coder không merge, không deploy, không sửa ngoài phạm vi job, không sửa file dùng chung.
3. Không merge khi chưa có `QA-PASS` và Tech Lead duyệt.
4. Mọi trao đổi về job nằm trong Issue/PR của job, theo mẫu comment ở PROCESS.md mục 6.

Bản tổ chức (vai trò, lộ trình dựng) nằm ở project doc `claude/TEAM-04-doi-coder.md` của project Claude "VIVE pop up". Repo này là bản kỹ thuật.
