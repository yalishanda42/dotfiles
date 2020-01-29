#!/bin/bash

echo Assuming home dir is $(echo ~)

echo Copying .vimrc to home dir...
cp .vimrc ~ || exit 1

echo Copying .zshrc to home dir... 
cat .zshrc | sed 's#/home/yalishanda#'$(echo ~)'#g' > ~/.zshrc || exit 1

read -p "Do you wish to install for root user as well? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo ln -s ~/.zshrc ~root/.zshrc || exit 1
fi

echo Enjoy your terminal! && exit 0
