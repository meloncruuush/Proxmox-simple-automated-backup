#!/bin/bash

# Load variables from .env file (if it exists)
if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found."
    exit 1
fi

# Ensure DAYS is set (default to 20 if not defined)
DAYS="${CLEANUPDAYS:-20}"

find ./pvebackup -maxdepth 1 -type f -mtime +$DAYS -delete
