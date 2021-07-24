#!/bin/bash

mkdir /startup
echo $(date) >> /startup/log
echo $(whoami) >> /startup/log
echo $(pwd) >> /startup/log

apt update
apt install -y python3 python3-pip zsh fdclone direnv clangd-10
snap install --classic ripgrep

## emacs
apt install -y libgnutls28-dev libtinfo-dev
wget -O /startup/emacs-27.2.tar.xz https://ftp.gnu.org/gnu/emacs/emacs-27.2.tar.xz
cd /startup
tar xJvf emacs-27.2.tar.xz
cd emacs-27.2
./configure --with-x-toolkit=no --with-xpm=ifavailable --with-jpeg=ifavailable --with-png=ifavailable --with-gif=ifavailable --with-tiff=ifavailable --with-gnutls=ifavailable
make -j16
make install
cd /

## bazel
# cf: https://docs.bazel.build/versions/1.0.0/install-ubuntu.html
apt install -y pkg-config zip g++ zlib1g-dev unzip python3 openjdk-8-jdk
wget https://github.com/bazelbuild/bazel/releases/download/1.0.0/bazel-1.0.0-installer-linux-x86_64.sh
chmod u+x bazel-1.0.0-installer-linux-x86_64.sh
./bazel-1.0.0-installer-linux-x86_64.sh 2>&1 | tee /hotoku/bazel.log

## bazelisk
apt install -y nodejs npm
npm i -g @bazel/bazelisk
