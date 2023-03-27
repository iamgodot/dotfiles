.PHONY: brew-install setup-zsh setup-nvim setup-dotfiles config-mac

brew-install:
	./scripts/brew-install.sh

setup-zsh:
	./scripts/setup-zsh.sh

setup-nvim:
	./scripts/setup-nvim.sh

setup-dotfiles:
	./scripts/setup.sh

config-mac: brew-install setup-zsh setup-nvim setup-dotfiles
	echo 'Finished mac config.'

