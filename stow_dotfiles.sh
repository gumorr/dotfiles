#!/bin/bash

cd $HOME/dotfiles

# stow all folders to home directory
for dir in */ ; do
    stow --dotfiles "$dir"
done

