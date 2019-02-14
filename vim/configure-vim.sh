if ! isexecutable vim || ! isexecutable curl; then
    echo "Skipped: Vim configuration (missing curl and/or vim)"
    return
fi

# install vimrc (Awesom version)
if [ -d ~/.vim_runtime ]; then
    echo "vimrc already installed"
else
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
fi

# install vim-plug
if [ -f ~/.vim_runtime/autoload/plug.vim ]; then
    echo "vimplug already installed"
else
    curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# symlink .vimrc and configure plugins
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
vim +PlugInstall +qall
mkdir -p ~/.vim_runtime/plugin
ln -svf ~/.dotfiles/vim/plugin/*.vim ~/.vim_runtime/plugin/

