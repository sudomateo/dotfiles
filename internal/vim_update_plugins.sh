#!/usr/bin/env bash

function upgrade_vim_plugins() {
  local plugin_dir=${HOME}/.vim/pack/plugins/start

  for plugin in $(ls ${plugin_dir}); do
    cd "${plugin_dir}/${plugin}"
    git pull
  done
}

upgrade_vim_plugins
