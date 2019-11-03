#!/usr/bin/env bash

# Generate UUIDs like so.
# uuidgen --sha1 --namespace @oid --name NAME

dconf load /org/gnome/terminal/legacy/profiles:/ << EOF
[/]
default='86bc7c1e-75f2-59cd-bf45-be1f2cf6464e'
list=['86bc7c1e-75f2-59cd-bf45-be1f2cf6464e']

[:86bc7c1e-75f2-59cd-bf45-be1f2cf6464e]
audible-bell=false
background-color='#282828282828'
bold-color='#000000000000'
bold-color-same-as-fg=true
bold-is-bright=true
foreground-color='#ebebdbdbb2b2'
palette=['#282828282828', '#cccc24241d1d', '#989897971a1a', '#d7d799992121', '#454585858888', '#b1b162628686', '#68689d9d6a6a', '#bdbdaeae9393', '#7c7c6f6f6464', '#fbfb49493434', '#b8b8bbbb2626', '#fafabdbd2f2f', '#8383a5a59898', '#d3d386869b9b', '#8e8ec0c07c7c', '#ebebdbdbb2b2']
scrollback-lines=10000
use-system-font=true
use-theme-colors=false
visible-name='Gruvbox Dark'
EOF
