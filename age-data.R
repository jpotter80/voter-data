# begin transforming the data for gender insights

# library(tidyverse) # was loaded from the console

# using data_renamed as the dataset
# analyzing the age distribution

# tried this first, corrected by copilot, but still not working
# age_distribution <- data %>%
#   ggplot(aes(x = Age)) +
#   geom_histogram(binwidth = 5, fill = "blue", color = "black") +
#   theme_minimal() +
#   labs(title = "Age Distribution of Voters", x = "Age", y = "Frequency")

#tried this next, but need to change to data_renamed
# analyzing the age distribution
# age_distribution <- ggplot(data, aes(x = Age)) +
#   geom_histogram(binwidth = 5, fill = "blue", color = "black") +
#   theme_minimal() +
#   labs(title = "Age Distribution of Voters", x = "Age", y = "Frequency")

# analyzing the age distribution
age_distribution <- ggplot(data_renamed, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Age Distribution of Voters", x = "Age", y = "Frequency")

# print the plot
age_distribution

# this script visualizes the age distribution of the dataset using a histogram # the binwidth is set to 5 years
# to group the ages meaningfully while avoiding too much granularity or overgeneralization #
# saved the plot as a .png file age-dist.png
#
#
# Grouping by Age and Party to analyze distribution

age_party_affiliation <- data_renamed %>%
  group_by(Party) %>%
  mutate(AgeGroup = cut(Age, breaks = c(18, 30, 40, 50, 60, 70, 100),
                        labels = c("18-30", "31-40", "41-50", "51-60", "61-70", "71+"))) %>%
  count(Party, AgeGroup) %>%
  ungroup() %>%
  ggplot(aes(x = AgeGroup, y = n, fill = Party)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Age and Party Affiliation", x = "Age Group", y = "Number of Voters")

# Print the plot
age_party_affiliation

# This script first categorizes ages into groups, then counts the number of voters in each age group and party,
# and visualizes the results with a dodged bar chart, providing insights into how age might influence party affiliation.
# saved the plot as a .png file age-party.png
#
#
# Calculating age distribution within each gender

data_renamed %>%
  ggplot(aes(x = Age, fill = Gender)) +
  geom_histogram(binwidth = 5, position = "dodge") +
  theme_minimal() +
  labs(title = "Age Distribution by Gender", x = "Age", y = "Frequency")

# This script uses a histogram with a dodge position to visualize the age distribution separately for each gender.
# The binwidth is again set to 5 to maintain consistency in age grouping across analyses.
# saved the plot as a .png file age-by-gender.png
#
#
# this script is a duplicate viz of age-race-dist.png
# Grouping by Race and analyzing age distribution

data_renamed %>%
  ggplot(aes(x = Age, fill = Race)) +
  geom_histogram(binwidth = 5, position = "dodge") +
  theme_minimal() +
  labs(title = "Age Distribution by Race", x = "Age", y = "Frequency")

# This script creates a histogram to visualize the age distribution for each racial group separately,
# with a dodge position to clearly distinguish between the races. The choice of a 5-year binwidth
# ensures that age distribution is analyzed consistently across different demographic groups.
# saved the plot as a .png file age-by-race.png
#
#