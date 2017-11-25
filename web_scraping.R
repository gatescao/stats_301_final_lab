#API request
Sys.setenv(SPOTIFY_CLIENT_ID = "97d579ddf63140a5adf8a992b1d98a70")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "23eb092bb89f408d8023a3523305b475")

library(rvest)
library(magrittr)
library(stringr)
library(tidyverse)
library(spotifyr)
library(purrr)

#main url
spotify_charts <- read_html(x = "https://spotifycharts.com/regional/global/daily/latest")

#scrape the names of the top artists
top_artists <- spotify_charts %>% 
  html_node("#content > div > div > div > span > table > tbody") %>%
  html_children() %>%
  html_nodes("span") %>%
  str_replace(pattern = "<span>by ", "") %>%
  str_replace(pattern = "</span>", "") %>%
  unique()

#scrape the Top 200 songs
top_songs <- spotify_charts %>% 
  html_node("#content > div > div > div > span > table > tbody") %>%
  html_children() %>%
  html_nodes("strong") %>%
  str_replace(pattern = "<strong>", "") %>%
  str_replace(pattern = "</strong>", "") %>%
  str_replace(pattern = "&amp;", "&")

#extract audio features from Spotify API
spotify_df <- map(top_artists, function(x){
  tryCatch(
  get_artist_audio_features(x),
  error = function(e){NA}
  )
})

#combine the dataframes and remove missing values
spotify <- do.call("rbind", spotify_df) 
spotify <- spotify %>% filter(track_name != "NA")

#save spotify as a rds file
saveRDS(spotify, file = "spotify.rds")



  
  