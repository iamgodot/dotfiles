brew-install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	cat ./scripts/inventory/common.txt | xargs brew install
	cat ./scripts/inventory/brew.txt | xargs brew install
	echo 'Finshed brew install.'

arch-install:
	sudo yes | pacman -Syyy
	sudo yes | pacman -S - < ./scripts/inventory/common.txt
	sudo yes | pacman -S - < ./scripts/inventory/pacman.txt
	sudo yes | pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
	cat ./scripts/inventory/yay.txt | xargs yay -S
	echo 'Finshed arch install.'

pip-install:
	python3 -m pip install --user pipx
	python3 -m pipx ensurepath
	while read -r pkg;do pipx install $pkg;done < ./scripts/inventory/pip.txt
	echo 'Finshed pipx install.'

setup:
	./scripts/setup.sh
	echo 'Finished setup.'

config-mac: brew-install pip-install setup
	echo 'Finished config on Mac.'

config-arch: arch-install pip-install setup
	echo 'Finished config on Arch.'
