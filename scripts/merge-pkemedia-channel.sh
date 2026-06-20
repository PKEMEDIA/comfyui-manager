#!/bin/bash
# Custom Git merge driver for pkemedia-channel.json
# Intelligently merges the "nodes" array from both sides while removing duplicates.
# Usage (configured in .gitattributes and git config):
#   merge.pkemedia-channel.driver = ./scripts/merge-pkemedia-channel.sh %O %A %B

set -euo pipefail

ANCESTOR="$1"
CURRENT="$2"     # This is the file we must write the final result into
OTHER="$3"

# Check if jq is available (it is on GitHub Actions ubuntu-latest)
if ! command -v jq &> /dev/null; then
    echo "jq not found, falling back to simple union"
    # Fallback: simple concatenation + basic dedup
    cat "$CURRENT" "$OTHER" | sort | uniq > "${CURRENT}.tmp"
    mv "${CURRENT}.tmp" "$CURRENT"
    exit 0
fi

# Smart merge: combine nodes arrays, deduplicate by name or url
jq -s '
  (.[1].nodes // []) + (.[2].nodes // []) |
  unique_by(.name // .url // .)
' "$ANCESTOR" "$CURRENT" "$OTHER" > /tmp/merged-nodes.json

# Rebuild the full JSON preserving other top-level keys from CURRENT (ours)
jq --slurpfile newnodes /tmp/merged-nodes.json '
  .nodes = $newnodes[0]
' "$CURRENT" > "${CURRENT}.tmp"

mv "${CURRENT}.tmp" "$CURRENT"

echo "[merge-pkemedia-channel] Successfully merged node lists (deduplicated by name/url)"
exit 0