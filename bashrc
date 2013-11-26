# include other bashrc
[ -f ~/.bash/alias ] && source $HOME/.bash/alias
[ -f ~/.bash/functions ] && source $HOME/.bash/functions
[ -f /etc/bash_completion ] && source /etc/bash_completion

# setup PS1
if [ $TERM == "screen" ]; then
    export PS1='\[\033[01;34m\]\W \[\033[00;39m\]$ '
elif [ $TERM == "xterm" ]; then
    export PS1='\[\033[01;34m\]\W \[\033[00;39m\]$ '
else
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00;39m\] '
fi


# ENVIRONMENT
export PATH=/usr/sbin:/sbin:$PATH
export EDITOR=vim
export PAGER=less
export HISTCONTROL=ignoredups
export HISTIGNORE='&:bg:fg:ls:h'

# colorful man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# startx by default
#if [ -z "$DISPLAY" ] && [ $(tty) = /dev/vc/1 ]; then
#  startx
#  logout
#fi
