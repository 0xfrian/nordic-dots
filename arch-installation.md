# Arch Linux Installation

### Download OS Image and Flash USB Drive
Download Arch Linux disk image file (.iso) from [official Arch Linux website](https://archlinux.org/download/)

Flash disk image on USB drive using [*balenaEtcher*](https://www.balena.io/etcher/)
- Careful! USB drive will be wiped in the process!

### Boot from USB
Plug in USB drive and boot from USB drive.
- Note: some machines may require changing or overriding boot priority
  in BIOS settings.

pr0-gamer tip: `setfont ter-132n` to increase font resolution.

### Verify UEFI Boot
If `ls /sys/firmware/efi` results in an error, then our machine has
NOT booted in UEFI mode.
- Note: there are two boot modes, UEFI and BIOS. UEFI is considered
the more modern, user-friendly boot mode.

### Connect Internet (WiFi)
```bash
iwctl
device list
station <device_name> scan
station <device_name> get-networks
station <device_name> connect <network_name>
exit
```

### Set Time/Date
```bash
timedatectl set-ntp true
timedatectl
```

### Configure Partition Schema
List current partition schema
```bash
lsblk --paths
```

Format partitions
```bash
cgdisk <device_filepath>
```

Set up 3 partitions: `boot`, `swap`, and `root`
1. `boot` partition
    - First sector: `default`
    - Size in sectors: `512M` for 512 megabytes
    - Hex code: `ef00` for EFI system partition
    - Name: `boot`
2. `swap` partition
    - First sector: `default`
    - Size in sectors: `1G` for 1 gigabyte
    - Hex code: `8200` for Linux swap
    - Name: `swap`
3. `root` partition
    - First sector: `default`
    - Size in sectors: `default` remainder of disk space
    - Hex code: `8300` for Linux filesystem
    - Name: `root`

At this point, our partition schema should look like:
| # 	| Size                     	| Type                 	| Name 	|
|---	|--------------------------	|----------------------	|------	|
| 1 	| 512 MB                    | EFI system partition 	| boot 	|
| 2 	| 1024 MB                   | Linux swap           	| swap 	|
| 3 	| <remainder_of_diskspace> 	| Linux filesystem     	| root 	|

Write to system, and quit.

### Format and Mount Partitions
List newly-created partition schema
```bash
lsblk --paths
```

Format and mount partitions
1. `boot`
    - `mkfs.fat -F32 <boot_filepath>`
    - `mkdir -p /mnt/boot`
    - `mount <boot_filepath> /mnt/boot`
2. `swap`
    - `mkswap <swap_filepath>`
    - `swapon <swap_filepath>`
3. `root`
    - `mkfs.ext4 <root_filepath>`
    - `mount <root_filepath> /mnt`

### Install Base Packages
```bash
pacstrap -K /mnt linux linux-firmware base base-devel vi vim networkmanager network-manager-applet git 
```

### Configure New System
Generate file system table
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

Change root into our new system
```bash
arch-chroot /mnt
```

Set timezone
```bash
ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime
hwclock --systohc
```

Configure locales
```bash
vim /etc/locale.gen     # uncomment line containing "en_US.UTF-8 UTF-8"
locale-gen              # generate locale
vim /etc/locale.conf    # write "LANG=en_US.UTF-8"
```

Set hostname
```bash
vim /etc/hostname       # write "<hostname>"
```

Create new initial RAM filesystem
```bash
mkinitcpio -P
```

Set root password
```bash
passwd
```

Configure bootloader
```bash
pacman -Syu grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```
Note: if you encounter the error `grub-install: error: /boot doesn't
look like an EFI partition`, then `mount <boot_filepath> /boot` to
re-mount `boot` partition.

Exit and reboot
```bash
exit
shutdown -r now
```

### Booting up Arch Linux
Now we should be able to see GRUB as one of our boot options.

Log in as `root` using the password we set earlier via `passwd`.

### Connecting to Internet
```bas
systemctl start NetworkManager
systemctl enable NetworkManager
nmtui
```

### Add System User
```bash
useradd -g users -G wheel,storage,power -m <username> # add system
user
passwd <username>  # set password
visudo  # uncomment %wheel ALL=(ALL:ALL) NOPASSWD: ALL
```

### Time to RICE
Install window manager
```bash
pacman -S xorg-server xorg-init xterm i3
```

Configure `.xinitrc` to launch i3 on start-up
```bash
vim .xinitrc

# .xinitrc
exec i3
```

Install terminal emulator, web browser, font and emojis
```bash
pacman -S kitty firefox ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts-emoji
```

Install *yay* (AUR helper)
```bash
git clone https://aur.archlinux.org/yay-git.git
sudo chown -R <username> ./yay-git
cd yay-git
makepkg -si
```

Install audio drivers
```bash
sudo pacman -S pipewire pipewire-alsa pipewire-audio pipewire-pulse wireplumber sof-firmware alsa-ucm-conf
```

Install audio control GUI
```bash
sudo pacman -S pavucontrol
```

Configure `.xinitrc` to start audio drivers on start-up
```bash
vim .xinitrc

# .xinitrc 
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
```

Install bluetooth drivers
```bash
sudo pacman -S bluez bluez-utils
```

---

### Configuring Dual-Boot
Detect other OS's (e.g. dual-boot Windows + Arch)
```bash
sudo pacman -Syu os-prober ntfs-3g
vim /etc/default/grub  # uncomment GRUB_DISABLE_OS_PROBER=false
mount <windows_filepath> /mnt  # mount windows drive
grub-mkconfig -o /boot/grub/grub.cfg  # re-generate grub config
```

### Restoring USB Drive After Flashing
Using *balenaEtcher*

