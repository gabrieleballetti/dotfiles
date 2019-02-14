if [ "$(uname)" != "Darwin" ] || ! isexecutable brew; then
	echo "Skipped: Homebrew-Cask"
	return
fi

brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts

brew cask upgrade

# Install packages
apps=(
    adobe-acrobat-reader
    adobe-digital-editions
    android-file-transfer
    android-studio
    calibre
    discord
	dropbox
	gimp
	google-chrome
	iterm2
	itsycal
	league-of-legends
	libreoffice
	macdown
    mactex
	skype
	spotify
	texstudio
	textmate
	vlc
    xquartz #required for wine
)
brew cask install "${apps[@]}"

