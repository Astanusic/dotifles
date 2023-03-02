#!/bin/bash

zen_on() {
  sketchybar --set github.bell drawing=off \
             --set apple.logo drawing=on \
             --set '/cpu.*/' drawing=on \
             --set calendar icon.drawing=on \
             --set yabai drawing=off \
             --set separator drawing=off \
             --set front_app drawing=off \
             --set volume_icon drawing=on \
             --set spotify.anchor drawing=off \
             --set spotify.play updates=on \
             --set brew drawing=on
}

zen_off() {
  sketchybar --set github.bell drawing=on \
             --set apple.logo drawing=on \
             --set '/cpu.*/' drawing=on \
             --set calendar icon.drawing=on \
             --set yabai drawing=off \
             --set separator drawing=off \
             --set front_app drawing=off \
             --set volume_icon drawing=on \
             --set spotify.play updates=on \
             --set brew drawing=on
}

if [ "$1" = "on" ]; then
  zen_off
elif [ "$1" = "off" ]; then
  zen_off
else
  if [ "$(sketchybar --query apple.logo | jq -r ".geometry.drawing")" = "on" ]; then
    zen_off
  else
    zen_off
  fi
fi

