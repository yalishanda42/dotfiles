#!/bin/bash

function fail() {
    echo ❌ Error occured. Exiting installation.
    exit 1
}

echo ℹ️ Install directory is $(echo ~)

echo ➡️  Downloading and installing Oh-My-Zsh! ...
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" < <(echo exit) || fail
source ~/.zshrc

echo ➡️  Downloading Synthax Highlighting plugin...
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || fail

echo ➡️  Downloading Spaceship theme...
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" || fail
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" || fail

echo ➡️  Downloading Autocompletion plugin...
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || fail

echo ➡️  Copying .zshrc to install directory...
cat .zshrc | sed 's#/home/yalishanda#'$(echo ~)'#g' > ~/.zshrc || fail
echo ✅ Terminal setup ready.

read -p "Do you wish to install for root user as well? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo ln -s ~/.zshrc ~root/.zshrc || fail
    echo ✅ Root setup ready.
fi

read -p "Do you wish to install Atom's One Dark theme for Vim? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo ➡️  Downloading colorsheme...
    if [[ ! -d ~/.vim/colors ]]
    then
        mkdir -p ~/.vim/colors || fail
    fi
    curl https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim > ~/.vim/colors/onedark.vim || fail
    if [[ ! -d ~/.vim/autoload ]]
    then
        mkdir -p ~/.vim/autoload || fail
    fi
    curl https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim > ~/.vim/autoload/onedark.vim || fail
    if [[ ! -d ~/.vim/pack/onedark/opt ]]
    then
        mkdir -p ~/.vim/pack/onedark/opt || fail
    fi
    cd ~/.vim/pack/onedark/opt || fail
    git clone https://github.com/joshdick/onedark.vim || fail
    cd -
    echo ➡️ Copying .vimrc to install directory...
    cp .vimrc ~ || fail
else
    echo ➡️ OK, just putting a default .vimrc to install directory...
    cat .vimrc | sed 's/onedark/desert/g' | tail -n +2 > ~/.vimrc || fail
fi
echo ✅ Vim setup ready.
echo
echo 🍻 Enjoy your fresh terminal! 🍻 

zsh
exit 0
