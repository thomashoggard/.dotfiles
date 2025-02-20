## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

# aliases
alias vi="nvim"
alias vim="nvim"
alias v="nvim"
# alias vi="env TERM=wezterm nvim"
# alias vim="env TERM=wezterm nvim"
# alias v="env TERM=wezterm nvim"
alias p="pnpm"
alias lg="lazygit"

# export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# plugins=(git colorize tmux aws docker)

# source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
export DOTFILES=$HOME/.dotfiles
source $HOME/.zsh_profile

export VIM_CONFIG="$DOTFILES/nvim/.config/nvim/init.lua"

# source "$HOME/.zsh-additional-settings"

# Store secrets like tokens that we don't want to check into source.
if [[ -f "$HOME/.zsh-secrets" ]]; then
  source "$HOME/.zsh-secrets"
fi

path+=("$HOME/.local/bin")
