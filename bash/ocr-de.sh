IMAGE_NAME=/tmp/_.png
FILE_NAME=/tmp/_.txt
FILE_TMP=/tmp/__.txt
x=$IMAGE_NAME && touch $x && import $x;
tesseract -l deu --dpi 200 $IMAGE_NAME $(echo $FILE_NAME | awk '{split($0, a, "."); print a[1]}')
sed '/^[[:space:]]*$/d' $FILE_NAME > $FILE_TMP
cat $FILE_TMP | xclip -selection clipboard
translation=$(trans -b "$(cat $FILE_TMP)")
notify-send "$translation"
rm $IMAGE_NAME $FILE_NAME $FILE_TMP