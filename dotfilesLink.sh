#! /bin/bash
rm -rf ~/.vimrc
rm -rf ~/.gitconfig
rm -rf ~/.tmux.conf

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
