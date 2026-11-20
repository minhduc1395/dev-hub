#!/usr/bin/env bash
# Đưa một repo khách hàng vào đội coder.
# Dùng: scripts/onboard-client.sh <đường dẫn bản clone> <owner/repo> <module1> [module2 ...]
# Việc script làm:
#   1. Chép mẫu job, mẫu PR vào .github/ của repo khách.
#   2. Tạo CLAUDE.md và docs/modules/ (bộ khung) nếu chưa có. Không ghi đè file đã có.
#   3. Tạo bộ nhãn qua REST API.
# Sau đó Tech Lead điền CLAUDE.md, các gói module, rồi commit; DIR thêm repo vào clients.yml.
set -euo pipefail
HUB="$(cd "$(dirname "$0")/.." && pwd)"
DIR="${1:?Cần đường dẫn bản clone}"; REPO="${2:?Cần owner/repo}"; shift 2
[ $# -ge 1 ] || { echo "Cần ít nhất 1 module"; exit 1; }

cp_if_missing() { [ -e "$2" ] && echo "  giữ $2" || { mkdir -p "$(dirname "$2")"; cp "$1" "$2"; echo "  + $2"; }; }

cd "$DIR"
cp_if_missing "$HUB/templates/ISSUE_TEMPLATE/job.md" .github/ISSUE_TEMPLATE/job.md
cp_if_missing "$HUB/templates/PULL_REQUEST_TEMPLATE.md" .github/PULL_REQUEST_TEMPLATE.md
cp_if_missing "$HUB/templates/CLAUDE.project.md" CLAUDE.md

if [ ! -e docs/modules/README.md ]; then
  mkdir -p docs/modules
  { echo "# Bản đồ module"; echo; echo "| Module | Thư mục | Làn chính | Gói ngữ cảnh |"; echo "|---|---|---|---|";
    for m in "$@"; do echo "| $m | <điền> | <fe/be> | [$m.md]($m.md) |"; done
    echo "| shared | package.json, lockfile, cấu hình, migration | Tech Lead | (không có gói) |"; } > docs/modules/README.md
  echo "  + docs/modules/README.md"
fi
for m in "$@"; do sed "s/<tên>/$m/" "$HUB/templates/module-pack.md" > /tmp/pack.$$ && cp_if_missing /tmp/pack.$$ "docs/modules/$m.md"; done
rm -f /tmp/pack.$$

"$HUB/scripts/setup-labels.sh" "$REPO" "$@"
echo "Xong. Tech Lead điền CLAUDE.md và docs/modules/*.md rồi commit."
