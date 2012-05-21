#!/bin/sh
#
## ~/.xinitrc
## author  : localizator <localizator@ukr.net>
## website : https://github.com/localizator
#

DEFAULT_SESSION=startkde

case $1 in
awesome)
        xrdb .Xresources & 
        xcompmgr &
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
	exec dbus-launch awesome
        ;;
openbox)
        xrdb .Xresources &
	exec dbus-launch openbox-session
        ;;
gnome)
        xrdb .Xresources &
        conkyrun -xstart
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
        exec ck-launch-session gnome-session
	;;
xfce4)
        xrdb .Xresources &
        xcompmgr &
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
        exec startxfce4 --with-ck-launch
	;;
lxde)
        xrdb .Xresources &
        xcompmgr &
        pidof mpdscribble >& /dev/null
        if [ $? -ne 0 ]; then
        mpdscribble &
        fi
        conkyrun -xstart &
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
	exec ck-launch-session startlxde
	;;
*)
        xrdb .Xresources &
        conkyrun -kde
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
        exec dbus-launch $DEFAULT_SESSION
	;;
esac
