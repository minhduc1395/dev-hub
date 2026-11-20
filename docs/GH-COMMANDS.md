# Lệnh GitHub cho phiên Claude Code

Phiên Claude Code (claude.ai/code, lịch chạy) **không gọi được GraphQL**, nên `gh issue list`, `gh pr create`, `gh label create` báo lỗi 403. Dùng REST qua `gh api` như dưới. `R=owner/repo`, `N=số issue`.

```bash
# Issue sẵn sàng (lọc nhiều nhãn: nối bằng dấu phẩy = phải có đủ)
gh api "repos/$R/issues?state=open&labels=status:ready" --jq '.[] | select(.pull_request|not) | "\(.number)\t\(.title)\t\([.labels[].name]|join(","))"'

# Module X có job đang chạy không (claimed / in-review / changes); kết quả > 0 là bận
for s in claimed in-review changes; do gh api "repos/$R/issues?state=open&labels=module:X,status:$s" --jq 'length'; done

# Đọc issue và comment
gh api repos/$R/issues/$N --jq '.title, .body'
gh api repos/$R/issues/$N/comments --jq '.[] | "\(.user.login): \(.body)"'

# Đổi trạng thái: thêm nhãn mới, gỡ nhãn cũ (dấu ":" viết %3A trong đường dẫn)
gh api repos/$R/issues/$N/labels -f 'labels[]=status:claimed' >/dev/null
gh api -X DELETE repos/$R/issues/$N/labels/status%3Aready >/dev/null

# Comment
gh api repos/$R/issues/$N/comments -f body="CLAIM DEV-1 · dự kiến xong ... · nhánh job/$N-..." >/dev/null

# Mở PR sau khi push nhánh
gh api repos/$R/pulls -f title="[module] ..." -f head="job/$N-ten" -f base=main -f body="Closes #$N ..." --jq '.html_url'

# PR của một issue (tìm theo nhánh)
gh api "repos/$R/pulls?state=open&head=${R%%/*}:job/$N-ten" --jq '.[].html_url'

# Xem diff của PR
gh api repos/$R/pulls/<số PR>/files --jq '.[] | "\(.filename) +\(.additions) -\(.deletions)"'

# Merge (chỉ Tech Lead)
gh api -X PUT repos/$R/pulls/<số PR>/merge -f merge_method=squash
```
