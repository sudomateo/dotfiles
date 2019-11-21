#!/bin/bash

# Pacman packages.
pacmanPackages=(
  adobe-source-code-pro-fonts
  aws-cli
  base
  base-devel
  bash
  bash-completion
  bind-tools
  binutils
  cryptsetup
  dconf-editor
  device-mapper
  dmidecode
  dnsmasq
  docker
  e2fsprogs
  ebtables
  efivar
  firefox
  fwupd
  git
  gnome
  gnome-software-packagekit-plugin
  gnome-tweaks
  go
  inetutils
  intel-ucode
  iputils
  jfsutils
  jq
  libreoffice-still
  libvirt
  linux-firmware
  logrotate
  lvm2
  man-db
  man-pages
  mdadm
  neofetch
  netcat
  networkmanager
  networkmanager-openvpn
  networkmanager-pptp
  networkmanager-vpnc
  obs-studio
  openssh
  perl
  qemu
  ripgrep
  sysfsutils
  tree
  usbutils
  vagrant
  vi
  vim
  xfsprogs
)

yayPackages=(
  gnome-shell-extension-dash-to-dock
  rcm
  slack-desktop
  zoom
)

sudo pacman -S --needed ${pacmanPackages[*]}

if !(command -v yay &> /dev/null); then
  git clone https://aur.archlinux.org/yay.git ${HOME}/yay
  $(cd ${HOME}/yay; makepkg -sirc)
fi

for yayPackage in ${yayPackages[*]}; do
  if pacman -Q | grep -i ${yayPackage} &> /dev/null; then
    continue
  fi
  yay ${yayPackage}
done

sudo systemctl enable docker
sudo systemctl enable gdm
sudo systemctl enable libvirtd
sudo systemctl enable NetworkManager

sudo usermod -aG docker,wheel,libvirt $(id -u -n)

sudo mkdir -p /etc/pacman.d/hooks
sudo tee /etc/pacman.d/hooks/100-systemd-boot.hook > /dev/null << EOF
[Trigger]
Type = Package
Operation = Upgrade
Target = systemd

[Action]
Description = Updating systemd-boot
When = PostTransaction
Exec = /usr/bin/bootctl update
EOF
