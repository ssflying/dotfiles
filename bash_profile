# vim: ft=sh
[[ -f ~/.bashrc ]] && . ~/.bashrc

# for golang
if [[ -d $HOME/gowork ]] && hash go 2>/dev/null; then
  export GOPATH=$HOME/gowork
  export PATH=${PATH}:${GOPATH}/bin
fi

# for perl6
if [[ -x $HOME/.rakudobrew/bin/rakudobrew ]]; then
	eval "$($HOME/.rakudobrew/bin/rakudobrew init -)"
fi

# re-use ssh-agent
if [[ -f $HOME/.ssh/id_rsa ]] && [[ -x /usr/bin/keychain ]] ; then
	/usr/bin/keychain $HOME/.ssh/id_rsa &>/dev/null
	source $HOME/.keychain/$HOSTNAME-sh
fi
