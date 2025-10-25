# Plugins
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
