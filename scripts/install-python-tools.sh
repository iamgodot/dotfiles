#!/bin/bash

while read -r pkg; do
    pipx install $pkg;
done < ./scripts/inventory/pip.txt

pipx inject jupyterlab jupyterlab_materialdarker

echo 'Finshed pipx install.'
