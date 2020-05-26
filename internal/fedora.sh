#!/bin/bash

packages=(
  dconf
  neovim
  nodejs
  ripgrep
  stow
  tmux
)

sudo dnf install ${packages[@]}
