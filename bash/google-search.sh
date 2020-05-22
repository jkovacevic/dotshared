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

option=$(echo "" | rofi -lines 0 -location 6 -yoffset 3 -width 600 -font "DejaVu Sans 12" -dmenu -p "Google: ");
q=$(google_search $option)
if [ ! -z "$q" ]
then
      brave http://www.google.co.uk/search?q=$q
else
      echo "\$Input is empty."
fi