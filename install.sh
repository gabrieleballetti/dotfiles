#!/usr/bin/env bash

# get current dir (so this script can run from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# make utilities available
. "$DOTFILES_DIR/system/.functions"

# update dotfiles itself first
if isexecutable git -a -d "$DOTFILES_DIR/.git"; then
	git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull -v origin master;
fi

# basic symlinks
ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.bashrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~

# package managers & packages
# - macos
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"

# symlink mackup configuration file
# and restore preferences
if isexecutable mackup; then
    ln -sfv "$DOTFILES_DIR/mackup/.mackup.cfg" ~
    mackup restore
    echo "Mackup restored your preferences!"
else
    echo "Mackup DID NOT restore your preferences!"
fi

# git configuration
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore" ~

# ssh configuration
ln -sfv "$DOTFILES_DIR/ssh/config" ~/.ssh

# vim configuration
. "$DOTFILES_DIR/vim/configure-vim.sh"

# tmux configuration
. "$DOTFILES_DIR/tmux/configure-tmux.sh"

# install fonts (only on Linux, can run without privileges)
if [ "$(uname)" == "Linux" ]; then
	cp -rTv "$DOTFILES_DIR/fonts" ~/.fonts
	mkfontdir ~/.fonts
	xset fp+ ~/.fonts
	xset fp rehash
fi

# Final checks
[ -e ~/.bash_profile ] && . ~/.bash_profile && echo .bash_profile sourced successfully! || echo could not source .bash_profile

