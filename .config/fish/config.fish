if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls='eza'
alias cat='bat'
alias vi='nvim'
alias vim='nvim'

# start ssh-agent if not already running
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
end

function fish_user_key_bindings
    bind \e\[C accept-autosuggestion 
    bind \eOC accept-autosuggestion
end


