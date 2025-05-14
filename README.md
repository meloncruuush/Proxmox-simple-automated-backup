# Proxmox-simple-automated-backup
A simple way to backup Proxmox configuration in cloud, with cleanup of old files.

To backup your Proxmox configuration, you need to save the file `/var/lib/pve-cluster/config.db`. This is the database that at runtime populates the `/etc/pve` directory.
I personally like to copy the `/etc/pve` directory too, simply because its content are readable manually, and some redundancy doesn't hurt.

### How to use?

First, edit the `.env` file, and select for how many days you want to keep the backups. For example, I personally want to delete backups older than 20 days.

You can setup a cronjob to run the two scripts, for example using `crontab -e`:
```
0 2 * * * /root/Proxmox-simple-automated-backup/backup-proxmox.sh
15 2 * * * /root/Proxmox-simple-automated-backup/old-backup-cleanup.sh
```
This is how I set up mine.

If you also want to have your backups online, one of the possible solutions is to use `rclone`. After you have configured it, all you have to do is to just add another cronjob:
```
30 3 * * * rclone sync /root/Proxmox-simple-automated-backup/pvebackup OneDrive:ProxmoxBackup
```

And that's it! Now everynight your Proxmox configuration will be backed up, and if you break something, all you have to do is reinstall and swap the configuration!
