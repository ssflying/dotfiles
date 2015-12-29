# vim: ft=sh
# source bashrc when interactive shell 
case "$-" in 
  *i*) [[ -f ~/.bashrc ]] && . ~/.bashrc ;;
esac

# for golang
if [[ -d $HOME/gowork ]] && hash go 2>/dev/null; then
  export GOPATH=$HOME/gowork
  export PATH=${PATH}:${GOPATH}/bin
fi

# for perlbrew
if [[ -r $HOME/perl5/perlbrew/etc/bashrc ]]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

# for perl6
if [[ -x $HOME/.rakudobrew/bin/rakudobrew ]]; then
  eval "$($HOME/.rakudobrew/bin/rakudobrew init -)"
fi

# re-use ssh-agent
if [[ -f $HOME/.ssh/alickchen.rsa ]] && hash keychain 2>/dev/null ; then
  keychain $HOME/.ssh/alickchen.rsa 2>/dev/null
  source $HOME/.keychain/$HOSTNAME-sh
fi
