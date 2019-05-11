#!/bin/bash

fish_dir=.config

echo -n "Copy from REPO to MACHINE (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  dest_path=$HOME
  source_path=$HOME/Projects/configs
else
  dest_path=$HOME/Projects/configs
  source_path=$HOME
  echo I should work on this branch
  exit
fi

echo destination path: $dest_path
echo source path: $source_path

echo -n "Copy fish config (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  ARGS=("-avz" "$source_path/$fish_dir" "$dest_path/")
  rsync "${ARGS[@]}"
else
    echo skipped
fi

echo -n "Copy bash config (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  ARGS=("-avz" "$source_path/.bash_profile" "$dest_path/")
  rsync "${ARGS[@]}"
else
    echo skipped
fi

echo -n "Copy git config (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  ARGS=("-avz" "$source_path/.gitconfig" "$dest_path/")
  rsync "${ARGS[@]}"
else
    echo skipped
fi

echo -n "Copy vim config (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  source_vim_dir=$source_path/.vim
  dest_vim_dir=$dest_path/.vim
  if [ ! -d "$dest_vim_dir" ]; then
    mkdir $dest_vim_dir
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
else
    echo skipped
fi

