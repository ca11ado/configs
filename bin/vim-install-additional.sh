#!/bin/bash

check_os () {
  unameOut="$(uname -s)"
  case "${unameOut}" in
    Darwin*)  OS=Mac;;
    Linux*)   OS=Linux;;
    *)        OS=Linux
  esac
}

install_ctags () {
  if [ "$OS" == "Linux" ]; then
    sudo apt install exuberant-ctags
  fi
  if [ "$OS" == "Mac" ]; then
    brew install  ctags-exuberant
  fi
}

install_ctags_patterns () {
  DEST_DIR=${HOME}/.vim/ctags-patterns-for-javascript
  git clone https://github.com/romainl/ctags-patterns-for-javascript.git ${DEST_DIR} \
  && cd ${DEST_DIR} && make tags
}

