SHELL := /bin/bash

.PHONY: arch install-arch install-mac bootstrap

help: ## Prints help for targets with comments
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# TODO: Move to a separate script
pip-install:
	@while read -r pkg; do \
        pipx install "$$pkg"; \
    done < ./scripts/inventory/pip.txt
	pipx inject jupyterlab jupyterlab_materialdarker
	echo 'Finshed pipx install.'

arch:  ## Set up a new Arch Linux
	install-arch
	USERNAME=godot ./scripts/setup-arch.sh
	bootstrap
	echo "Arch setup completed."

install-arch: ## Install a preset list of packages on Arch
	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm - < ./scripts/inventory/arch.txt

install-mac: ## Install a preset list of packages on MacOS
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	cat ./scripts/inventory/common.txt | xargs brew install
	cat ./scripts/inventory/brew.txt | xargs brew install

bootstrap: ## Install dotfiles and config
	./scripts/bootstrap.sh
	echo "Bootstrap completed."
