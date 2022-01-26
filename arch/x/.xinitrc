#!/bin/sh

userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ]; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export LC_CTYPE=en_US.UTF-8

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx

xset s off
xset dpms 0 0 0
xset -dpms

/usr/bin/dunst &
/usr/bin/dropbox &
/usr/bin/flameshot &
/usr/bin/albert &

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# export DESKTOP_SESSION=plasma
# exec startplasma-x11
exec i3
