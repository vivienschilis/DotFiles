export DOTFILES_DIR=$HOME/.DotFiles

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Display red dots to be while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails git ruby bundler gem rake rbenv)

source $ZSH/oh-my-zsh.sh

# Disable autocorrect
unsetopt correct_all

# Display a full range of colours
export TERM=screen-256color

# Set up default PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/texbin:$HOME/bin

# Add DotFiles bins
export PATH="$DOTFILES_DIR/bins:$PATH"

export EDITOR=vi

export LC_ALL=en_US.UTF-8

PROMPT='$PROMPT_PREFIX  ${ret_status} %{$fg_bold[green]%}%p%{$fg[cyan]%}%c%{$fg_bold[blue]%} %% %{$reset_color%}'
RPROMPT='$(git_prompt_info)'

# Misc aliases
alias ll="ls -la"
alias sr="screen -r"
alias tmux="tmux -2"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_TMUX_HEIGHT="60%"

# VIM edit mode
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

[[ -f ~/.aliases  ]] && source ~/.aliases
[[ -f ~/.zshrc.local  ]] && source ~/.zshrc.local

# Load direnv
eval "$(direnv hook zsh)"
