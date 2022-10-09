# Dotfiles

## Setting up submodules

Run the commands
- `git submodule init`
- `git submodule update`

## Creating symbolic links

Using [stow](https://www.gnu.org/software/stow/) you can create a symbolic link to the dotfile. It will add the link one directory up outside the parent you run the commend within.

## Installation
1. Run the script `install.sh`
2. Install machine specific configs
    1. If on a personal machine, stow personal and then run the script `install-personal.sh`
    2. If on a league machine, stow league and then run the script `install-league.sh`
