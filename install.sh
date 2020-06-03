#!/usr/bin/env bash

YELLOW="\033[1;33m"
PURPLE="\033[1;34m"
ROSE="\033[0;35m"
CYAN="\033[1;36m"
NO_COLOR="\033[0m"

echo -e "${YELLOW}Updating apt packages${NO_COLOR}"
sudo apt update
sudo apt upgrade -y

sudo apt install -y vim powerline git gcc sed grep tig unzip build-essential python-pip make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm xz-utils

echo -e "${YELLOW}Copying RC files and vim settings${NO_COLOR}"
sudo cp -r .vim ../
sudo cp -r .bash_* .screenrc .tigrc .tmux.conf* .vimrc .zshrc ../

echo -e "${YELLOW}Installing shellcheck${NO_COLOR}"
scversion="v0.7.1" # or "v0.y.z", or "latest"
wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
sudo cp "shellcheck-${scversion}/shellcheck" /usr/bin/
sudo shellcheck --version

echo -e "${YELLOW}Installing Vundle${NO_COLOR}"
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo -e "${YELLOW}Installing pyenv${NO_COLOR}"
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | sudo bash
sudo mkdir ~/.pyenv
source ~/.bashrc

PYENV_VERSION=3.8.3
pyenv install $PYENV_VERSION
pip install -U pip
pip install --user powerline-status
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mkdir ~/.fonts
sudo fc-cache -vf ~/.fonts/
sudo mkdir -p ~/.config/fontconfig/conf.d/
sudo mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
