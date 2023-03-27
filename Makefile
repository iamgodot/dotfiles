.PHONY: brew-install setup-zsh setup-nvim setup-dotfiles config-mac

brew-install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	cat inventory/common.txt | xargs brew install

setup-zsh:
	./scripts/setup-zsh.sh

setup-nvim:
	./scripts/setup-nvim.sh

setup-dotfiles:
	./scripts/setup.sh

config-mac: brew-install setup-zsh setup-nvim setup-dotfiles
	echo 'Finished mac config.'

