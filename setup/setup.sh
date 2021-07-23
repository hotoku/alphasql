#!/bin/bash

# shell
chsh -s zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# dot
mkdir -p ~/projects/hotoku
cd ~/projects/hotoku
git clone git@github.com:hotoku/dot
ln -s ~/projects/hotoku/dot/gitconfig ~/.gitconfig
ln -s ~/projects/hotoku/dot/tmux.basic.conf ~/.tmux.conf
cd ~
