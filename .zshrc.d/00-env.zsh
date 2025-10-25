# Environment and path configuration
export PYENV_ROOT=/usr/local/var/pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/local/var/pyenv/versions/anaconda3-2019.10/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
# else
# 
# 
#    if [ -f "/usr/local/var/pyenv/versions/anaconda3-2019.10/etc/profile.d/conda.sh" ]; then
#        . "/usr/local/var/pyenv/versions/anaconda3-2019.10/etc/profile.d/conda.sh"
#    else
#        export PATH="/usr/local/var/pyenv/versions/anaconda3-2019.10/bin:$PATH"
#    fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.local/bin/env"

export LSCOLORS=gxfxcxdxbxegedabagacad

typeset -U path cdpath fpath manpath
path=(
  $path
  $HOME/bin(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
