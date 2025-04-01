#!/bin/bash

cd `dirname $0`
cd ..

mkdir -p log

LOG=log/download_thumbnails_memberonly.log

exec 1> >(
  while read -r l; do echo "[$(date +"%Y-%m-%d %H:%M:%S")] $l"; done \
    | tee -a $LOG
)
exec 2> >(
  while read -r l; do echo "[$(date +"%Y-%m-%d %H:%M:%S")] $l"; done \
    | tee -a $LOG
)

mkdir -p thumbnail_memberonly

while read line
do
  thumbnailurl='https://i.ytimg.com/vi/'"$line"'/maxresdefault.jpg'
  output='thumbnail_memberonly/'"$line"'.jpg'
  wget -O "$output" "$thumbnailurl"
  if [ $? -ne 0 ];then
    thumbnailurl='https://i.ytimg.com/vi/'"$line"'/sddefault.jpg'
    wget -O "$output" "$thumbnailurl"
    if [ $? -ne 0 ];then
      thumbnailurl='https://i.ytimg.com/vi/'"$line"'/hqdefault.jpg'
      wget -O "$output" "$thumbnailurl"
      if [ $? -ne 0 ];then
        thumbnailurl='https://i.ytimg.com/vi/'"$line"'/mqdefault.jpg'
        wget -O "$output" "$thumbnailurl"
      fi
    fi
  fi
done < videoids_memberonly.txt
