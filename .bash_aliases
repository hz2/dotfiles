

# Make grep pretty 
alias grep='grep --color'

# ls command shortcuts 
alias l.='ls -d .* --color=tty'
alias ll='ls -l --color=tty'
alias ls='ls --color=tty'


alias update='sudo -- sh -c "apt update && apt -y upgrade && apt -y --purge autoremove && sudo apt -y clean"'


# npm command shortcuts 

alias dev='npm run dev'
alias start='npm run start'
alias deploy='./deployed/sh.sh'
alias prod='./deployed-prod/prod.sh'
alias stage='./deployed-prod/stage.sh'
