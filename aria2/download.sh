#!/bin/bash

video_site () {
  mkdir /youtube-dl
  cd /youtube-dl
  youtube-dl --match-filter !direct --continue --embed-subs --all-subs --write-auto-sub --merge-output-format mkv $1
  return
}

website () {
  cd /download
  wget -P /download -p -k -c -nd -H $1
  return
}

torrent () {
  cd /download
  aria2c --conf-path=/aria2/aria2.conf $1
  return
}

torrent_ml () {
  cd /download
  aria2c --conf-path=/aria2/aria2.conf --bt-save-metadata=true $1
  return
}

if [[ $1 =~ magnet:?* ]] ; then
  echo "Magnet Link"
  torrent_ml $1
else
  echo "Not Magnet Link"
  video_site $1 
if [ -z "$(ls -A /youtube-dl)" ]; then
    echo "Not Video Site"
    if torrent $1 ; then
      website $1
      echo "Download Complete"
    else
      echo "Not Valid Download"
    fi
else
  mv /youtube-dl/* /download
  rmdir /youtube-dl
  echo "Video Downloaded"
fi
fi