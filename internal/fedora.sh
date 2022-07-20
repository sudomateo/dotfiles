#!/bin/bash

packages=(
  dconf
  gcc-c++
  neovim
  ripgrep
  stow
  tmux
)

sudo dnf install ${packages[@]}
