#!/bin/sh
#
## ~/.xinitrc
## author  : localizator <localizator@ukr.net>
## website : https://github.com/localizator
#

DEFAULT_SESSION=startkde

case $1 in
cinnamon)
        xrdb .Xresources &
        conky -c /home/john/.config/conky/config/.conkyrc &
        urxvtd -q -o -f &
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
        exec ck-launch-session gnome-session-cinnamon
        ;;
mate)
        xcompmgr &
        xrdb .Xresources &
        conky -c /home/john/.config/conky/config/.conkyrc &
        urxvtd -q -o -f &
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
        exec mate-session
        ;;
awesome)
        xrdb .Xresources & 
        xcompmgr &
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
	    exec dbus-launch awesome
        ;;
i3)
        xrdb .Xresources & 
        xcompmgr &
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
        exec i3
        ;;
dwm)
        xrdb .Xresources &
        eval $(cat ~/.fehbg) 
        xcompmgr -a &
        urxvtd -q -o -f &
        parcellite -n &
        dropboxd &
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
        exec dbus-launch /home/john/bin/dwm-start
        ;;
openbox)
        export BROWSER=chromium
        export DE=openbox
        xrdb .Xresources &
	    exec dbus-launch openbox-session
        ;;
gnome)
        xrdb .Xresources &
        conkyrun -xstart &
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
        conkyrun -kde &
        setxkbmap -option grp:alt_shift_toggle,lv3:ralt_switch,grp_led:scroll us,ua,ru &
        exec dbus-launch $DEFAULT_SESSION
	    ;;
esac
