#!/bin/sh
SYNC_INTERVAL="${SYNC_INTERVAL:-3600}"

trap 'echo "[$(date -Iseconds)] Received signal, exiting loop"; exit 0' INT TERM

echo "[$(date -Iseconds)] sync-all.sh starting, interval=${SYNC_INTERVAL}s"

while true; do
  echo "[$(date -Iseconds)] === Sync cycle start ==="
  found_any=0
  for dir in /music/*/; do
    [ -d "$dir" ] || continue
    if [ -f "${dir}.playlist_config.json" ]; then
      found_any=1
      echo "[$(date -Iseconds)] >> Syncing: $dir"
      ( cd "$dir" && python /app/run-sync.py )
      echo "[$(date -Iseconds)] >> Finished (exit $?): $dir"
    fi
  done
  if [ "$found_any" = "0" ]; then
    echo "[$(date -Iseconds)] No playlist folders found under /music/"
  fi
  echo "[$(date -Iseconds)] === Sync cycle complete, sleeping ${SYNC_INTERVAL}s ==="
  sleep "$SYNC_INTERVAL" || echo "[$(date -Iseconds)] sleep was interrupted: exit $?"
done
