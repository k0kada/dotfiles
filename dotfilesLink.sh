#! /bin/bash
rm -rf ~/.bashrc
rm -rf ~/.bash_profile
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.gitconfig
rm -rf ~/.tmux.conf

ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
source ~/.bash_profile

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
