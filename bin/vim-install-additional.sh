#!/bin/bash

# git mergetool diffconflicts script
SOURCE_DIFFCONFLICTS_DIR=${HOME}/.config/git
DEST_DIFFCONFLICTS_DIR=/usr/local/bin
DEST_DIFFCONFLICTS_LINK_DIR=/usr/local/bin
DIFFCONFLICTS_FILE_NAME=diffconflicts
LSP_DIR=${HOME}/.config/lsp

check_os () {
  unameOut="$(uname -s)"
  case "${unameOut}" in
    Darwin*)  OS=Mac;;
    Linux*)   OS=Linux;;
    *)        OS=Linux
  esac
}

# for YcmCompleter for vue (or other lang)
install_lsp () {

  if ! [ -d $DEST_DIFFCONFLICTS_DIR ]; then
    git clone https://github.com/ycm-core/lsp-examples.git $LSP_DIR \
    && cd $LSP_DIR/vue/ && ./install.py
  else
    echo skipping LSP: folder exist
  fi
}

install_ctags () {
  if [ "$OS" == "Linux" ]; then
    sudo apt install exuberant-ctags
  fi
  if [ "$OS" == "Mac" ]; then
    brew install ctags-exuberant
  fi
}

install_ctags_patterns () {
  DEST_DIFFCONFLICTS_DIR=${HOME}/.vim/ctags-patterns-for-javascript
  if ! [ -d $DEST_DIFFCONFLICTS_DIR ]; then
    git clone https://github.com/romainl/ctags-patterns-for-javascript.git ${DEST_DIFFCONFLICTS_DIR} \
    && cd ${DEST_DIFFCONFLICTS_DIR} && make tags
  fi
}

copy_diffconflicts () {
  if ! [ -d "${DEST_DIFFCONFLICTS_DIR}" ]; then
    mkdir "${DEST_DIFFCONFLICTS_DIR}"
  fi

  if ! [ -f "${DEST_DIFFCONFLICTS_DIR}/${DIFFCONFLICTS_FILE_NAME}" ]; then
    cp "${SOURCE_DIFFCONFLICTS_DIR}/${DIFFCONFLICTS_FILE_NAME}" "${DEST_DIFFCONFLICTS_DIR}/${DIFFCONFLICTS_FILE_NAME}"
  fi
}

set_diffconflicts_link () {
  copy_diffconflicts

  if ! [ -L "${DEST_DIFFCONFLICTS_LINK_DIR}/${DIFFCONFLICTS_FILE_NAME}" ]; then
    ln -s ${SOURCE_DIFFCONFLICTS_DIR}/${DIFFCONFLICTS_FILE_NAME} ${DEST_DIFFCONFLICTS_LINK_DIR}/${DIFFCONFLICTS_FILE_NAME}
  fi
}

