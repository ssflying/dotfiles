# vim: ft=sh

# source global
if [[ -r /etc/bashrc ]]; then
  source /etc/bashrc
fi

# setup PS1
if [[ $TERM =~ screen* ]]; then
  export PS1='\e[01;34m\W \e[00;39m$ '
  PROMPT_COMMAND='echo -ne "\033k\033\0134"'
elif [[ $TERM == "xterm" ]]; then
  export PS1='\e[01;34m\W \e[00;39m$ '
else
  export PS1='\e[01;32m\u\e[01;0m@\e[01;31m\h\e[01;34m \W \$\e[00;39m '
fi

# ENVIRONMENT
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

# include other bashrc
for x in $HOME/.bash/* ; do
  [[ -x "$x" ]] && source $x
done
