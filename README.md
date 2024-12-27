# dotfiles

Matthew Sanabria's wonderful dotfiles.

## Requirements

* [git](https://git-scm.com)
* [stow](https://www.gnu.org/software/stow/)

## Installation 

Use `stow` to symlink these dotfiles into the correct location.

```sh
stow --target $HOME bash
stow --target $HOME fish
stow --target $HOME ghostty
stow --target $HOME git
stow --target $HOME helix
stow --target $HOME neovim
stow --target $HOME tmux
stow --target $HOME xkb
```

## License

MPL-2.0

## Author Information

Created by [Matthew Sanabria](https://matthewsanabria.dev).
