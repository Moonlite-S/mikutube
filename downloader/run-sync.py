"""Wrapper that monkey-patches input() before invoking the playlist downloader,
so interactive prompts never block in headless container runs."""

import builtins
import runpy
import sys


def _auto_input(prompt=""):
    # Echo the prompt to stdout so logs still show what was asked,
    # then return empty string (= "press Enter / take default").
    sys.stdout.write(prompt + "[auto: default]\n")
    sys.stdout.flush()
    return ""


builtins.input = _auto_input

# Run the tool as if invoked directly (preserves __name__ == "__main__" semantics)
runpy.run_path("/app/youtube_music_playlist_downloader.py", run_name="__main__")
