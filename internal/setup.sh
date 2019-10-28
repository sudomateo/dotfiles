#!/usr/bin/env bash

vim_plugins=(
fatih/vim-go
hashicorp/sentinel.vim
hashivim/vim-terraform
morhetz/gruvbox
scrooloose/nerdtree
tpope/vim-commentary
tpope/vim-fugitive
tpope/vim-surround
vim-airline/vim-airline
)

function install_vim_plugins() {
  local install_dir=${HOME}/.vim/pack/plugins/start
  mkdir -p ${install_dir} 
 
  for plugin in ${vim_plugins[*]}; do
    local plugin_name="${plugin##*/}"
 
    if [ ! -d ${install_dir}/${plugin_name} ]; then
      git clone https://github.com/${plugin} ${install_dir}/${plugin_name}
    fi
  done
}

install_vim_plugins
(cd ${HOME}; rcup rcrc)
(cd ${HOME}; rcup)
