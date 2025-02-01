################################################################################
# Functions

# command to make git a bit shorter since it gets used so much...
function _my_g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    /usr/bin/git status -uno -s
  fi
}

# command for terraform using aws creds from op
function _my_tf_aws() {
    op run --env-file=/Users/cjon/.dotfiles/op/aws.env -- terraform "$@"
}

# command for terraform using aws creds from op
function _my_tf_cf() {
    op run --env-file=/Users/cjon/.dotfiles/op/cloudflare.env -- terraform "$@"
}
# command for aws using creds from op
function _my_aws() {
    op run --env-file=/Users/cjon/.dotfiles/op/aws.env -- aws "$@"
}

# better zsh-vi-mode command line editing
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  # ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

# better chezmoi command
function c() {
  if [[ $# = 0 ]]; then
    chezmoi status
  elif [ "$1" = "st" ]; then
    shift
    chezmoi status "$@"
  elif [ "$1" = "d" ]; then
    shift

    chezmoi diff "$@"
  elif [ "$1" = "a" ]; then
    shift
    chezmoi diff "$@"
    chezmoi add "$@"
  elif [ "$1" = "ja" ]; then
    # just add it with no commit... for when you need to git add --patch
    shift

    chezmoi -c ~/.config/chezmoi/nocommit.toml add "$@"
  else
    chezmoi "$@"
  fi
}
function _c() {
  _chezmoi "$@"
}

function ipinfo() { curl "https://ipinfo.io/$1" ; }
function whatsmyip() { dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}' ; }
function mc() { mkdir -p -- "$1" && cd -P -- "$1" ; }

################################################################################
# Options

# yes, I would like to be able to do comments interactively
setopt interactive_comments

# no I don't want shared history between shells
unsetopt share_history

# corrections are annoying
setopt nocorrectall

# disable <C-s> and <C-q>
stty -ixon -ixoff

################################################################################
# Local Config

# get any config unique to this device
if [[ -s "${ZDOTDIR:-$HOME}/.zshlocal-$(hostname)" ]]; then
    source "${ZDOTDIR:-$HOME}/.zshlocal-$(hostname)"
fi

################################################################################
# Kubernetes config

if [[ -f /Users/cjon/.config/zsh/.zsh_kubectl ]]; then
    source /Users/cjon/.config/zsh/.zsh_kubectl
fi

################################################################################
# Shell integrations
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

################################################################################
# Zinit
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
bindkey  autosuggest-accept
# zinit light Aloxaf/fzf-tab

# proper vi mode
zinit ice depth=1
zinit light "jeffreytse/zsh-vi-mode"

# set up ^R with fzf
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

################################################################################
# Completion stuff

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Actually Load completions
autoload compinit
compinit

# expand dotfiles too
_comp_options+=(globdots)

#### ---> <XXX figure this stuff out and know if it is desirable>
# show menus for stuff
# zstyle ':completion:*' menu select

# Discarded Completion styling
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#### <---

zinit cdreplay -q

complete -C aws_completer aws
compdef _my_aws=aws
# have to jump through some hoops to get terraform autocomplete working
# had to install terraform, run -install-autocomplete and steal the binary
# then moved it to this location and renamed it.... :-|
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C ~/.local/share/terraform/_terraform terraform
compdef _my_tf_aws=terraform
compdef _my_tf_cf=terraform
compdef _my_g=git
compdef _c c

# Keybindings
# bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

################################################################################
# Aliases

# per http://bewatermyfriend.org/p/2016/002/
alias g='noglob _my_g'
alias gg='noglob git status'
alias git='noglob git'
alias gcv='noglob git commit -v'
alias gap='noglob git add --patch'

alias y='yadm'
alias yy='yadm st'
alias ycv='yadm commit -v'

# use nvim
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias v.='nvim .'
alias vdiff='nvim -d'

alias ipy='python -m IPython'

alias k=kubectl
alias kall='k get all -o wide --show-labels'
export yk=(-o yaml)
export dk=(-o yaml --dry-run=client)
alias rmk='kubectl delete --grace-period=0 --force=true'
alias kaf='kubectl apply -f'

alias tfaws='_my_tf_aws'
alias tfcf='_my_tf_cf'
alias aws=_my_aws

alias l='ls --color=auto -CF'
alias la='ls -a --color=auto -CF'
alias ll="ls -l"
alias llt='tree -C | bat'

unalias run-help

################################################################################
# History Settings
export HISTSIZE=1000000000
export HISTFILE=~/.zsh_history

# History
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt appendhistory
# setopt sharehistory

setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY

################################################################################
# Prompt (details in ~/.config/starship.toml)
eval "$(starship init zsh)"

