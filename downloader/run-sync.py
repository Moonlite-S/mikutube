"""Wrapper that monkey-patches input() before invoking the playlist downloader.
Returns empty string ("press Enter / default") to all prompts, EXCEPT the
post-sync 'return to main menu' prompt, which we treat as our cue to exit."""

import builtins
import runpy
import sys

# Substrings that, when found in a prompt, mean the sync is done and we should
# exit cleanly instead of looping back to the main menu.
_EXIT_TRIGGERS = (
    "return to main menu",
    "close this window",
)


def _auto_input(prompt=""):
    sys.stdout.write(prompt + "[auto: default]\n")
    sys.stdout.flush()

    prompt_lower = prompt.lower()
    if any(trigger in prompt_lower for trigger in _EXIT_TRIGGERS):
        print("[wrapper] sync complete, exiting Python cleanly", flush=True)
        sys.exit(0)

    return ""


builtins.input = _auto_input

runpy.run_path("/app/youtube_music_playlist_downloader.py", run_name="__main__")
