#!/bin/bash

cd `dirname $0`
cd ..

mkdir -p log

LOG=log/download_chats.log

exec 1> >(
  while read -r l; do echo "[$(date +"%Y-%m-%d %H:%M:%S")] $l"; done \
    | tee -a $LOG
)
exec 2> >(
  while read -r l; do echo "[$(date +"%Y-%m-%d %H:%M:%S")] $l"; done \
    | tee -a $LOG
)

mkdir -p chat

while read line
do
  videourl='https://youtu.be/'"$line"
  yt-dlp -o "chat/%(upload_date)s_%(title).190B_[%(id)s].%(ext)s" --skip-download --youtube-skip-dash-manifest --write-sub --write-comments --cookies youtube.com_cookies.txt "$videourl"
done < videoids.txt
