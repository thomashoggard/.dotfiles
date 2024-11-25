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
alias vi="env TERM=wezterm nvim"
alias vim="env TERM=wezterm nvim"
alias v="env TERM=wezterm nvim"
alias p="pnpm"

# When running nvim in tmux, create a pipe for the current session.
tmux_running=$(pgrep tmux)
if [[ -n $tmux_running ]]; then
  alias nvim="env TERM=wezterm nvim --listen /tmp/nvim-server-$(tmux display-message -p '#S').pipe"
fi
alias lg="lazygit"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git colorize tmux aws docker)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

unalias gco
gco() {
  is_in_git_repo &&
    git checkout $(git branch | fzf)
}

export DOTFILES=$HOME/.dotfiles
source $HOME/.zsh_profile

export VIM_CONFIG="$DOTFILES/nvim/.config/nvim/init.lua"

source "$HOME/.zsh-additional-settings"
source "$HOME/.zsh-secrets"

light() {
  kitty +kitten themes --reload-in=all Catppuccin-Latte
}

dark() {
  kitty +kitten themes --reload-in=all Catppuccin-Mocha
}

path+=("$HOME/.local/bin")

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
# export PNPM_HOME="/home/thoggard/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end
