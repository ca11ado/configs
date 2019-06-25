nvm use default --silent #fix for using last node version by default in nvm
set -gx PATH $PATH ./node_modules/.bin
set -gx GOPATH $HOME/Projects/Lamoda/go-site
set -gx FZF_DEFAULT_COMMAND 'Ag -l --nogroup  --nocolor --hidden -g ""'
set -gx LANG en_US.UTF-8
set -gx TMUX_GITBAR_DIR $HOME/.tmux/gitbar

#set -gx NVM_DIR "$HOME/.nvm $NVM_DIR/nvm.sh"

set fish_greeting ""
