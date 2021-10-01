export LC_CTYPE=en_US.UTF-8

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xset s off
xset dpms 0 0 0
xset -dpms

/usr/bin/fcitx &
/usr/bin/dunst &
/usr/bin/dropbox &
/usr/bin/flameshot &

if [ -f $HOME/.Xmodmap ]; then
	/usr/bin/xmodmap $HOME/.Xmodmap
fi

exec i3
