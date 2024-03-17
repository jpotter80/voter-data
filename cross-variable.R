# begin transforming the data for geographic insights

# library(tidyverse) # was loaded from the console

# using data_renamed as the dataset
# Analyzing intersectionality of race, gender, and party affiliation

intersectionality_race_gender_party <- data_renamed %>%
  group_by(Race, Gender, Party) %>%
  summarise(Count = n(), .groups = 'drop') %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# Visualizing the intersectionality

ggplot(intersectionality_race_gender_party, aes(x = Race, y = Percentage, fill = Party)) +
  geom_bar(stat = "identity", position = "fill") +
  facet_wrap(~Gender) +
  theme_minimal() +
  labs(title = "Intersectionality of Race, Gender, and Party Affiliation",
       x = "Race",
       y = "Percentage")

# This script groups the dataset by Race, Gender, and Party, then calculates the count and percentage of voters
# in each intersectional category. It visualizes these relationships using a stacked bar chart, normalized by the 'fill'
# position to show percentage distribution within each gender facet, offering a clear view of how these demographic factors
# intersect in relation to political affiliation.
# saved the plot as a .png file intersectionality.png
#
#
# Analyzing demographics by combining age, gender, and race

age_gender_race_combination <- data_renamed %>%
  group_by(AgeGroup, Gender, Race) %>%
  summarise(Count = n(), .groups = 'drop') %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# Visualizing the combination of age, gender, and race

ggplot(age_gender_race_combination, aes(x = AgeGroup, y = Percentage, fill = Race)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~Gender) +
  theme_minimal() +
  labs(title = "Demographics by Age, Gender, and Race",
       x = "Age Group",
       y = "Percentage")

# This script groups the dataset by AgeGroup, Gender, and Race to explore the intricate demographic patterns that emerge
# from their combination. It calculates the count and percentage of voters within each category, visualizing the data
# with dodged bar charts within gender facets. This approach highlights the nuanced demographic variations across age groups
# and racial categories, differentiated by gender, offering comprehensive insights into the dataset's complex demographic landscape.
# saved the plot as a .png file combination.png
#
#


