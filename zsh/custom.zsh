#   ZSh Config: Customizing
# ===========================
# Allows users to customize their setup without modding these files.

if [[ -d "${XDG_CONFIG_HOME:-$HOME/.config}/zsh_custom" ]]; then
    for src in ${XDG_CONFIG_HOME:-$HOME/.config}/zsh_custom/*.zsh; do
        source $src
    done
fi
