require 'discordrb'
require 'open3'

# Function to get the direct audio URL from a YouTube video
def get_youtube_audio_url(youtube_url)
  command = "youtube-dl -f bestaudio --get-url #{youtube_url}"
  stdout, stderr, status = Open3.capture3(command)

  if status.success?
    stdout.strip
  else
    raise "Failed to get audio URL: #{stderr}"
  end
end

# Discord bot setup
bot = Discordrb::Bot.new token: '!REF_DISCORD_TOKEN'

bot.message(with_text: '!play') do |event|
  # Example YouTube video URL (you could also parse this from the message)
  youtube_url = '!REF_YOUTUBE_VIDEO_URL'

  begin
    audio_url = get_youtube_audio_url(youtube_url)

    # Join the user's voice channel
    channel = event.user.voice_channel
    next "You're not in any voice channel!" unless channel
    bot.voice_connect(channel)

    voice_bot = event.voice

    # Use ffmpeg to stream the audio URL to Discord
    voice_bot.play_io(IO.popen("ffmpeg -i '#{audio_url}' -f wav -", err: :out))

    "Now playing audio from: #{youtube_url}"
  rescue => e
    "Error: #{e.message}"
  end
end

bot.run
