# Source the shell dotfiles
for file in ~/.dotfiles/system/.*; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

