#!/bin/bash

# Define backup directory and filename with today's date
BACKUP_DIR="/root/Proxmox-simple-automated-backup/pvebackup"
DATE=$(date +"%Y%m%d")
BACKUP_FILE="$BACKUP_DIR/$DATE.tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Copy config.db to backup directory
cp /var/lib/pve-cluster/config.db "$BACKUP_DIR/"

# Create a compressed archive of /etc/pve
tar -czvf "$BACKUP_DIR/pve.tar.gz" /etc/pve

# Bundle both files into a final backup
tar -czvf "$BACKUP_FILE" "$BACKUP_DIR/config.db" "$BACKUP_DIR/pve.tar.gz"

# Clean up intermediate files
rm "$BACKUP_DIR/config.db" "$BACKUP_DIR/pve.tar.gz"

# Print success message
echo "Backup completed: $BACKUP_FILE"
