SHELL := /bin/bash

.PHONY: brew-install pip-install setup config-mac arch

brew-install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	cat ./scripts/inventory/common.txt | xargs brew install
	cat ./scripts/inventory/brew.txt | xargs brew install
	echo 'Finshed brew install.'

pip-install:
	@while read -r pkg; do \
        pipx install "$$pkg"; \
    done < ./scripts/inventory/pip.txt
	pipx inject jupyterlab jupyterlab_materialdarker
	echo 'Finshed pipx install.'

setup:
	./scripts/setup.sh
	echo 'Finished setup.'

config-mac: brew-install pip-install setup
	echo 'Finished config on Mac.'

arch:
	USERNAME=godot ./scripts/arch/system.sh
	USERNAME=godot ./scripts/arch/user.sh
