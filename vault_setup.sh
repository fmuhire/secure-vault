#!/bin/bash

VAULT_DIR="$HOME/secure_vault"

mkdir -p "$VAULT_DIR"

touch "$VAULT_DIR/keys.txt"
touch "$VAULT_DIR/secrets.txt"
touch "$VAULT_DIR/logs.txt"

echo "Welcome to the Secure Vault - Keys File" > "$VAULT_DIR/keys.txt"
echo "Welcome to the Secure Vault - Secrets File" > "$VAULT_DIR/secrets.txt"
echo "Welcome to the Secure Vault - Logs File" > "$VAULT_DIR/logs.txt"

echo "Secure Vault setup completed successfully"
ls -l "$VAULT_DIR"

