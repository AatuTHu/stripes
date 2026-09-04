# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aatu/.zshrc'
export EDITOR="nvim"
autoload -Uz compinit
compinit
# End of lines added by compinstall

# --- History Configuration ---


# Append history to the file instead of overwriting it

setopt APPEND_HISTORY

# Share history across all open terminal windows in real time

setopt SHARE_HISTORY

# Ignore immediate duplicates

setopt HIST_IGNORE_DUPS

# Remove extra spaces from commands

setopt HIST_REDUCE_BLANKS


# --- Appearance & Prompt ---

PROMPT='%F{cyan}[ --> %1~]%f %# '

RPROMPT='%F{yellow}%*%f'


# --- Aliases ---

# Enable standard colors for commands like ls

alias ls='exa -l'
alias grep='grep --color=auto'


# --- Plugins & Behavior ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 


# Fix the suggestion text color

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
  builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
