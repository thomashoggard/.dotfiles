# We stow this folder multiple times. We create it first so the folder itself isn't a symlink.
mkdir ${HOME}/.config/kitty

# Stows all folders into ~
stow --target=${HOME} */
