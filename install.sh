#!/usr/bin/env bash

set -eu

YELLOW="\033[1;33m"
# PURPLE="\033[1;34m"
# ROSE="\033[0;35m"
# CYAN="\033[1;36m"
NO_COLOR="\033[0m"

echo -e "${YELLOW}Updating apt packages${NO_COLOR}"
sudo apt update
sudo apt upgrade -y

sudo apt install -y vim powerline git gcc sed grep tig jq unzip build-essential python3-pip make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm xz-utils fontconfig

echo -e "${YELLOW}Copying RC files and vim settings${NO_COLOR}"
cp -r .vim ~/
cp -r .bash* .screenrc .tigrc .tmux.conf* .vimrc .zshrc .profile ~/

echo -e "${YELLOW}Installing shellcheck${NO_COLOR}"
scversion="v0.7.2" # or "v0.y.z", or "latest"
wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
sudo cp "shellcheck-${scversion}/shellcheck" /usr/bin/
shellcheck --version

echo -e "${YELLOW}Installing Vundle${NO_COLOR}"
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  pushd ~/.vim/bundle/Vundle.vim
  git pull origin master
  popd
fi

echo -e "${YELLOW}Installing pyenv${NO_COLOR}"
if [ ! -e ~/.pyenv ]; then
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
else
  pushd ~/.pyenv
  git pull origin master
  popd
fi

echo -e "${YELLOW}Installing goenv${NO_COLOR}"
if [ ! -e ~/.goenv ]; then
  git clone https://github.com/syndbg/goenv.git ~/.goenv
else
  pushd ~/.goenv
  git pull origin master
  popd
fi

PYENV_VERSION=3.11.1
pyenv install $PYENV_VERSION
pyenv global $PYENV_VERSION
pip install -U pip
pip install --user powerline-status
pip install yq
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts
fc-cache -vf ~/.fonts/
mv -f PowerlineSymbols.otf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
