export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -n "$PYTHONPATH" ]; then
    export PYTHONPATH='/Users/duo/.local/pipx/venvs/pdm/lib/python3.11/site-packages/pdm/pep582':$PYTHONPATH
else
    export PYTHONPATH='/Users/duo/.local/pipx/venvs/pdm/lib/python3.11/site-packages/pdm/pep582'
fi
