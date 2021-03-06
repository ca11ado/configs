nvm use default --silent #fix for using last node version by default in nvm
set -gx PATH $PATH ./node_modules/.bin
set -gx FZF_DEFAULT_COMMAND 'Ag -l --nogroup  --nocolor --hidden -g ""'
set -gx LANG en_US.UTF-8
set -gx TMUX_GITBAR_DIR $HOME/.tmux/gitbar

#set -gx NVM_DIR "$HOME/.nvm $NVM_DIR/nvm.sh"

set fish_greeting ""
source $HOME/.config/fish/functions/gitbar_update.fish

if test -d /Users/t0s 
  set -gx GOPATH $HOME/Projects/Lamoda/Go-Frontend # home mac
else
  set -gx GOPATH $HOME/Projects/Lamoda/go-site # work mac
end
