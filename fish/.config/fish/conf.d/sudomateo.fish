set --global fish_greeting

# Rust.
set --global --export RUSTUP_HOME ~/.local/rustup
set --global --export CARGO_HOME ~/.local/cargo

# Go.
set --global --export GOPATH ~/.local/gopath

# Editors.
if type --no-functions hx
    set --global --export VISUAL hx
    set --global --export EDITOR hx
end

set --local 1password_ssh_socket ~/.1password/agent.sock
if test -e $1password_ssh_socket -a -S $1password_ssh_socket
    set --global --export SSH_AUTH_SOCK $1password_ssh_socket
end

fish_add_path --global \
    ~/.local/bin \
    $CARGO_HOME/bin \
    $GOPATH/bin \
    ~/.local/go/bin \
    ~/.local/zig \
    ~/bin
