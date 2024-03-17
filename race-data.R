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
# Explore voting behavior by race

race_voting_behavior <- data_renamed %>%
  group_by(Race, Party) %>%
  summarise(Count = n(), .groups = 'drop') %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# Visualizing voting behavior by race

ggplot(race_voting_behavior, aes(x = Race, y = Percentage, fill = Party)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Voting Behavior by Race",
       x = "Race",
       y = "Percentage")

# This script groups the dataset by Race and Party, calculates the number of voters in each group,
# and visualizes the distribution of voting behavior across different races with a dodged bar chart.
# saved the plot as a .png file voting-by-race.png
#
#
# Categorizing age into groups if not already done
data$AgeGroup <- cut(data$Age,
                     breaks = c(18, 30, 40, 50, 60, 70, 100),
                     labels = c("18-30", "31-40", "41-50", "51-60", "61-70", "71+"),
                     include.lowest = TRUE)

# Calculating age distribution by race

race_age_distribution <- data_renamed %>%
  group_by(Race, AgeGroup) %>%
  summarise(Count = n(), .groups = 'drop')

# Visualizing age distribution within racial groups

ggplot(race_age_distribution, aes(x = Race, y = Count, fill = AgeGroup)) +
  geom_bar(stat = "identity", position = "stack") +
  theme_minimal() +
  labs(title = "Age Distribution by Race",
       x = "Race",
       y = "Number of Voters")

# This script first ensures age is categorized into groups, then calculates and visualizes the
# age distribution within each racial group using a stacked bar chart for detailed analysis.
# saved the plot as a .png file age-by-race.png
#
#
# Calculating gender distribution by race

race_gender_distribution <- data_renamed %>%
  group_by(Race, Gender) %>%
  summarise(Count = n(), .groups = 'drop')

# Visualizing gender distribution within racial groups

ggplot(race_gender_distribution, aes(x = Race, y = Count, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Gender Distribution by Race",
       x = "Race",
       y = "Number of Voters")

# This script groups the dataset by Race and Gender, calculates the count for each group,
# and visualizes the gender distribution across races with a dodged bar chart.
# saved the plot as a .png gender-by-race.png
#
#
# Calculating race distribution by zip code

race_zip_distribution <- data_renamed %>%
  group_by(Zip, Race) %>%
  summarise(Count = n(), .groups = 'drop')

# This can result in a large number of combinations; consider visualizing top zip codes or using a heatmap
# Here is an example with a simple plot, but consider more complex visualizations for detailed analysis
# Visualizing race distribution by zip code (simplified example)

ggplot(race_zip_distribution, aes(x = Zip, y = Count, fill = Race)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Race Distribution by Zip Code",
       x = "Zip Code",
       y = "Number of Voters") +
  scale_fill_brewer(palette = "Set3")

# This script groups the dataset by Zip and Race to calculate the count of voters for each race within each zip code.
# Given the potentially large number of zip codes, the plot uses dodged bars to show the racial composition within zip codes.
# The x-axis labels are rotated for better readability. Consider filtering for top zip codes or specific areas of interest
# for a clearer visualization or using more complex visualizations like heatmaps for detailed analysis across many zip codes.
# saved the plot as a .png race-by-zip.png
#
#


       
