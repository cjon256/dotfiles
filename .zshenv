#!/bin/zsh
#
# .zshenv: Zsh environment file, loaded always.
#

export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

export EDITOR=nvim
export ZVM_VI_EDITOR=nvim
export VISUAL=nvim
export RIPGREP_CONFIG_PATH=~/.config/ripgreprc

# Browser
if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

################################################################################
# Language environments
# Go
export GOPATH=$(/usr/local/go/bin/go env GOPATH)
export GOROOT=$(/usr/local/go/bin/go env GOROOT)
export GOBIN=$(/usr/local/go/bin/go env GOPATH)/bin

# Rust
if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

# Browser
if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

################################################################################
# Less
#
if [[ -z "$PAGER" ]]; then
  export PAGER='less'
fi


# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
if [[ -z "$LESS" ]]; then
  export LESS='-g -i -M -R -S -w -X -z-4'
fi

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

################################################################################
# Paths

# Homebrew
if command -v brew >/dev/null 2>&1; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the list of directories that Zsh searches for programs. $PATH
path=(
  $HOME/{,s}bin(N)
  /usr/local/{,s}bin(N)
  /run/current-system/sw/{,s}bin(N)
  $path
  $GOPATH/bin
  $GOROOT/bin
)
fpath+=(/opt/homebrew/share/zsh/site-functions)

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# disable because ^ is used by git
# unsetopt extended_glob
export DISABLE_MAGIC_FUNCTIONS=true

################################################################################
# XXX why was this a good idea?
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

