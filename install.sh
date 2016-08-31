#!/bin/sh

echo "Downloading .emacs ..."
curl https://raw.githubusercontent.com/yusuke-arai/dotfiles/master/.emacs > ~/.emacs

echo "Downloading .gitconfig ..."
curl https://raw.githubusercontent.com/yusuke-arai/dotfiles/master/.gitconfig > ~/.gitconfig

echo "Downloading .inputrc ..."
curl https://raw.githubusercontent.com/yusuke-arai/dotfiles/master/.inputrc > ~/.inputrc

echo "Downloading .tmux.conf ..."
curl https://raw.githubusercontent.com/yusuke-arai/dotfiles/master/.tmux.conf > ~/.tmux.conf

echo "Downloading .vimrc ..."
curl https://raw.githubusercontent.com/yusuke-arai/dotfiles/master/.vimrc > ~/.vimrc

echo "Done."
