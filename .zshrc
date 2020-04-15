[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### START GLOBAL VARIABLES
export PATH="${PATH:+${PATH}:}./node_modules/.bin"
export FZF_DEFAULT_COMMAND='Ag -l --nogroup  --nocolor --hidden -g ""'
export LANG=en_US.UTF-8
export TMUX_GITBAR_DIR=$HOME/.tmux/gitbar

export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if [ /Users/t0s(NF) ]; then
  export GOPATH=$HOME/Projects/Lamoda/Go-Frontend # home mac
else
  export GOPATH=$HOME/Projects/Lamoda/go-site # work mac
fi
### END GLOBAL VARIABLES

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

