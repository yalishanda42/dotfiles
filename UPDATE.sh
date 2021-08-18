#!/bin/bash

fail() {
	echo "Update failed. $*"
	exit 1
}

git checkout master || fail "Discard any changes in this directory and try again."
git pull origin master || fail
rm -rf ~/.oh-my-zsh || fail "Make sure you have necessary permission for ~/.oh-my-zsh"
./INSTALL.sh < <(echo ny) || fail
