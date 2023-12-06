set --global fish_greeting

# Rust.
set --global --export RUSTUP_HOME ~/.local/rustup
set --global --export CARGO_HOME ~/.local/cargo

# Go.
set --global --export GOPATH ~/.local/gopath

# CockroachDB.
set --global --export COCKROACH_AUTO_BALLAST false

# Editors.
set --global --export VISUAL nvim
set --global --export EDITOR nvim

fish_add_path --global \
    $GOPATH/bin \
    ~/.local/go/bin \
    $CARGO_HOME/bin \
    ~/.local/bin \
    ~/bin

set PATH bin $PATH
