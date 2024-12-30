# Whisper

This projects provides a helper script to transcribe audio/video files using the [OG Whisper model from OpenAI](https://github.com/openai/whisper)


# Installation

### Create virtual environment and install dependencies

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements_lock.txt
```


# Transcribe

To transcribe an audio or a video file, invoke the `transcribe.sh` script and provide a file as a first param

```bash
./transcribe.sh audio_or_video_file.mp4
```

### Specify the audio language

Specifies English as an audio language

```bash
./transcribe.sh audio_or_video_file.mp4 en
```

### Specify max words per line

Specifies English as an audio language and limits the model output to 7 words per line

> [!Note]
> The word limited output will be available only for timestamped files like `.srt`, `.vtt`, etc.

```bash
./transcribe.sh audio_or_video_file.mp4 en 7
```

### Specify max words per line and use language auto-detect

Limit the model output to 10 words per line and use language auto-detect

```bash
./transcribe.sh audio_or_video_file.mp4 "" 10
```
