echo "sourced _zshrc"

autoload -U compinit
compinit -u

setopt IGNOREEOF

# prompt configuration
# PROMPT="%F{202}(%f%F{45}%n%f%F{202}.%f%F{15}%m%f%F{202})%f"$'\n'"%~ "
PROMPT="%F{202}(%f%F{45}%n%f%F{202})%f%~ "

# env check
if [[ ! -n $DIR_DEV ]]; then
    export DIR_DEV="$HOME/Dev"
fi

# check command existence
function chCmdExt() {
    local command_name="$1"
    if command -v "$command_name" >/dev/null; then
        return 0
    else 
        return 1
    fi
}

# tmux 
if chCmdExt tmux; then
    if [[ ! -n $TMUX ]]; then
      # get the IDs
      ID="`tmux list-sessions`"
      if [[ -z "$ID" ]]; then
        tmux new-session
      fi
      ID="`echo $ID | $PERCOL | cut -d: -f1`"
      tmux attach-session -t "$ID"
    fi
fi


# fzf
if chCmdExt fzf; then
    function select-history() {
      BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
      CURSOR=$#BUFFER
    }
    zle -N select-history
    bindkey '^p' select-history
else 
    echo 'not installed: fzf'
fi

#zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh
if chCmdExt zplug; then
    zplug "agkozak/zsh-z"

    # Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    # Then, source plugins and add commands to $PATH
    zplug load --verbose
else 
    echo 'not installed: zplug'
fi

# moji code?
export LANG=en_US.UTF-8

# 環境変数 XDG Base Directory Specification
export XDG_HOME="$DIR_DEV/XDG"
export XDG_CONFIG_HOME="$XDG_HOME/config"
export XDG_DATA_HOME="$XDG_HOME/data"
export XDG_CACHE_HOME="$XDG_HOME/cache"
export XDG_RUNTIME_DIR="$XDG_HOME/runtime"

# initvim path
export HOME_DOTFILES="$DIR_DEV/dotfiles"
export MYINITVIM="$HOME_DOTFILES/init.vim"

# nodebrew path
export PATH="$PATH:$HOME/.nodebrew/current/bin"

# java path
# export JAVA_HOME=`/usr/libexec/java_home -v 1.10`

# deno
export DENO_INSTALL="/Users/develop/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# pyenv 
if chCmdExt pyenv; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# alias
if chCmdExt gmv; then
    alias rm='gmv -f --backup=numbered --target-directory ~/.Trash'
    alias mv='mv -i'
fi 
if chCmdExt gsed; then
    alias sed='gsed'
fi 
alias cd='(){ cd $1 ; ls }'
alias tree='tree -L 2'

if chCmdExt brew; then
    alias ctags="`brew --prefix`/bin/ctags"
fi

# alias colordiff to diff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# on tmux, ssh with TERM=tmux-256color causes an issue when executing vi(vim)
# https://github.com/alacritty/alacritty/issues/1208
alias ssh='TERM=xterm-256color \ssh'

# rbenv path
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# my commands
source $HOME_DOTFILES/shscripts/mycommands.sh


export PATH="/usr/local/opt/php@8.1/bin:$PATH"
export PATH="/usr/local/opt/php@8.1/sbin:$PATH"
