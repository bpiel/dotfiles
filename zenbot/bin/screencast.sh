ffmpeg -f x11grab -video_size 1600x900 -i :0 -f alsa -i default -c:v libx264 -c:a flac test2.mkv
