#!/bin/bash

cd $HOME/dotfiles

for dir in */ ; do
    stow --dotfiles "$dir"
done

