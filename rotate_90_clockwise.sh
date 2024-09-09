#Script to rotate video in 90 degrees clockwise

INPUT=$1
OUTPUT=$(basename $INPUT .mp4)
ffmpeg -i $INPUT -vf "transpose=1" $OUTPUT"_rotated.mp4"
