#   ZSH Config
# ==============

# Important Variables
# ===================
export ZSH_CONFIG_DIR="$(dirname $(realpath ${(%):-%N}))"

# Theme
# =====
export ZSH_THEME_DIR="$ZSH_CONFIG_DIR/theme"
source $ZSH_THEME_DIR/primary.zsh

# Completion
# ==========
export ZSH_COMPLETE_DIR="$ZSH_CONFIG_DIR/complete"
source $ZSH_COMPLETE_DIR/primary.zsh

# Customizing
# ===========
source $ZSH_CONFIG_DIR/custom.zsh
