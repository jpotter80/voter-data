# begin transforming the data for race insights

# library(tidyverse) # was loaded from the console

# Using data_renamed as the dataset
# Calculating the racial composition

racial_composition <- data_renamed %>%
  group_by(Race) %>%
  summarise(Count = n()) %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# Visualizing the racial composition

ggplot(racial_composition, aes(x = "", y = Percentage, fill = Race)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y") +
  theme_minimal() +
  labs(title = "Racial Composition of Voters")

# This script groups the data by Race, counts the number of entries for each race, calculates
# the percentage of each racial group, and visualizes the distribution using a pie chart.
# saved the plot as a .png file racial-composition.png
#
#