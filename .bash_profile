#export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
#export TERM="xterm-color" 
#export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
#alias ls='ls -G'

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias vpn='~/Scripts/vpn.sh'

export NVM_DIR="/Users/a.khimtsov/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

#homebrew nvm installation
export NVM_DIR=~/.nvm
  . $(brew --prefix nvm)/nvm.sh
