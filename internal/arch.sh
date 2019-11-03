#!/bin/bash

# Pacman packages.
pacmanPackages=(
  adobe-source-code-pro-fonts
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
  networkmanager
  networkmanager-openvpn
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

yay_packages=(
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
  yay ${yayPackage}
done

sudo systemctl enable docker
sudo systemctl enable gdm
sudo systemctl enable libvirtd
sudo systemctl enable NetworkManager

sudo usermod -aG docker,wheel,libvirt $(id -u -n)
