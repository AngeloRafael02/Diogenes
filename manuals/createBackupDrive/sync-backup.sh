#!/bin/bash
# Mount HDD partitions
mount /dev/sdb2 /mnt/hdd_backup
mount /dev/sdb1 /mnt/hdd_backup/boot/efi

# Sync Root and Boot files
rsync -axHAWXS --numeric-ids --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /mnt/hdd_backup/

# Ensure the grub directory exists inside the backup before chrooting
mkdir -p /mnt/hdd_backup/boot/grub

# Regenerate the backup GRUB config
arch-chroot /mnt/hdd_backup grub-mkconfig -o /boot/grub/grub.cfg

# Clean up
umount -R /mnt/hdd_backup
echo "Backup sync completed successfully!"