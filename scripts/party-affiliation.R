# begin transforming the data for party affiliation

# library(tidyverse) # was loaded from the console

# Using data_renamed as the dataset
# Calculate the distribution of party affiliation

party_distribution <- data_renamed %>%
  group_by(Party) %>%
  summarise(Count = n()) %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# Visualize the distribution

ggplot(party_distribution, aes(x = Party, y = Count, fill = Party)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Distribution of Party Affiliation",
       x = "Party",
       y = "Number of Voters")

# This script groups the dataset by the Party column, then counts the number of voters in each party,
# calculates the percentage, and finally visualizes the distribution using a bar chart.
# saved the plot as a .png file party-dist-new.png
#
#
# Calculate the distribution of party affiliation by race

party_by_race <- data_renamed %>%
  group_by(Race, Party) %>%
  summarise(Count = n(), .groups = 'drop') %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# Visualize the distribution

ggplot(party_by_race, aes(x = Race, y = Count, fill = Party)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Party Affiliation by Race",
       x = "Race",
       y = "Number of Voters")

# This script groups the dataset by both Race and Party, counts the voters in each category,
# calculates percentages, and visualizes the distribution across races with a dodged bar chart.
# saved the plot as a .png file party-by-race.png
#
#
# Calculate the distribution of party affiliation by gender

party_by_gender <- data_renamed %>%
  group_by(Gender, Party) %>%
  summarise(Count = n(), .groups = 'drop') %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# Visualize the distribution

ggplot(party_by_gender, aes(x = Gender, y = Count, fill = Party)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Party Affiliation by Gender",
       x = "Gender",
       y = "Number of Voters")

# This script groups the dataset by Gender and Party, calculates the number of voters in each group,
# and visualizes the distribution with a dodged bar chart to show gender distribution within parties.
# saved the plot as a .png file party-by-gender.png
#
#
# You might first need to categorize the 'Age' into groups

data_renamed$AgeGroup <- cut(data_renamed$Age,
                     breaks = c(18, 30, 40, 50, 60, 70, 100),
                     labels = c("18-30", "31-40", "41-50", "51-60", "61-70", "71+"),
                     include.lowest = TRUE)

# Calculate the distribution of party affiliation by age groups

party_by_age <- data_renamed %>%
  group_by(AgeGroup, Party) %>%
  summarise(Count = n(), .groups = 'drop') %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

# Visualize the distribution

ggplot(party_by_age, aes(x = AgeGroup, y = Count, fill = Party)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Party Affiliation by Age Group",
       x = "Age Group",
       y = "Number of Voters")

# This script first categorizes ages into groups, then calculates and visualizes the distribution
# of party affiliation within each age group using a dodged bar chart.
# saved the plot as a .png file party-by-age.png
#
#
# Calculate the distribution of party affiliation by school district

party_by_school_dist <- data_renamed %>%
  group_by(School_Dist, Party) %>%
  summarise

# Print tibble of the distribution
print(party_by_school_dist)

# Visualize the distribution

ggplot(party_by_school_dist, aes(x = School_Dist, y = Count, fill = Party)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Party Affiliation by School District",
       x = "School District",
       y = "Number of Voters")

# This script groups the dataset by School_Dist and Party, calculates the number of voters in each group,
# and visualizes the distribution with a dodged bar chart to show party affiliation within school districts.
# saved the plot as a .png file party-by-school-dist.png
            

