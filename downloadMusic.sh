#!/bin/bash
set -e

# ___ PARAMETERS ___
# Enter playlist url here
PLAYLIST="https://www.youtube.com/playlist?list=PLiSpUeGpcb8C-NEYY6qmht-L7g7wtBr3Z"

# Output folder
MUSIC_OUTPUT_FOLDER="$HOME/Nextcloud/Music/plus/"

# Define python executable here
PYTHON_EXEC=$(which python3.10)

# ___ END PARAMETERS ___

SCRIPT=$(realpath "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
YT_DL_DIR="$SCRIPT_PATH/youtube-dl"

mkdir -p "$YT_DL_DIR"
if [ ! -d "$YT_DL_DIR/app" ] ; then
	git clone https://github.com/ytdl-org/youtube-dl "$YT_DL_DIR/app"
fi

echo "Checking for youtube-dl updates"
cd "$YT_DL_DIR/app"
git pull

echo "Creating virtual environment"
$PYTHON_EXEC -m venv "$YT_DL_DIR/venv"
source "$YT_DL_DIR/venv/bin/activate"

echo "Installing youtube-dl"
pip install --upgrade pip setuptools
python setup.py install

echo "Starting music download"
mkdir -p "$MUSIC_OUTPUT_FOLDER"
"$YT_DL_DIR/venv/bin/youtube-dl" -i --no-check-certificate -o "$MUSIC_OUTPUT_FOLDER/%(title)s.%(ext)s" -f bestaudio --extract-audio --audio-format m4a --audio-quality 0 --verbose "$PLAYLIST"

