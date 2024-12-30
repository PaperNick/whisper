# Whisper

This projects provides helper script to transcribe audio/video files using the [OG Whisper model from OpenAI](https://github.com/openai/whisper)


# Installation

### Create virtual environment and install deps

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

# Transcribe

To transcribe audio or video files, invoke the `transcribe.sh` scripts and provide a file as a first param

```bash
./transcribe.sh audio_or_video_file.mp4
```

### Specify audio language

Specifies English as an audio language

```bash
./transcribe.sh audio_or_video_file.mp4 en
```

### Specify max words per line

Specifies English as an audio language and limits the model output to 7 words per line

**Note:** the word limited output will be available only for timestamped files like `.srt`, `.vtt`, etc.

```bash
./transcribe.sh audio_or_video_file.mp4 en 7
```

### Specify max words per line and use language auto-detect

Limit the model output to 10 words per line and use language auto-detect

```bash
./transcribe.sh audio_or_video_file.mp4 "" 10
```