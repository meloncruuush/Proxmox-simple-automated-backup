#!/bin/bash

DAYS=20
BACKUPSPATH=/root/Proxmox-simple-automated-backup/pvebackup

find $BACKUPSPATH -maxdepth 1 -type f -mtime +$DAYS -delete
