#!/bin/bash

packages=(
  dconf
  gcc-c++
  gnome-tweak-tool
  neovim
  ripgrep
  stow
  tmux
)

sudo dnf install ${packages[@]}
