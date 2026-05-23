# Miku Tube

My own personal local Music stack. The files in the Downloader folder are AI generated to help automate the [youtube_music_playlist_downloader](https://github.com/onnowhere/youtube_music_playlist_downloader) script. That means, you, the fucking guy that made this, make sure to rewrite this or remake this yourself eventually.

## Stack

- [Navidrome](https://www.navidrome.org/docs/overview/) - Music Backend
- [youtube_music_playlist_downloader](https://github.com/onnowhere/youtube_music_playlist_downloader) - Downloads Playlists
- [ytdl-sub](https://ytdl-sub.readthedocs.io/en/latest/index.html) - Another Way to Download Music

## Frontend Clients (Not Included)

- [feishin](https://github.com/jeffvli/feishin) - A Navidrome frontend client
  - Discord Rich Presence [Addon](https://github.com/lazykern/mprisence)
- [ratune](https://github.com/acmagn/ratune) - A TUI Media Player
- [Navic](https://navic.app/) - An android frontend client

## TODO

- Fix music meta data by downloding as much of the songs on ytdl-sub. (youtube_music_playlist_downloader messes up the playlist album meta data)

- Get spotify downloader

## Why Two Youtube Scrapers?

[youtube_music_playlist_downloader](https://github.com/onnowhere/youtube_music_playlist_downloader) makes it easy to download my personal playlists right off rip, however, the playlist will count as an entire album, which isn't really what I want long term.

[ytdl-sub](https://ytdl-sub.readthedocs.io/en/latest/index.html) makes it so you can download artist's music with all their metadata as accurate as it can. (Assuming you're downloading from their @release tab or from an album playlist)
