# YouTube music playlist downloader

Using this bash script you can easily download a full YouTube playlist as music
files using `youtube-dl`.

It automatically sets up a python virtual environment, installs all required dependencies and starts the download & conversion process.

## How to run

1. Edit `downloadMusic.sh`

- Change the `$PLAYLIST` parameter to the url of your playlist
- Change the `$MUSIC_OUTPUT_FOLDER` parameter to your desired music folder
- If necessary, change the `$PYTHON_EXEC` variable to your desired Python version (it needs to be compatible with setuptools. E.g. Python 3.10)

2. Run the script `downloadMusic.sh`

If you run into any issues please create an issue on this GitHub repository, and i'll try my best to help you.

