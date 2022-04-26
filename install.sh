# We stow this folder multiple times. We create it first so the folder itself isn't a symlink.
mkdir ${HOME}/.config/kitty
mkdir ${HOME}/.local/bin

# Stows all folders into ~
stow --target=${HOME} */
