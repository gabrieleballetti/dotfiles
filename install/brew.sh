if [ "$(uname)" != "Darwin" ]; then
        echo "Skipped: Homebrew"
        return
fi

if ! isexecutable ruby || ! isexecutable curl || ! isexecutable git; then
	echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
	return
fi

if ! isexecutable brew; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

# install packages
apps=(
	aria2
    bitwarden-cli
	git
    gmp
	mackup
    parallel
	python
    reattach-to-user-namespace
    tmux
	vim
	wget
	wifi-password
    wine
    zsh
    zsh-completions
)

brew install "${apps[@]}"
