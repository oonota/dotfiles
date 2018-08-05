#pass setting

# added by Anaconda3 2.4.0 installer
export PATH="/Users/oono/anaconda/bin:$PATH"
export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH="/usr/local/Cellar/git/2.9.2/bin:$PATH"
export PATH="/Applications/Julia-0.6.app/Contents/Resources/julia/bin:$PATH"

export TERM=xterm-color

#pyenv path
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

#nodebrew path
export PATH=$HOME/.nodebrew/current/bin:$PATH

