if ! isexecutable zsh || ! isexecutable curl; then
    echo "Skipped: zsh configuration (missing curl and/or zsh)"
    return
fi

# install oh-my-bash
if [ -f ~/.zshrc ]; then
    echo "oh-my-bash already installed"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
