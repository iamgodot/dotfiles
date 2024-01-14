export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -n "$PYTHONPATH" ]; then
    export PYTHONPATH='/Users/duo/.local/pipx/venvs/pdm/lib/python3.11/site-packages/pdm/pep582':$PYTHONPATH
else
    export PYTHONPATH='/Users/duo/.local/pipx/venvs/pdm/lib/python3.11/site-packages/pdm/pep582'
fi

export PIPX_DEFAULT_PYTHON="/Users/duo/.pyenv/versions/3.11.3/bin/python"
