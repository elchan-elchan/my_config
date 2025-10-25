# General shell behavior
set -o vi
set -o noclobber

autoload -Uz colors && colors
setopt prompt_subst
autoload -Uz zmv

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob
setopt no_tify
setopt ignore_eof

autoload -Uz select-word-style && select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
