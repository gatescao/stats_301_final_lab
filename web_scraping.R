#API request
Sys.setenv(SPOTIFY_CLIENT_ID = "97d579ddf63140a5adf8a992b1d98a70")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "23eb092bb89f408d8023a3523305b475")

spotify_df <- get_artist_audio_features('radiohead')
