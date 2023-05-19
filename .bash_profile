if [[ -n "$PS1" && -f "$HOME/.bashrc" ]]; then
    source "$HOME/.bashrc"
fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
