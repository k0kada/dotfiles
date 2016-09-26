#! /bin/bash
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.gitconfig
rm -rf .tmux
rm -rf ~/.tmux.conf
rm -rf ~/.tmux.local

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
