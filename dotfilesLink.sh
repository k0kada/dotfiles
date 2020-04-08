#! /bin/bash

rm -rf ~/.cache
rm -rf ~/.vim
mkdir  ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.gitconfig
rm -rf ~/.tmux
rm -rf ~/.tmux.conf
rm -rf ~/.tigrc
mkdir -p ~/.config/fish

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.tigrc ~/.tigrc
ln -s ~/dotfiles/rc ~/.vim/rc
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
