if ! isexecutable tmux; then
    echo "Skipped: tmux configuration (missing tmux)"
    return
fi

# configure Tux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# symlink .tmux.conf
ln -sfv "$DOTFILES_DIR/tmux/.tmux.conf" ~
tmux source ~/.tmux.conf

