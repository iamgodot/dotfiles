SHELL := /bin/bash

.PHONY: arch install-arch install-mac install-python-tools bootstrap

help: ## Prints help for targets with comments
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

arch: ## Set up a new Arch Linux
	@$(MAKE) install-arch
	USERNAME=godot ./scripts/setup-arch.sh
	@$(MAKE) bootstrap
	@$(MAKE) install-python-tools
	echo "Arch setup completed."

mac: ## Set up a new MacOS
	@$(MAKE) install-mac
	./scripts/setup-mac.sh
	@$(MAKE) bootstrap
	@$(MAKE) install-python-tools
	@$(MAKE) install-emacs
	echo "Mac setup completed."

install-arch: ## Install a list of packages on Arch
	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm - < ./scripts/inventory/arch.txt

install-mac: ## Install a list of packages on MacOS
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	cat ./scripts/inventory/brew.txt | xargs brew install

install-emacs:
	brew tap d12frosted/emacs-plus
	brew install emacs-plus --with-modern-papirus-icon
	git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
	~/.config/emacs/bin/doom install

install-python-tools: ## Install a list of Python CLI tools via pipx
	./scripts/install-python-tools.sh

bootstrap: ## Install dotfiles and config
	./scripts/bootstrap.sh
	echo "Bootstrap completed."
