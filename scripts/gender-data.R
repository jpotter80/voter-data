# begin transforming the data for gender insights

# library(tidyverse) # was loaded from the console

# using data_renamed as the dataset
# Calculating gender distribution

gender_distribution <- data_renamed %>%
  group_by(Gender) %>%
  summarise(Count = n()) %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# Visualizing gender distribution

ggplot(gender_distribution, aes(x = "", y = Percentage, fill = Gender)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y") +
  theme_minimal() +
  labs(title = "Gender Distribution of Voters")

# This script groups the data by Gender, calculates the number of entries for each gender, and then calculates
# the percentage of each gender group, visualizing the distribution with a pie chart.
# saved the plot as a .png gender-dist.png
#
#
# Calculating gender distribution within each political party

gender_party_affiliation <- data_renamed %>%
  group_by(Gender, Party) %>%
  summarise(Count = n(), .groups = 'drop') %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# Visualizing gender influence on party affiliation

ggplot(gender_party_affiliation, aes(x = Party, y = Percentage, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Gender and Party Affiliation",
       x = "Party",
       y = "Percentage")

# This script groups the dataset by Gender and Party, calculates the number of voters in each group,
# and visualizes the influence of gender on party affiliation with a dodged bar chart.
# saved the plot as a .png gender-by-party.png
#
#
# this is a duplicate from the race-data.R file
# Calculating gender distribution within each racial group

gender_race_distribution <- data_renamed %>%
  group_by(Gender, Race) %>%
  summarise(Count = n(), .groups = 'drop')

# Visualizing gender distribution by race

ggplot(gender_race_distribution, aes(x = Race, y = Count, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Gender Distribution by Race",
       x = "Race",
       y = "Number of Voters")

# This script groups the dataset by Gender and Race, calculates the count for each group,
# and visualizes the gender distribution across racial groups with a dodged bar chart.
# saved the plot as a .png gender-by-race.png
#
#
# Ensure age groups are categorized if not done previously

data_renamed$AgeGroup <- cut(data_renamed$Age,
                     breaks = c(18, 30, 40, 50, 60, 70, 80, 90, 100),
                     labels = c("18-30", "31-40", "41-50", "51-60", "61-70", "71-80", "81-90", "91+"),
                     include.lowest = TRUE)

# Calculating gender distribution within each age group

gender_age_distribution <- data_renamed %>%
  group_by(Gender, AgeGroup) %>%
  summarise(Count = n(), .groups = 'drop')

# Visualizing gender distribution by age group
ggplot(gender_age_distribution, aes(x = AgeGroup, y = Count, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Gender Distribution by Age Group",
       x = "Age Group",
       y = "Number of Voters")

# This script first ensures ages are categorized into groups, then groups the dataset by Gender and AgeGroup,
# calculates the count for each group, and visualizes the gender distribution across age groups with a dodged bar chart.
# saved the plot as a .png gender-by-age.png
#
#


