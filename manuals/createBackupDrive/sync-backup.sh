#!/bin/bash
# Location: move to '/usr/local/bin/sync-backup.sh' so dmenu can find it (call with sudo)
set -euo pipefail

BACKUP_ROOT="/mnt/hdd_backup"

# Mount HDD partitions, aborting if either fails
mount /dev/sdb2 "$BACKUP_ROOT" || {
    echo "ERROR: Failed to mount /dev/sdb2 on $BACKUP_ROOT. Aborting." >&2
    exit 1
}

mount /dev/sdb1 "$BACKUP_ROOT/boot/efi" || {
    echo "ERROR: Failed to mount /dev/sdb1 on $BACKUP_ROOT/boot/efi. Aborting." >&2
    umount "$BACKUP_ROOT" 2>/dev/null
    exit 1
}

# Extra safety: confirm both are actually mounted before touching any data
if ! mountpoint -q "$BACKUP_ROOT"; then
    echo "ERROR: $BACKUP_ROOT is not a mountpoint. Aborting." >&2
    exit 1
fi

if ! mountpoint -q "$BACKUP_ROOT/boot/efi"; then
    echo "ERROR: $BACKUP_ROOT/boot/efi is not a mountpoint. Aborting." >&2
    umount -R "$BACKUP_ROOT" 2>/dev/null
    exit 1
fi

# Sync Root and Boot files
rsync -axHAWXS --numeric-ids --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / "$BACKUP_ROOT/"

# Ensure the grub directory exists inside the backup before chrooting
mkdir -p "$BACKUP_ROOT/boot/grub"

# Regenerate the backup GRUB config
arch-chroot "$BACKUP_ROOT" grub-mkconfig -o /boot/grub/grub.cfg

# Clean up
umount -R "$BACKUP_ROOT"
echo "Backup sync completed successfully!"