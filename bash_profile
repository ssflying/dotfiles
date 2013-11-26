[[ -f ~/.bashrc ]] && . ~/.bashrc

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# re-use ssh-agent
if [[ -f $HOME/.ssh/id_rsa ]] && [[ -x /usr/bin/keychain ]] ; then
	/usr/bin/keychain $HOME/.ssh/id_rsa &>/dev/null
	source $HOME/.keychain/$HOSTNAME-sh
fi
