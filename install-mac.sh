#!/usr/bin/env zsh

set -eu

YELLOW="\033[1;33m"
PURPLE="\033[1;34m"
ROSE="\033[0;35m"
CYAN="\033[1;36m"
NO_COLOR="\033[0m"

echo -e "${YELLOW}Updatin brew packages${NO_COLOR}"
brew update
brew upgrade

echo -e "${YELLOW}Installing pyenv${NO_COLOR}"
brew install pyenv
echo -e "${YELLOW}Installing goenv${NO_COLOR}"
brew install goenv
echo -e "${YELLOW}Installing shellcheck${NO_COLOR}"
brew install shellcheck
echo -e "${YELLOW}Installing tig${NO_COLOR}"
brew install tig

echo -e "${YELLOW}Copying RC files and vim settings${NO_COLOR}"
cp -r .vim ~/
cp -r .bash* .screenrc .tigrc .tmux.conf* .vimrc .zshrc .profile ~/

echo -e "${YELLOW}Installing Vundle${NO_COLOR}"
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  pushd ~/.vim/bundle/Vundle.vim
  git pull origin master
  popd
fi

echo -e "${YELLOW}Install oh-my-zsh${NO_COLOR}"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
p10k_dir=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
[ ! -d "$p10k_dir" ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k_dir"

echo -e "${YELLOW}Install zsh-completions${NO_COLOR}"
zsh_completions_dir=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
[ ! -d "$zsh_completions_dir" ] && git clone https://github.com/zsh-users/zsh-completions "$zsh_completions_dir"

echo -e "${YELLOW}Install zsh-autosuggestions${NO_COLOR}"
zsh_autosuggestions_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
[ ! -d "$zsh_autosuggestions_dir" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$zsh_autosuggestions_dir"

echo -e "${YELLOW}Install zsh-syntax-highlighting${NO_COLOR}"
zsh_syntax_highlighting_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
[ ! -d "$zsh_syntax_highlighting_dir" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$zsh_syntax_highlighting_dir"

# install goenv go
GOENV_VERSION=1.20.5
if goenv versions | grep -wq "$GOENV_VERSION"; then
	;
else
	goenv install $GOENV_VERSION
	goenv global $GOENV_VERSION
fi
eval "$(goenv init -)"
export GOPATH="$HOME/go"

echo -e "${YELLOW}Install golangci-lint${NO_COLOR}"
# binary will be $(go env GOPATH)/bin/golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.53.3

# install pyenv python
PYENV_VERSION=3.11.4
if pyenv versions | grep -wq "$PYENV_VERSION"; then
    ;
else
	pyenv install $PYENV_VERSION
	pyenv global $PYENV_VERSION
fi
eval "$(pyenv init -)"

echo -e "${YELLOW}Install kubernetes${NO_COLOR}"
brew install kubectl

pip install -U pip
pip install --user powerline-status
pip install yq
# wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
# wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
# mkdir -p ~/.fonts
# fc-cache -vf ~/.fonts/
# mkdir -p ~/.config/fontconfig/conf.d/
# mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.cm commit
git config --global alias.st status
git config --global alias.cp cherry-pick

source ~/.zshrc

