#!/bin/sh

MPD_MUSIC_PATH="/mnt/vol5"
TMP_COVER_PATH="/home/john/.cache/mpd-track-cover"

exiftool -b -Picture "$MPD_MUSIC_PATH/$(mpc --format "%file%" current)" > "$TMP_COVER_PATH"
