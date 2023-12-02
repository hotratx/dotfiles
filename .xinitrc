setxkbmap -model pc104 -layout us_intl
dwmblocks &
picom -b &
xrandr --output eDP-1 --off & wal -i ~/wallpaper/SCq4e9.jpg &
xinput set-prop 'Kensington Slimblade Trackball' 'libinput Scrolling Pixel Distance' +35 &
xinput set-prop 'Kensington Slimblade Trackball' 'libinput Accel Speed' -0.7 &
xinput set-button-map "Kensington Slimblade Trackball" 1 2 3 4 5 8 7 6 &
exec dwm
