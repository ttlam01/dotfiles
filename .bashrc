PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH
export PATH=$PATH:/usr/local/opt/python/libexec/bin
export PATH=$PATH:/opt/X11/bin:/Library/TeX/texbin
export GEM_HOME=$HOME/.gem
export PATH=$PATH:$GEM_HOME/bin
export PATH=$PATH:/usr/local/opt/ruby/bin
export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:/usr/local/opt/python@3.8/bin
export PATH=$PATH:/usr/local/opt/lua@5.3/bin


#export EDITOR="/usr/local/bin/mate -w"
#export EDITOR="/Applications/MacVim.app/Contents/bin/mvim -g"
export EDITOR="/usr/local/bin/mvim"
source ~/.git-completion.bash

#[[ -f "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"


#QT5 path
export QT_BASE=`brew info qt5 | grep Cellar | cut -d' ' -f1`

# HIST control
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
export LDFLAGS="$LDFLAGS -L/usr/local/opt/llvm/lib"
export LDFLAGS="$LDFLAGS -L//usr/local/Cellar/boost/1.76.0/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/llvm/include"
export CPPFLAGS="$CPPFLAGS -I/usr/local/Cellar/boost/1.76.0/include"
export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig"

#export CC=/usr/local/opt/llvm/bin/clang
#export CXX=/usr/local/opt/llvm/bin/clang++
#export CPPFLAGS="-I/usr/local/opt/llvm/include"
#export LDFLAGS="-L/usr/local/opt/llvm/lib"

#XCBASE=`xcrun --show-sdk-path`
#export C_INCLUDE_PATH=$XCBASE/usr/include
#export CPLUS_INCLUDE_PATH=$XCBASE/usr/include
#export LIBRARY_PATH=$XCBASE/usr/lib

export RANGER_LOAD_DEFAULT_RC=FALSE

#Sys.setlocale(category="LC_ALL", locale = "en_US.UTF-8")

# fix the framework problem in python
#function frameworkpython {
#    if [[ ! -z "$VIRTUAL_ENV" ]]; then
#        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
#    else
#        /usr/local/bin/python "$@"
#    fi
#}

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

if [ -x "$(command -v neofetch )" ]; then
    neofetch
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# nnn config

NNN_USE_EDITOR=1                                # use the $EDITOR when opening text files
NNN_SSHFS_OPTS="sshfs -o follow_symlinks"       # make sshfs follow symlinks on the remote
NNN_COLORS="2136"                               # use a different color for each context
NNN_TRASH=1                                     # trash (needs trash-cli) instead of delete

#alias t="/usr/local/bin/todo.sh -d $HOME/.todo/.todo.cfg"
#source /usr/local/Cellar/todo-txt/2.12.0/etc/bash_completion.d/todo_completion complete -F _todo todo

