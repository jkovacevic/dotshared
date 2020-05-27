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

option=$(echo "" | rofi -show drun -location 6 -width 600 -lines 0 -dmenu -p "G");
q=$(google_search $option)
if [ ! -z "$q" ]
then
      x-www-browser http://www.google.co.uk/search?q=$q
fi