#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export GTK2_RC_FILES="/home/john/.gtkrc-2.0"
export MOZ_DISABLE_PANGO=1
export OPERAPLUGINWRAPPER_PRIORITY=0
export OPERA_KEEP_BLOCKED_PLUGIN=1

export EDITOR='nano'
export VIEWER='vim -R'
export BROWSER='chromium'
export TERM='urxvt'

export PATH="$HOME/bin:$PATH"