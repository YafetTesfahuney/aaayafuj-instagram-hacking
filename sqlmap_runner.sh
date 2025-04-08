#!/bin/bash

TARGET="$1"

if [[ -z "$TARGET" ]]; then
    echo "Usage: ./sqlmap_runner.sh https://target.com/vuln.php?id=1"
    exit 1
fi

echo "[+] Running sqlmap against: $TARGET"
sqlmap -u "$TARGET" --batch --random-agent --risk=2 --level=2 --output-dir=./logs/sqlmap/
