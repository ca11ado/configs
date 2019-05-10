#!/bin/bash

fish_dir=.config
vim_dir=.vim

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
  ARGS=("-avz" "--filter=:- .gitignore" "$source_path/$vim_dir" "$source_path/.vimrc" "$dest_path/")
  rsync "${ARGS[@]}"
else
    echo skipped
fi

