# Post install steps

```shell
useradd -m $USER
passwd $USER
usermod -aG wheel,audio,video,optical,storage $USER
visudo # uncomment wheel line
pacman -S grub efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S nano vim networkmanager
systemctl enable NetworkManager
```



