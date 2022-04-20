if status is-interactive
    # Commands to run in interactive sessions can go here
end


if status --is-login
    set -gx PATH $PATH ~/dotfiles/path
end
