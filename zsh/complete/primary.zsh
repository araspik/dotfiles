#   ZSh Config: Completion
# ==========================
#
# Primary Loader
# ==============

# Primary Configuration
source $ZSH_COMPLETE_DIR/config.zsh

# Initialization
autoload -Uz compinit
compinit

# Extras
source $ZSH_COMPLETE_DIR/post_init.zsh
