#!/bin/bash

VAULT_DIR="$HOME/secure_vault"
REPORT_FILE="$VAULT_DIR/vault_report.txt"

echo "===== Secure Vault Security Report =====" > "$REPORT_FILE"
echo "Generated on: $(date)" >> "$REPORT_FILE"
echo >> "$REPORT_FILE"

for file in "$VAULT_DIR"/*; do
    filename=$(basename "$file")
    size=$(stat -c %s "$file")
    modified=$(stat -c %y "$file")
    perms=$(stat -c %a "$file")

    echo "File: $filename" >> "$REPORT_FILE"
    echo "Size: $size bytes" >> "$REPORT_FILE"
    echo "Last Modified: $modified" >> "$REPORT_FILE"
    echo "Permissions: $perms" >> "$REPORT_FILE"

    if [ "$perms" -gt 644 ]; then
        echo "⚠️ SECURITY RISK DETECTED" >> "$REPORT_FILE"
    fi

    echo "-----------------------------" >> "$REPORT_FILE"
done

echo "Vault security report created successfully"

