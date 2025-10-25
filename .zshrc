ZSH_SOURCE_FILE=${${(%):-%N}:A}
ZSH_CONFIG_DIR="${ZSH_SOURCE_FILE:h}/.zshrc.d"

if [ -d "$ZSH_CONFIG_DIR" ]; then
  for config_file in "$ZSH_CONFIG_DIR"/*.zsh; do
    [ -e "$config_file" ] || continue
    source "$config_file"
  done
fi
