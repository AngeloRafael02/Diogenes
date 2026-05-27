### GOAL OF THE FILE
- To have your Second Storage (HDD or SSD) have its own copy of your system 
(including linux kernel and bootloader) as a backup if your primary storage 
where you most likely also partitioned your '/boot' and '/'
- RAID 1 configuration can also be an option instead of this, but is not 
recommended if you primary and backup storage spaces are different (i.e. one
is an SSD and the other is an HDD, or if both have different sizes)

### Prerequisites
The following Arch packages are needed in this project:
- arch-install-scripts - Script to Aid in installing Arch Linux
- rsync - copying tool for remote and local files
- dosfstools - For Formatting partitions fo a certain file system

### Steps
1. <b>Partition the second Storage</b>
    - open cfdisk on your secondary storage 
    ```shell
        sudo cfdisk /dev/sdb
    ```
    - create 2 partitions on the backup storage
        - `/dev/sdb1`: EFI System Partition (~1GB, format as vfat/FAT32, Type: EFI System)
        - `/dev/sdb2`: Your backup root partition (Format as ext4, Type: Linux filesystem). __Not<b>e</b>: You can use the rest of the Second Storage here, or leave a third partition for general storage.__  
    - format the new partitions like this:

    ```shell
        sudo mkfs.vfat -F 32 /dev/sdb1
        sudo mkfs.ext4 /dev/sdb2
    ```
2. <b>Install Backup Bootloader</b>
    - Create a temporary mount point and mount the HDD's new root and EFI partitions:
    ```shell
    sudo mkdir -p /mnt/hdd_backup
    sudo mount /dev/sdb2 /mnt/hdd_backup
    sudo mkdir -p /mnt/hdd_backup/boot/efi
    sudo mount /dev/sdb1 /mnt/hdd_backup/boot/efi
    ```
    - Install Grub Bootloader into the second storage
    ``` shell
    sudo grub-install --target=x86_64-efi --efi-directory=/mnt/hdd_backup/boot/efi --bootloader-id=Arch-HDD-Backup --removable
    ```
    __(The `--removable` flag is highly recommended for caddy drives, as it ensures the drive remains bootable even if the motherboard's NVRAM resets).__

3. <b>Clone the System (The Pseudo-Backup)</b>
    - Run the initial sync to copy your working system to the HDD:
    ```shell
    sudo rsync -axHAWXS --numeric-ids --info=progress2 --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /mnt/hdd_backup/
    ```

4. <b>Configure the HDD's Isolated Environment</b>
    - Update the clone `/etc/fstab`
        - get the UUID of the following:
        ```shell
        lsblk -d -o NAME,UUID /dev/sdb1
        lsblk -d -o NAME,UUID /dev/sdb2
        ```
        - replace the values in the new fstab file via `sudo nano /mnt/hdd_backup/etc/fstab`
    - Generate the Cloned GRUB Config
    ```shell
    sudo arch-chroot /mnt/hdd_backup
    grub-mkconfig -o /boot/grub/grub.cfg
    exit
    ```

You can now safely umount safely
```shell
sudo umount -R /mnt/hdd_backup
```

5. <b>Automate the Syncing Process (Optional but Recommended)</b>
    - See [Diogenes/manuals/createBackupDrive/sync-backup.sh](Diogenes/manuals/createBackupDrive/sync-backup.sh) for the automated script to update that backup storage manually
    - the file must be located in `/usr/local/bin/sync-backup.sh` and must be made execuatbale via `sudo chmod +x /usr/local/bin/sync-backup.sh`