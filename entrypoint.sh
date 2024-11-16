#!/bin/bash

# Ensure an audio file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: docker run -v \$(pwd):/app your-container-name input_audio_file"
    exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p /app/subtitle

# Extract the base name of the input file (e.g., "audio.mp3" -> "audio")
filename=$(basename -- "$1")
basename="${filename%.*}"

# Run Whisper to transcribe the audio file and save to the subtitle folder
whisper "$1" --model base --output_format srt --output_dir /app/subtitle

echo "Transcription completed. The subtitle file is saved in the 'subtitle' folder."