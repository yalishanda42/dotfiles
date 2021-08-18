#!/bin/bash

fail() {
	echo "Update failed. $*"
	exit 1
}

git checkout master || fail "Discard any changes in this directory and try again."
git pull origin master || fail

rm -rf ~/.oh-my-zsh || fail "Make sure you have necessary permission for ~/.oh-my-zsh"

read -p "❓ Do you wish to update Atom's One Dark theme for Vim? [y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rm -rf ~/.vim/*/onedark.vim ~/.vim/pack/onedark/opt/onedark.vim
	./INSTALL.sh < <(echo ny) || fail
else
	./INSTALL.sh < <(echo nn) || fail
fi
