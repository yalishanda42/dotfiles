#!/bin/bash

function cleanup() {
    rm -rf ~/.oh-my-zsh
    rm -rf ~/.vimrc
}

cleanup

echo ==========================================================
echo TEST 1: Installing without sudo and without vim plugins...
echo ==========================================================
./INSTALL.sh < <(echo nn) || exit 1

cleanup

echo ==========================================================
echo TEST 2: Installing without sudo and with vim plugins...
echo ==========================================================
./INSTALL.sh < <(echo ny) || exit 1

echo ==========================================================
echo TEST 3: Updating all without vim plugins...
echo ==========================================================
./UPDATE.sh < <(echo n) || exit 1

echo ==========================================================
echo TEST 3: Updating all...
echo ==========================================================
./UPDATE.sh < <(echo y) || exit 1

echo All tests OK
exit 0
