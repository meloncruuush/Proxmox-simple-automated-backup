#!/bin/bash

DAYS=20
find ./pvebackup -maxdepth 1 -type f -mtime +$DAYS -delete
