#!/bin/sh

# Profile UUIDs can be generated using the following command:
# uuidgen --sha1 --namespace @oid --name NAME

dconf load /org/gnome/terminal/legacy/profiles:/ << EOF
[/]
default='40ca0a8f-ca88-40f7-aab2-12694233beb7'
list=['40ca0a8f-ca88-40f7-aab2-12694233beb7', 'c7395bf4-3304-4032-ad42-ba5b459762f8']

[:40ca0a8f-ca88-40f7-aab2-12694233beb7]
audible-bell=false
background-color='rgb(40,40,40)'
background-transparency-percent=0
bold-color='rgb(235,219,178)'
bold-color-same-as-fg=false
bold-is-bright=true
cursor-background-color='rgb(235,219,178)'
cursor-colors-set=true
cursor-foreground-color='rgb(40,40,40)'
foreground-color='rgb(235,219,178)'
highlight-background-color='rgb(235,219,178)'
highlight-colors-set=true
highlight-foreground-color='rgb(40,40,40)'
palette=['rgb(40,40,40)', 'rgb(204,36,29)', 'rgb(152,151,26)', 'rgb(215,153,33)', 'rgb(69,133,136)', 'rgb(177,98,134)', 'rgb(104,157,106)', 'rgb(168,153,132)', 'rgb(146,131,116)', 'rgb(251,73,52)', 'rgb(184,187,38)', 'rgb(250,189,47)', 'rgb(131,165,152)', 'rgb(211,134,155)', 'rgb(142,192,124)', 'rgb(235,219,178)']
use-theme-colors=false
use-transparent-background=false
visible-name='Gruvbox (Dark)'

[:c7395bf4-3304-4032-ad42-ba5b459762f8]
audible-bell=false
background-color='rgb(251,241,199)'
background-transparency-percent=0
bold-color='rgb(60,56,54)'
bold-color-same-as-fg=false
bold-is-bright=true
cursor-background-color='rgb(60,56,54)'
cursor-colors-set=true
cursor-foreground-color='rgb(251,241,199)'
foreground-color='rgb(60,56,54)'
highlight-background-color='rgb(60,56,54)'
highlight-colors-set=true
highlight-foreground-color='rgb(251,241,199)'
palette=['rgb(251,241,199)', 'rgb(204,36,29)', 'rgb(152,151,26)', 'rgb(215,153,33)', 'rgb(69,133,136)', 'rgb(177,98,134)', 'rgb(104,157,106)', 'rgb(124,111,100)', 'rgb(146,131,116)', 'rgb(157,0,6)', 'rgb(121,116,14)', 'rgb(181,118,20)', 'rgb(7,102,120)', 'rgb(143,63,113)', 'rgb(66,123,88)', 'rgb(60,56,54)']
use-theme-colors=false
use-transparent-background=false
visible-name='Gruvbox (Light)'
EOF
