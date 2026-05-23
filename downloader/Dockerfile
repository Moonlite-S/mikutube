FROM python:3.12-slim

RUN apt-get update && \
  apt-get install -y --no-install-recommends ffmpeg git ca-certificates && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/onnowhere/youtube_music_playlist_downloader.git . && \
  pip install --no-cache-dir -r requirements.txt

COPY sync-all.sh /usr/local/bin/sync-all.sh
RUN chmod +x /usr/local/bin/sync-all.sh

CMD ["/usr/local/bin/sync-all.sh"]
