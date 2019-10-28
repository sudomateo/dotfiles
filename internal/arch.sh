#!/bin/bash

# dnsmasq
# ebtables
# noto-fonts
# noto-fonts-cjk
# noto-fonts-emoji
# noto-fonts-extra

# Pacman packages.
pacmanPackages=(
  adobe-source-code-pro-fonts
  alacritty
  arandr
  autorandr
  base
  base-devel
  bind-tools
  binutils
  cryptsetup
  device-mapper
  dmidecode
  docker
  e2fsprogs
  efivar
  feh
  firefox
  fwupd
  git
  go
  i3-gaps
  i3blocks
  i3lock
  i3status
  inetutils
  intel-ucode
  iputils
  jfsutils
  jq
  libnotify
  libreoffice-still
  libvirt
  light
  lightdm
  lightdm-gtk-greeter
  linux-firmware
  logrotate
  lvm2
  man-db
  man-pages
  mdadm
  neofetch
  network-manager-applet
  networkmanager
  obs-studio
  openssh
  pavucontrol
  perl
  qemu
  ripgrep
  rofi
  sysfsutils
  thunar
  tmux
  tree
  usbutils
  vagrant
  vi
  vim
  xfsprogs
  xorg-server
  xorg-xrandr
)

yay_packages=(
  rcm
  slack-desktop
  systemd-boot-pacman-hook
  zoom
)

sudo pacman -S --needed ${pacmanPackages[*]}

# if !(command -v yay &> /dev/null); then
#   git clone https://aur.archlinux.org/yay.git ${HOME}/yay
#   $(cd ${HOME}; makepkg -sirc)
# fi

# for yayPackage in ${yayPackages[*]}; do
#   yay ${yayPackage}
# done

# sudo systemctl enable autorandr 
# sudo systemctl enable docker
# sudo systemctl enable libvirtd 
# sudo systemctl enable lightdm 
# sudo systemctl enable NetworkManager 

# Add user to audio, video, wheel groups
# sudo usermod -aG audio,video,docker,wheel,libvirt 
