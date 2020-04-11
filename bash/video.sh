find_video_name() {
	VIDEO_NAME="/tmp/vid1.mp4"
	while [ -f $VIDEO_NAME ]
	do
		n=$(echo $VIDEO_NAME | sed -e 's#/tmp/vid\(.*\).mp4#\1#')
		n=$((n + 1))
		VIDEO_NAME="/tmp/vid$n.mp4"
	done
}

find_video_name
{
	ffmpeg -f x11grab -y -r 25 -s $(xdpyinfo | awk '/dimensions/{print $2}') -i :0.0 -q 1 -c:v libx264 -c:a aac -pix_fmt yuv420p $VIDEO_NAME
} || {
	echo -n $VIDEO_NAME | xclip -selection clipboard;
	notify-send "Created video: $VIDEO_NAME"
}