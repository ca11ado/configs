nvm use default --silent #fix for using last node version by default in nvm
set -gx PATH $PATH ./node_modules/.bin
set -gx GOPATH $HOME/Projects/Lamoda/go-site
source $GOPATH/src/site/dev/go.env

set fish_greeting ""
