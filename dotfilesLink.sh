#! /bin/bash
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.gitconfig
rm -rf .tmux
rm -rf ~/.tmux.conf
rm -rf ~/.tmux.local

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

git clone https://github.com/gpakosz/.tmux.git .tmux
ln -s ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.tmux/.tmux.conf.local ~/.tmux.conf.local

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
