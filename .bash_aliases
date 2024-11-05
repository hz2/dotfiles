# Make grep pretty
alias grep='grep --color'

# ls command shortcuts
alias l.='ls -d .* --color=tty'
alias ll='ls -l --color=tty'
alias ls='ls --color=tty'

if [[ $(uname) = "Darwin" ]]; then
    alias update="brew update && brew upgrade"
elif [[ $(uname) = "Linux" ]]; then
    if [[ $(uname -n) = "debian" ]]; then
        upateCmd='sudo -- sh -c "apt update && apt -y upgrade && apt -y --purge autoremove && sudo apt -y clean"'

        if [ -x "$(command -v flatpak)" ]; then
            upateCmd="$upateCmd && flatpak update -y"
        fi

        alias update=$upateCmd

        alias updatep='sudo -- sh -c "\
        apt -o Acquire::http::proxy="http://127.0.0.1:8889/" update && \
        apt -o Acquire::http::proxy="http://127.0.0.1:8889/" -y upgrade && \
        apt -y --purge autoremove && \
        sudo apt -y clean"'

        alias aptp='apt -o Acquire::http::proxy="http://127.0.0.1:8889/" '


    elif [[ $(uname -n) = "fedora" ]]; then 
        echo 'fedora'
    fi

fi

# npm command shortcuts

alias dev='npm run dev'
alias start='npm run start'
alias deploy='./deployed/sh.sh'
alias prod='./deployed-prod/prod.sh'
alias stage='./deployed-prod/stage.sh'


alias python2='python2.7'

dir=$(readlink $0)
alias proxyon='source proxyon'
alias proxyoff='source proxyoff'

# download

# --seed-time=0
alias a2c='aria2c '
alias a2c-open='aria2c --enable-rpc --rpc-listen-all --rpc-secret=12321'
if [[ $(uname) = "Darwin" ]]; then
    alias a2c-web='a2c-open'
elif [[ $(uname) = "Linux" ]]; then
    alias a2c-web='a2c-open & cd ~/software/webui-aria2/ && node node-server.js'
fi

alias pn=pnpm
