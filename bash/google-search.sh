#!/bin/bash
google_search() {
    q=""
    i=0

    for var in "$@"
    do
       if [ "$i" -eq "0" ]
       then
          q+=$var
       else
          q+="+"$var
       fi
       i+=1
    done
    echo "$q"
}

option=$(echo "" | rofi -show drun -padding 20 -yoffset -400 -lines 0 -dmenu -p "Google");
q=$(google_search $option)
if [ ! -z "$q" ]
then
      x-www-browser http://www.google.co.uk/search?q=$q
else
      notify-send "Google search input is empty."
fi