#!/bin/bash

SCRIPT_FULL_PATH="$(readlink -f "$0")"
VENV_PYTHON_FULL_PATH="$(dirname "$SCRIPT_FULL_PATH")/venv/bin/python"
VENV_ACTIVATE_FULL_PATH="$(dirname "$SCRIPT_FULL_PATH")/venv/bin/activate"
MODEL="turbo"


FILE_TO_TRANSCRIBE="$1"
if [ "$FILE_TO_TRANSCRIBE" = "" ]; then
  echo 'Please specify a file to transcribe as a first param'
  exit 1
fi

LANGUAGE="$2"
MAX_WORDS="${3:-None}"  # Will be visible only in .srt and .vtt output files


is_venv_active() {
  if [ "$(which python)" = "$VENV_PYTHON_FULL_PATH" ]; then
    echo 1
  else
    echo 0
  fi
}

if [ ! -f "$VENV_PYTHON_FULL_PATH" ]; then
  echo 'Error: Could not find a virtual environment. Please initialize one first.'
  echo 'Command: python -m venv venv'
  exit 1
fi

if [ "$(is_venv_active)" = "0" ]; then
  . "$VENV_ACTIVATE_FULL_PATH"
fi


transcribe() {
  local device="${1:-gpu}"

  declare -A device_options
  device_options["cpu"]="cpu"
  device_options["gpu"]="cuda"
  device_options["cuda"]="cuda"

  if [ "$LANGUAGE" = "" ]; then
    whisper "$FILE_TO_TRANSCRIBE" --device "${device_options["$device"]}" --word_timestamps True --max_words_per_line "$MAX_WORDS" --model "$MODEL"
  else
    whisper "$FILE_TO_TRANSCRIBE" --device "${device_options["$device"]}" --language "$LANGUAGE" --word_timestamps True --max_words_per_line "$MAX_WORDS" --model "$MODEL"
  fi
}


transcribe
