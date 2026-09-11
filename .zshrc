HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
zstyle :compinstall filename '/home/aatu/.zshrc'
export EDITOR="nvim"
autoload -Uz compinit
compinit



setopt APPEND_HISTORY

setopt SHARE_HISTORY

setopt HIST_IGNORE_DUPS


setopt HIST_REDUCE_BLANKS


PROMPT='%F{cyan}[ --> %1~]%f %# '

RPROMPT='%F{yellow}%*%f'


alias ls='exa -l'
alias grep='grep --color=auto'


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 



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
