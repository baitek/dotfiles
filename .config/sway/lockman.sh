#!/bin/sh
swayidle \
  timeout 300 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"' &
swaylock -i ~/.config/sway/mountains.jpeg
kill %%
