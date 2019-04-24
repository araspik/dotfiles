#   ZSh Config: SSH
# ===================
#
# Starts the SSH agent, and loads specific SSH keys, given by a file.
#
# The file is located at "$HOME/.ssh/autoload.list", each line containing a key name relative to
# "$HOME/.ssh"

if [[ ! -n $SSH_AGENT_PID ]] && [[ -f "$HOME/.ssh/autoload.list" ]]; then
    echo -n "Bringing up SSH agent... "
    output=$(ssh-agent)
    if [[ ! $? -eq 0 ]]; then
        echo "error"
        echo $output >&2
    else
        eval $output >/dev/null
	    export SSH_AGENT_CREATOR=$$
        echo "pid $SSH_AGENT_PID"
        # https://stackoverflow.com/a/35131166/9781227
        exec 3<"$HOME/.ssh/autoload.list"
        while IFS='' read -u 3 -r key || [[ -n "$key" ]]; do
            echo "  loading $key..."
            ssh-add "$HOME/.ssh/$key"
        done
    fi
fi

# Logout Hook
# ===========
# Drops the SSH agent if this shell had made it or if a rogue agent is running.
function logout_ssh() {
    # Check if dropping is necessary
    if [[ $$ -eq $SSH_AGENT_CREATOR ]]; then
        echo -n "Dropping SSH agent... "
    elif [[ -n $SSH_AGENT_PID ]] && [[ ! -n $SSH_AGENT_CREATOR ]]; then
        echo -n "Dropping rogue SSH agent..."
    else
        return
    fi

    # Drop (it's necessary)
    output=$(ssh-agent -k)
    if [[ ! $? -eq 0 ]]; then
        echo "error"
        echo $output >&2
    else
        eval $output >/dev/null
        echo "done"
    fi
}
logout_functions+=("logout_ssh")
