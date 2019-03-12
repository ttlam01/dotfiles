#export PATH="/usr/local/sbin:$PATH"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export EDITOR="/usr/local/bin/mate -w"
#export EDITOR="open -a MacVim"
source ~/.git-completion.bash

export HISTIGNORE="brew upgrade:brew cleanup:clear:df*:exit:logout:neofetch:pwd:vim"

#export PATH="/usr/local/opt/python/libexec/bin:$PATH"

alias matlabcmd="clear && /Applications/MATLAB_R2017a.app/bin/matlab -nojvm -nodisplay -nosplash"
alias help="man"
#alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
#alias mvim="/Applications/MacVim.app/contents/MacOS/Vim -g -f"
alias mvim="open -a MacVim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# setup for R
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# fix the framework problem in python
#function frameworkpython {
#    if [[ ! -z "$VIRTUAL_ENV" ]]; then
#        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
#    else
#        /usr/local/bin/python "$@"
#    fi
#}
if [ -x "$(command -v neofetch )" ]; then
    neofetch
fi
