#API request
Sys.setenv(SPOTIFY_CLIENT_ID = "97d579ddf63140a5adf8a992b1d98a70")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "23eb092bb89f408d8023a3523305b475")

library(rvest)
library(magrittr)
library(stringr)

#main url
spotify_charts <- read_html(x = "https://spotifycharts.com/regional/global/daily/latest")

#scrape the names of the top artists
top_artists <- spotify_charts %>% 
  html_node("#content > div > div > div > span > table > tbody") %>%
  html_children() %>%
  html_nodes("span")

str_extract(top_artists, pattern = "")

#extract audio features from Spotify API    
spotify_df <- get_artist_audio_features('radiohead')
