#!/bin/bash

fail() {
	echo "Update failed. $*"
	exit 1
}

git checkout master || fail "Discard any changes in this directory and try again."
git pull origin master || fail
rm -rf ${ZSH} || fail "Make sure you have necessary permission for ${ZSH}"
unset ZSH
./INSTALL.sh < <(echo ny) || fail
