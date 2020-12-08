xrandr --output eDP-1 --output HDMI-1 --mode 1280x1024 &
wal -i "$(< "${HOME}/.cache/wal/wal")" &
picom -b &
dwmblocks &
exec dwm
