#   ZSh Config: Theme
# =====================
#
# Git Functionality
# ==================

# Git section in prompt
function git_prompt() {
	branch=`git rev-parse --abbrev-ref HEAD 2>&1`
	if [[ $? -eq 0 ]]; then
		echo "$branch "
	fi
}
