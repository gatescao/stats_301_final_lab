library(lubridate)
library(magrittr)
library(tidyverse)

#load in data
spotify <- read_rds("data/spotify.rds")
top_200 <- spotify %>%
  filter(track_name %in% top_songs)

#summary statistics
summary(spotify)

#plot histograms for audio features
columns <- names(spotify)[c(9,10,12,14:20)]

#function that plots histograms for each audio feature
plot <- function(data, column) {
  ggplot(data, aes_string(x = column)) +
    geom_histogram(aes(y = ..density..), bins = 30, colour = "black", fill = "#56B4E9" ) +
    ggtitle(paste0("Histogram of ", column))
}

plots <- lapply(columns, plot, data = spotify)
plots_top_200 <- lapply(columns, plot, data = top_200)

#rankings
rank <- 

#correlation matrix
cor_mat <- spotify %>%
  select(danceability, energy, loudness, speechiness, acousticness, instrumentalness, liveness, 
         valence, tempo, duration_ms, track_popularity) %>%
  cor() %>%
  round(4)

require(corrplot)
corrplot(cor_mat, method = "circle")

#modeling
#train-test split
sample()

#regression model


