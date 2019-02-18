if [ "$(uname)" != "Darwin" ]; then
        echo "Skipped: Homebrew"
        return
fi

xcode-select --install

