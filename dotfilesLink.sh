#! /bin/bash

# macなら
if [ "$(uname)" = 'Darwin' ]; then
  brew tap rcmdnk/rcmdnkpac
  brew install sd_cl
else
  # sd_cl: コマンドラインでのディレクトリ移動を快適にする
  # https://rcmdnk.com/blog/2016/02/18/computer-bash-zsh/#sd_cl
  curl -fsSL https://raw.github.com/rcmdnk/sentaku/install/install.sh| sh
  curl -fsSL https://raw.github.com/rcmdnk/sd_cl/install/install.sh| sh
fi

rm -rf ~/.bashrc
rm -rf ~/.bash_profile
rm -rf ~/.cache
rm -rf ~/.vim
mkdir  ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.gitconfig
rm -rf ~/.tmux
rm -rf ~/.tmux.conf
rm -rf ~/.tigrc

ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.tigrc ~/.tigrc
ln -s ~/dotfiles/rc ~/.vim/rc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

source ~/.bashrc
source ~/.bash_profile
