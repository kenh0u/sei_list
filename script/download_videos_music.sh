#!/bin/bash

cd `dirname $0`
cd ..

mkdir -p log

LOG=log/download_videos_music.log

exec 1> >(
  while read -r l; do echo "[$(date +"%Y-%m-%d %H:%M:%S")] $l"; done \
    | tee -a $LOG
)
exec 2> >(
  while read -r l; do echo "[$(date +"%Y-%m-%d %H:%M:%S")] $l"; done \
    | tee -a $LOG
)

mkdir -p video_music

while read line
do
  videourl='https://youtu.be/'"$line"
  yt-dlp -o "video_music/%(upload_date)s_%(title)s_[%(id)s].%(ext)s" -f "bestvideo+bestaudio/best" --add-metadata --embed-thumbnail --cookies youtube.com_cookies.txt "$videourl"
done < videoids_music.txt
