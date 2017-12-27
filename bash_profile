# vim: ft=sh
# source bashrc when interactive shell 
case "$-" in 
  *i*) [[ -f ~/.bashrc ]] && . ~/.bashrc ;;
esac

# for golang
get_go_path() {
  local go_abs_path
  go_abs_path=$(which go)
  echo "${go_abs_path%/*}"	# dirname
}

if [[ -d $HOME/gowork ]] && hash go 2>/dev/null; then
  export GOPATH=$HOME/gowork
  export PATH=${PATH}:${GOPATH}/bin
  # non-default path
  if ! [[ $(get_go_path) = "/usr/local/go/bin" ]]; then
    GOROOT=$(get_go_path)
    export PATH=${PATH}:${GOROOT}
    export GOROOT=${GOROOT%/*}	# upper
  fi
fi

unset get_go_path

# for perlbrew
if [[ -r $HOME/perl5/perlbrew/etc/bashrc ]]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

# for perl6
if [[ -x $HOME/.rakudobrew/bin/rakudobrew ]]; then
  eval "$($HOME/.rakudobrew/bin/rakudobrew init -)"
fi

# for rust
if [[ -r $HOME/.cargo/env ]]; then
  source $HOME/.cargo/env
fi

# re-use ssh-agent
if [[ -f $HOME/.ssh/alickchen.rsa ]] && hash keychain 2>/dev/null ; then
  keychain $HOME/.ssh/alickchen.rsa 2>/dev/null
  source $HOME/.keychain/$HOSTNAME-sh
fi

export TERM=xterm-256color
