#   ZSh Config: Prompt
# ======================
#
# Primary Loader
# ==============

source $ZSH_THEME_DIR/config.zsh
source $ZSH_THEME_DIR/git.zsh

# Left Prompt
# ===========
# [PWD] <[ERROR_CODE]> <[GIT_BRANCH]> $/#
PROMPT='%B%F{black}[%f%~%F{black}]%f%b %B%(?||%F{red}%?%f )%b%F{green}$(git_prompt)%f%B%F{cyan}%(!|#|$)%f%b '

# Right Prompt
# ============
RPROMPT=''

# Scheduled Redraw
# ================
# Currently disabled, only used if time is shown on the prompt.
#
#sched_rprompt() {
#    emulate -L zsh
#    zmodload -i zsh/sched
# 
#    integer i=${"${(@)zsh_scheduled_events#*:*:}"[(I)sched_rprompt]}
#    ((i)) && sched -$i
# 
#    zle && zle reset-prompt
# 
#    sched +5 sched_rprompt
#}
#sched_rprompt
