#!/usr/bin/env zsh
local out="out_$(date '+%Y%m%d')"
local fetch_files=1
# local fetch_files=0
if (( fetch_files == 1 )); then
    if [[ -d $out ]]; then
        rm -rf $out
    fi
    mkdir $out
fi
cd $out
local ext="mp3"
local url=$1
if (( fetch_files == 1 )); then
    yt-dlp --cookies ../cookies.txt --extract-audio --audio-format "$ext" --yes-playlist --output '%(title)s.%(ext)s' "$url"\n
fi
local matches=( *.$ext(.) )
local size_matches=${#matches[@]}
local ord=1
local files=( *.$ext(.oc) )
local ffmpeg_args=(-codec copy)
# local ffmpeg_args=(-filter:a atempo=1.5)
local album="$2"
local artist="$3"
local last=${#files[@]}
for ((i=last; i>0; i--)); do
#for fname in "${files}"; do
    fname="${files[$i]}"
    ffmpeg -i "$fname" "${ffmpeg_args[@]}" -metadata title="${fname:r}" -metadata artist="$artist" -metadata album="$album" -metadata track="$ord/${size_matches}" "$ord - ${fname:t}"
    (( ord++ ))
    # if (( $ord == 2 )); then
    #     exit
    # fi
done
