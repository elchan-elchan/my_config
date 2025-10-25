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


findpy(){
  find $1 -name "*.py" | xargs grep --color -n $2
}

set -o vi
set -o noclobber
export LSCOLORS=gxfxcxdxbxegedabagacad
alias grep='grep --color'
alias mv='mv -i'
alias cp='cp -i'
alias lg='lazygit'
alias py='python'
alias h='history'
# alias vim='/opt/homebrew/bin/vim'
# alias vim='/usr/local/bin/vim'
alias vimzsh='vim $HOME/.zshrc'
alias sourcezsh='source $HOME/.zshrc'
alias nkfsjis='nkf -w --overwrite -s'
alias nkfutf='nkf -w --overwrite'
alias ls='ls -lGwFt'
alias la='ls -alht'
alias sed='gsed'

# alias cd
alias cdpee='cd /Users/minoriarahori/Documents/PyWork/MinoCatPeeDetection'
alias cdrepo='cd /Users/minoriarahori/Documents/PyWork'


bindkey "^P" up-line-or-search
bindkey '^N' down-line-or-search
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on %b'
# Set up the prompt (with git branch name)
# setopt PROMPT_SUBST
# PROMPT='%n in ${PWD/~} ${vcs_info_msg_0_} > '
# 補完機能を有効にする
fpath+=~/.zfunc
autoload -Uz compinit && compinit
# 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

eval "$(starship init zsh)"
# -------------------------------------
# mizuki nikiのzshのオプション
# -------------------------------------
# 色を使用出来るようにする
autoload -Uz colors && colors
## 色を使う
setopt prompt_subst
# zmv
autoload -Uz zmv
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# beep を無効にする
setopt no_beep
# フローコントロールを無効にする
setopt no_flow_control
# '#' 以降をコメントとして扱う
setopt interactive_comments
# ディレクトリ名だけでcdする
setopt auto_cd
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# 高機能なワイルドカード展開を使用する
setopt extended_glob
# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify
# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control
# Ctrl+Dでzshを終了しない
setopt ignore_eof
# 単語の区切り文字を指定する
autoload -Uz select-word-style && select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
# -------------------------------------
# キーバインド
# -------------------------------------
bindkey -e
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward
# -------------------------------------
# 補完
# -------------------------------------
fpath+=~/.zfunc
# 補完機能を有効にする
autoload -Uz compinit && compinit
## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct
# ビープ音の停止(補完時)
setopt nolistbeep
# タブによるファイルの順番切り替えをしない
unsetopt auto_menu
# cd -[tab]で過去のディレクトリ表示
setopt auto_pushd
# コマンドを途中まで入力後、historyから絞り込み Ctrl+p,n
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                 /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
# -------------------------------------
# パス
# -------------------------------------
# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath
path=(
  $path
  $HOME/bin(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
)




export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Auto-activate virtual environment when entering backend directory
function chpwd() {
    if [[ "$PWD" == */backend ]]; then
        if [[ -f .venv/bin/activate ]]; then
            source .venv/bin/activate
            echo "Activated virtual environment in backend directory"
        fi
    fi
}

# Pull latest main and delete merged branches
function git_delete_merged_branch() {
    local current_branch=$(git branch --show-current)
    echo "Current branch: $current_branch"
    
    # Switch to main and pull latest
    git checkout main
    git pull origin main
    
    # Delete the previous branch if it's not main
    if [[ "$current_branch" != "main" ]]; then
        echo "Deleting merged branch: $current_branch"
        git branch -d "$current_branch"
    fi
    
    echo "✅ Updated main and cleaned up merged branch"
}


source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
