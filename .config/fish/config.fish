nvm use default --silent #fix for using last node version by default in nvm
set -gx PATH $PATH ./node_modules/.bin
set -gx GOPATH $HOME/projects
set -gx FZF_DEFAULT_COMMAND $FZF_DEFAULT_COMMAND 'ag -l --nogroup  --nocolor --hidden -g ""'
set -gx LANG $LANG en_US.UTF-8

#set -gx NVM_DIR "$HOME/.nvm $NVM_DIR/nvm.sh"

set fish_greeting ""
