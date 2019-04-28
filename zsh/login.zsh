#   ZSH Config
# ==============

# Important Variables
# ===================
export ZSH_CONFIG_DIR="$(dirname $(realpath ${(%):-%N}))"
logout_functions=()

# Functions
# =========
fpath+=("$ZSH_CONFIG_DIR/functions")

# Settings
# ========
source $ZSH_CONFIG_DIR/config.zsh

# Theme
# =====
export ZSH_THEME_DIR="$ZSH_CONFIG_DIR/theme"
source $ZSH_THEME_DIR/primary.zsh

# Completion
# ==========
export ZSH_COMPLETE_DIR="$ZSH_CONFIG_DIR/complete"
source $ZSH_COMPLETE_DIR/primary.zsh

# SSH
# ===
source $ZSH_CONFIG_DIR/ssh.zsh

# Aliases
# =======
source $ZSH_CONFIG_DIR/aliases.zsh

# Customizing
# ===========
source $ZSH_CONFIG_DIR/custom.zsh

# Syntax Highlighting
# ===================
# Must be done last.
source $ZSH_CONFIG_DIR/syntax-highlighting/zsh-syntax-highlighting.zsh
