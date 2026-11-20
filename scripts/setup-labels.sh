#!/usr/bin/env bash
# Tạo bộ nhãn chuẩn của đội coder cho một repo khách hàng.
# Dùng: scripts/setup-labels.sh owner/repo [module1 module2 ...]
# Chỉ dùng REST API (phiên Claude Code không gọi được GraphQL).
set -euo pipefail
REPO="${1:?Cần owner/repo}"; shift || true

mk() {
  local name="$1" color="$2" desc="$3"
  if gh api "repos/$REPO/labels" -f name="$name" -f color="$color" -f description="$desc" >/dev/null 2>&1; then
    echo "  + $name"
  else
    gh api -X PATCH "repos/$REPO/labels/$(printf '%s' "$name" | jq -sRr @uri)" -f color="$color" -f description="$desc" >/dev/null && echo "  = $name"
  fi
}

echo "Trạng thái:"
mk status:draft     cccccc "Tech Lead đang viết"
mk status:ready     0e8a16 "Coder được nhận"
mk status:claimed   1d76db "Coder đang làm"
mk status:in-review fbca04 "Có PR, chờ QA"
mk status:changes   d93f0b "QA trả lại"
mk status:qa-pass   5319e7 "QA đạt, chờ Tech Lead merge"
mk status:blocked   b60205 "Chờ Tech Lead trả lời"
echo "Làn:"
for l in fe be sec fix; do mk "lane:$l" c5def5 "Làn $l"; done
echo "Loại:"
for t in feature bug security refactor docs; do mk "type:$t" bfdadc "Loại $t"; done
echo "Cỡ:"
mk size:S e4e669 "≤ 2 giờ"; mk size:M e4e669 "≤ 1 phiên"; mk size:L e4e669 "Phải chia nhỏ"
echo "Ưu tiên:"
mk prio:high b60205 "Gấp"; mk prio:normal ededed "Bình thường"; mk prio:low ededed "Khi rảnh"
echo "Module:"
mk module:shared 000000 "File dùng chung, chỉ Tech Lead"
for m in "$@"; do mk "module:$m" 0052cc "Module $m"; done
echo "Xong."
