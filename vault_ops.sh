#!/bin/bash

VAULT_DIR="$HOME/secure_vault"
SECRETS_FILE="$VAULT_DIR/secrets.txt"
LOGS_FILE="$VAULT_DIR/logs.txt"

while true; do
    echo
    echo "===== Secure Vault Menu ====="
    echo "1) Add Secret"
    echo "2) Update Secret"
    echo "3) Add Log Entry"
    echo "4) Access Keys"
    echo "5) Exit"
    read -p "Choose an option: " option

    case "$option" in
        1)
            read -p "Enter secret: " secret
            echo "$secret" >> "$SECRETS_FILE"
            echo "Secret added successfully"
            ;;
        2)
            read -p "Enter text to replace: " old
            read -p "Enter new text: " new

            if grep -q "$old" "$SECRETS_FILE"; then
                sed -i "s/$old/$new/g" "$SECRETS_FILE"
                echo "Secret updated successfully"
            else
                echo "No match found."
            fi
            ;;
        3)
            echo "$(date '+%Y-%m-%d %H:%M:%S') - Log entry added" >> "$LOGS_FILE"
            echo "Log entry added"
            ;;
        4)
            echo "ACCESS DENIED 🚫"
            ;;
        5)
            echo "Exiting Secure Vault"
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done

