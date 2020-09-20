#!/bin/bash

function cleanup() {
    rm -rf ~/.oh-my-zsh
    rm -rf ~/.vimrc
}

# cleanup

echo Installing without sudo and without vim plugins...
../INSTALL.sh < <(echo nn) || exit 1

cleanup

echo Installing without sudo and wit vim plugins...
../INSTALL.sh < <(echo ny) || exit 1

cleanup

echo Updating...
../UPDATE.sh || exit 1


echo All tests OK
exit 0
