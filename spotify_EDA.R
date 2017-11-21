#Load in data
spotify <- read_rds("data/spotify.rds")

top_200 <- spotify %>%
  filter(track_name %in% top_songs)

#
spotify %>%
  ggplot(aes(x = danceability)) +
  geom_histogram(aes(y = ..count..), bins = 30, colour = "black", fill = "#56B4E9" ) +
  scale_x_continuous(name = "Danceability") +
  ggtitle("Histogram of danceability")

spotify %>%
  ggplot(aes(x = energy)) +
  geom_histogram(aes(y = ..count..), bins = 30, colour = "black", fill = "#56B4E9" ) +
  scale_x_continuous(name = "Energy") +
  ggtitle("Histogram of energy")