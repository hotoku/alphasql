#!/bin/bash

LINUX_USER=hotoku
GITHUB_USER=hotoku

# shell
sudo chsh -s /bin/zsh ${LINUX_USER}
yes y | sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# dot
mkdir -p ~/projects/${GITHUB_USER}
cd $_
git clone git@github.com:${GITHUB_USER}/dot
ln -s ~/projects/${GITHUB_USER}/dot/gitconfig ~/.gitconfig
ln -s ~/projects/${GITHUB_USER}/dot/tmux.basic.conf ~/.tmux.conf
cd ~
