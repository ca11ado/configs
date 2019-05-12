#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NORMAL='\033[0m'

echo_warning () { echo -e >&2 "${YELLOW}$1${NORMAL}"; }
echo_success () { echo -e >&2 "${GREEN}$1${NORMAL}"; }
echo_error () { echo -e >&2 "${RED}$1${NORMAL}"; }
echo_info () { echo -e >&2 "${BLUE}$1${NORMAL}"; }

set_source_dest_paths () {
  if [ "$COPY_DIRECTION" == "from_repo" ]; then
    source_path=$HOME/Projects/configs
    dest_path=$HOME
  else
    source_path=$HOME
    dest_path=$HOME/Projects/configs
    echo I should work on this branch
    exit
  fi

  echo_warning "DESTINATION PATH: $dest_path"
  echo_warning "SOURCE PATH: $source_path"
}

copy_fish_configs () {
  fish_dir=.config
  ARGS=("-avz" "$source_path/$fish_dir" "$dest_path/")
  rsync "${ARGS[@]}"
}

copy_git_configs () {
  ARGS=("-avz" "$source_path/.gitconfig" "$dest_path/")
  rsync "${ARGS[@]}"
}

copy_vim_configs () {
  source_vim_dir=$source_path/.vim
  dest_vim_dir=$dest_path/.vim
  sessions_vim_dir=$dest_vim_dir/sessions
  if [ ! -d "$dest_vim_dir" ]; then
    mkdir $dest_vim_dir
  fi
  if [ ! -d "$sessions_vim_dir" ]; then
    mkdir $sessions_vim_dir
  fi
  cp $source_path/.vimrc $dest_path
  ARGS=(
    "-avz"
    "--filter=:- .gitignore"
    "$source_vim_dir/bootstrap.vim"
    "$source_vim_dir/plugins.vim"
    "$source_vim_dir/modules"
    "$source_vim_dir/colors"
    "$source_vim_dir/spell"
    "$source_vim_dir/autoload"
    "$dest_vim_dir"
  )
  rsync "${ARGS[@]}"
}

copy_bash_configs () {
  ARGS=("-avz" "$source_path/.bash_profile" "$dest_path/")
  rsync "${ARGS[@]}"
}

interactive_mode () {
  echo -n "Copy fish config (y/n)? "
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
    copy_fish_configs
  else
      echo skipped
  fi

  echo -n "Copy bash config (y/n)? "
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
    copy_bash_configs
  else
    echo skipped
  fi

  echo -n "Copy git config (y/n)? "
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
    copy_git_configs
  else
      echo skipped
  fi

  echo -n "Copy vim config (y/n)? "
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
    copy_vim_configs
  else
      echo skipped
  fi
}


# check arguments
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -c|--config)
    CONFIGS="$2"
    shift # past argument
    shift # past value
    ;;
    -d|--direction)
    DIRECTION="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--help)
    HELP=true
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [ -n "$DIRECTION" ]; then
  if [ "$DIRECTION" == "m" ] || [ "$DIRECTION" != "r" ]; then
    echo 'Do not support copy from machine to repo at this moment' 
    exit 1
  else
    COPY_DIRECTION="from_repo" #`from_repo` and `to_repo`
  fi
else
  COPY_DIRECTION="from_repo" #`from_repo` and `to_repo`
fi

set_source_dest_paths

if [ -n "$CONFIGS" ]; then
  if [[ $CONFIGS =~ 'v' ]]; then
    copy_vim_configs
  fi
  if [[ $CONFIGS =~ 'b' ]]; then
    copy_bash_configs
  fi
  if [[ $CONFIGS =~ 'g' ]]; then
    copy_git_configs
  fi
  if [[ $CONFIGS =~ 'f' ]]; then
    copy_fish_configs
  fi
else
  echo has no arguments, run interactive mode
  interactive_mode
fi

