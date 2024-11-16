# Whisper Transcriber Docker

This project provides a Dockerized environment for transcribing audio files into subtitles (`.srt` format) using [OpenAI Whisper](https://github.com/openai/whisper).  
The container includes all necessary dependencies, ensuring a seamless transcription experience.

## Features

- Transcribe audio files (`.mp3`, `.wav`, etc.) into `.srt` subtitle files.
- Leverages OpenAI's Whisper with the **base model** for transcription.
- Automatically saves subtitles in a dedicated `subtitles` folder.

## Prerequisites

Before using this project, ensure the following are installed on your system:
- [Docker](https://www.docker.com/)

## Setup

1. **Clone the Repository** (if applicable):
   ```bash
   git clone git@github.com:thomaskanzig/whisper-transcriber.git
   cd whisper-transcriber-docker
   ```  

2.	Build the Docker Image:
   ```bash
   docker build -t whisper-transcriber .
   ```   

## Usage

To transcribe an audio file and generate an .srt subtitle file:

1.	Place your audio file in the `audio` directory within the project folder.
2.	Run the following command:
```bash
  docker run -v $(pwd):/app whisper-transcriber audio/<PATH-AUDIO-FILE>
```

## Command Breakdown

- docker run: Runs the Docker container.  
- -v $(pwd):/app: Mounts the current directory into the container’s /app directory.  
- whisper-transcriber: Name of the Docker image.  
- <PATH-AUDIO-FILE> Path to the audio file you want to transcribe.  

## Example

If you have an audio file named example.mp3 in your audio/ directory:

```bash
docker run -v $(pwd):/app whisper-transcriber audio/example.mp3
```

The transcription will save the subtitle file as:

```bash
subtitles/example.srt
```

## Output

The generated .srt file will be saved in the subtitles folder within your current working directory.

Example structure after running the command:

```
.
├── audio
│   └── example.mp3
├── subtitles
│   └── example.srt
├── Dockerfile
├── entrypoint.sh
└── README.md
```

## Customization

Change the Whisper Model

You can edit the entrypoint.sh file to use a different Whisper model, such as tiny, medium, or large. Modify the line:
    
```bash
  whisper "$1" --model base --output_format srt --output_dir /app/subtitles
```

to:
    
```bash
  whisper "$1" --model medium --output_format srt --output_dir /app/subtitles
``` 

## Troubleshooting

Common Errors

- Permission Denied for entrypoint.sh:
Ensure the script has executable permissions:
```bash
chmod +x entrypoint.sh
```

- No Output in subtitles:
Verify the audio file path and format. Supported formats include .mp3, .wav, .m4a, etc.


