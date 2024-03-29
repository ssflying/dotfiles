# vim: ft=sh

export PATH=$HOME/bin:$PATH
# source global
if [[ -r /etc/bashrc ]]; then
  source /etc/bashrc
fi

# setup PS1
if [ -t 1 ]; then
  Bold=$(tput bold)
  Red=${Bold}$(tput setaf 1)
  Blue=${Bold}$(tput setaf 4)
  Green=${Bold}$(tput setaf 2)
  Reset=$(tput sgr0)
  if [[ $TERM =~ screen* ]]; then
    export PS1="\[${Green}\]\u \[${Blue}\]\W \[${Reset}\]\$ "
    PROMPT_COMMAND='echo -ne "\033k\033\0134"; history -a'
  elif [[ $TERM == "xterm" ]]; then
    export PS1="\[${Blue}\]\W \[${Reset}\]\$ "
  else
    export PS1="\[${Green}\]\u\[${Reset}\]@\[${Red}\]\h\[${Blue}\] \W \$\[${Reset}\] "
  fi
  unset Red Green Reset Blue
fi

# ENVIRONMENT
export EDITOR=vim
export PAGER=less

# History 
shopt -s histappend cmdhist
export HISTCONTROL=ignoredups
export HISTIGNORE='&:bg:fg:ls:h:history'
export HISTSIZE=10000
export HISTFILESIZE=10000
export PROMPT_COMMAND='history -a'

# colorful man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# colorful ls
#eval "`dircolors`"

# include other bashrc
for x in $HOME/.bash/*; do
  if [[ "$USER" != "alick" ]] && [[ $x =~ \.tx$ ]]; then
    # exclude *.tx when at home
    continue
  fi
  [[ -x "$x" ]] && source $x
done
