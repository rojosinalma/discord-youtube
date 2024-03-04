Discord YouTube Audio Streamer
---

This Ruby script enables a Discord bot to join a voice channel and play the audio from a specified YouTube video URL. It leverages the discordrb gem for interacting with Discord and uses youtube-dl and ffmpeg to fetch and stream the audio.

## Dependencies

* ruby 3+
* discordrb
* ffmpeg
* [youtube-dl](https://github.com/ytdl-org/ytdl-nightly/releases)
* libsodium
* libopus

## Setup

Install Ruby Dependencies: Run bundle install to install the required Ruby gems.

Install ffmpeg and youtube-dl: Ensure both ffmpeg and youtube-dl are installed and accessible in your system's PATH. These are required to fetch and process the YouTube video audio.

Discord Bot Token: You need to create a Discord bot on the Discord Developer Portal and obtain a bot token. Replace !REF_DISCORD_TOKEN in the script with your bot's token.

YouTube Video URL: The script is set up to play a specific YouTube video URL. Replace !REF_YOUTUBE_VIDEO_URL in the script with the desired YouTube video URL or modify the script to dynamically accept URLs.

## Usage

Start the Bot: Run the script with `ruby app.rb`. Ensure your bot is added to your Discord server and has permissions to join and speak in voice channels.

Play Audio in Discord: Use the `!play` command in a text channel where the bot has access. The bot will join the voice channel you're currently in and start playing the audio from the specified YouTube video.
