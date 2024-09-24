#!/bin/bash

# Video file
VIDEO=$1
OUTPUT_PREFIX=$(basename $VIDEO .mp4)
N_FRAMES=$2

# Use ffprobe to get video duration in seconds
DURATION=$(ffprobe -i "$VIDEO" -show_entries format=duration -v quiet -of csv="p=0")

# Calculate time interval between frames (100 frames)
INTERVAL=$(echo "$DURATION / 50" | bc -l)

# Interval approximation
INTERVAL=$(printf "%.2f" "$INTERVAL")

echo "Video duration: $DURATION seconds"
echo "Extracting frames..."

# Extract frames
ffmpeg -i "$VIDEO" -vf "fps=1/$INTERVAL" $OUTPUT_PREFIX"_%04d.jpg"

echo "Frames extracted successfully."
