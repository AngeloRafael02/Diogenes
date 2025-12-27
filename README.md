# Diogenes

This Repository stores my main dotfiles for current and future Linux Machines

It is named "Diogenes" due to the author advocating a life of simplicity and rejecting societal norms. (mainly because his hardware is OLD)

### Repository Structure

```bash
/
├── benchmarks/ #Stores seldom benchmarks of system via 'systmd-analyze'
├── dotfiles/   #Stores the actual dot files of the machine 
└── scripts/    #Stores frequently used scripts of the Author
```

### Device

| Software  | Selection |
| ------------- |:-------------:|
| Operating System | [Arch Linux](https://archlinux.org/)   |
| Desktop Environment | just [i3](https://i3wm.org/)     |
| Terminal | [xterm](https://wiki.archlinux.org/title/Xterm)    |
| Greeter | [LightDM](https://wiki.archlinux.org/title/LightDM) |
| Audio | [Pipewire](https://wiki.archlinux.org/title/PipeWire) |

### Packages Used

1. [nano](https://wiki.archlinux.org/title/Nano) - quick IDE for single-file modifications
2. [feh](https://wiki.archlinux.org/title/Feh) - image viewer and [wallpaper](https://i.redd.it/8zv7hddo6ia11.png) setter
3. [fastfetch](https://archlinux.org/packages/extra/x86_64/fastfetch/) - system information tool
4. [ufw](https://wiki.archlinux.org/title/Uncomplicated_Firewall) - firewall
5. [bluez](https://archlinux.org/packages/extra/x86_64/bluez/) and [bluez-utils](https://archlinux.org/packages/?name=bluez-utils) - Bluetooth protocol stack and utility
6. [libsecret](https://github.com/GNOME/libsecret) and [gnome-keyring](https://wiki.archlinux.org/title/GNOME/Keyring) - for storing private keys like git keys
7. [noto-fonts](https://archlinux.org/packages/extra/any/noto-fonts/), [noto-fonts-cjk](https://archlinux.org/packages/extra/any/noto-fonts-cjk/), and [noto-fonts-emoji](https://archlinux.org/packages/extra/any/noto-fonts-emoji/) - covering all the world's languages and scripts
8. [libnotify](https://github.com/GNOME/libnotify) and [notification-daemon](https://archlinux.org/packages/?name=notification-daemon) -  for notifications (such as [low battery notifications](https://ejmastnak.com/tutorials/arch/battery-alert/))
9. [acpi](https://wiki.archlinux.org/title/A1CPI_modules) - for battery, power, and thermal readings
10. [brightnessctl](https://man.archlinux.org/man/extra/brightnessctl/brightnessctl.1.en) - brightness control tool
11. [xorg-xrandr](https://wiki.archlinux.org/title/Xrandr) - RandR extension cli (for [external monitor confuguration](https://ejmastnak.com/tutorials/arch/displays/))

### GUI Apps

1. [vlc](https://wiki.archlinux.org/title/VLC_media_player) - multimedia app
2. [gucview2](https://man.archlinux.org/man/guvcview.1.en) - camera app
3. [flameshot](https://wiki.archlinux.org/title/Flameshot) - screenshot app
4. [firefox](https://wiki.archlinux.org/title/Firefox) - web browser
5. [code](https://archlinux.org/packages/extra/x86_64/code/) (VS Code) - Programming IDE

### TUI Apps

1. [yazi](https://github.com/sxyazi/yazi) - file explorer
2. [cmus](https://github.com/cmus/cmus) - mp3 player
3. [htop](https://man.archlinux.org/man/htop.1.en) - system monitoring
4. [bmon](https://man.archlinux.org/man/extra/bmon/bmon.8.en) - network monitoring
5. [bluetui](https://wiki.archlinux.org/title/Bluetooth) - bluetooth manager

### yay and AUR Packages
1. [yay](https://aur.archlinux.org/packages/yay) - AUR Helper (installed First via `makepkg -si`)
2. [xdg-desktop-portal-termfilechooser-hunkyburrito-git](https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser?tab=readme-ov-file#installation) - make yazi the filechooser  for firefox
   - After installateion you must alsop do some configutaion in firefox via opening `about:config` in the address bar:
   ```
    widget.use-xdg-desktop-portal.file-picker = 1
    widget.use-xdg-desktop-portal = true
   ```

