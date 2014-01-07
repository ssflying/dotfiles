#!/bin/sh
# $XConsortium: xinitrc.cpp,v 1.4 91/08/22 11:41:34 rws Exp $

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

### ENV
LANG=en_US.UTF-8
LC_CTYPE=zh_CN.UTF-8

### preload apps
#scim -d &
fcitx -d &
~/bin/xsetnumlock & # set numlock on
xsetroot -bg black # make edge black.

# Start the window manager:
#if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
#    ck-launch-session startkde
#else
#    startkde
#fi

xterm -e screen -D -R &

# dwm session
#DWM_FIFO=~/.dwm.fifo
#DWM_SCRIPTS=~/bin/dwm-status.sh
#[ -e "$DWM_FIFO" ] || mkfifo "$DWM_FIFO"
#[ -p "$DWM_FIFO" ] && $DWM_SCRIPTS > $DWM_FIFO &
exec dwm 

