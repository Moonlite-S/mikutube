#!/bin/sh
set -e
SYNC_INTERVAL="${SYNC_INTERVAL:-3600}"

while true; do
  echo "[$(date -Iseconds)] Starting playlist sync..."
  for dir in /music/*/; do
    if [ -f "${dir}.playlist_config.json" ]; then
      echo ">> Syncing: $dir"
      ( cd "$dir" && python /app/youtube_music_playlist_downloader.py ) || \
        echo "!! Failed: $dir (continuing)"
    fi
  done
  echo "[$(date -Iseconds)] Sync complete. Sleeping ${SYNC_INTERVAL}s..."
  sleep "$SYNC_INTERVAL"
done
