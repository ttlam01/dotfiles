PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH
export PATH=$PATH:/usr/local/opt/python/libexec/bin
export PATH=$PATH:/opt/X11/bin:/Library/TeX/texbin
export GEM_HOME=$HOME/.gem
export PATH=$PATH:$GEM_HOME/bin
export PATH=$PATH:/usr/local/opt/ruby/bin
export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin
export PATH=$PATH:$HOME/.rvm/bin

#export EDITOR="/usr/local/bin/mate -w"
#export EDITOR="/Applications/MacVim.app/Contents/bin/mvim -g"
export EDITOR="/usr/local/bin/mvim"
source ~/.git-completion.bash


export HISTTIMEFORMAT="%a %b %d %T %Z %Y %t"
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='history:brew up*:brew cleanup:clear:df:exit:logout:neofetch:pwd:vim:nnn:istats:open:vimtutor'


alias matlabcmd="clear && /Applications/MATLAB_R2017a.app/bin/matlab -nojvm -nodisplay -nosplash"
alias help="man"
#alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
#alias mvim="/Applications/MacVim.app/contents/MacOS/Vim -g -f"
#alias mvim="/Applications/MacVim.app/Contents/bin/mvim -g"
alias workspace="cd $HOME/Workspace/"
#alias mvim="open -a MacVim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# setup for R
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig"

#Sys.setlocale(category="LC_ALL", locale = "en_US.UTF-8")

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


