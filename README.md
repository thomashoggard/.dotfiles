# Dotfiles

## Creating symbolic links

Using `stow` you can create a symbolic link to the dotfile. It will add the link one directory up outside the parent you run the commend within.

```bash
cd ~/.dotfiles
stow tmux # or */ for all folders
```

### Stow Personal Files

```bash
cd personal
stow --target=${HOME} */
```

### Stow League Files

```bash
cd league
stow --target=${HOME} */
```
