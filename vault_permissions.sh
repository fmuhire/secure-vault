#!/bin/bash

VAULT_DIR="$HOME/secure_vault"

# Check if vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: secure_vault does not exist!"
    exit 1
fi

# Function to update permissions
update_perm() {
    file=$1
    default_perm=$2

    echo
    echo "Current permissions for $file:"
    ls -l "$VAULT_DIR/$file"

    read -p "Do you want to change permissions for $file? (y/N) " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        read -p "Enter new permission (e.g., 600): " perm
        if [ -z "$perm" ]; then
            perm=$default_perm
        fi
    else
        perm=$default_perm
    fi

    chmod "$perm" "$VAULT_DIR/$file"
}

# Update permissions for each file
update_perm "keys.txt" 600
update_perm "secrets.txt" 640
update_perm "logs.txt" 644

# Display final permissions
echo
echo "Final file permissions:"
ls -l "$VAULT_DIR"

