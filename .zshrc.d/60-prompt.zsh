# Prompt and version control info
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'on %b'

# setopt PROMPT_SUBST
# PROMPT='%n in ${PWD/~} ${vcs_info_msg_0_} > '

eval "$(starship init zsh)"
