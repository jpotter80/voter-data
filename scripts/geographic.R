# begin transforming the data for geographic insights

# library(tidyverse) # was loaded from the console

# using data_renamed as the dataset
# Calculating voter distribution by zip code

voter_distribution_zip <- data_renamed %>%
  group_by(Zip) %>%
  summarise(Count = n()) 

# Visualizing voter distribution across zip codes

ggplot(voter_distribution_zip, aes(x = Zip, y = Count)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Voter Distribution by Zip Code", x = "Zip Code", y = "Number of Voters")

# This script groups the dataset by Zip code, counts the number of voters in each, and visualizes the distribution
# using a bar chart. The x-axis labels are rotated for better readability.
# saved the plot as a .png file voter-by-zip.png
#
#
# Analyzing party affiliation by zip code

party_affiliation_zip <- data_renamed %>%
  group_by(Zip, Party) %>%
  summarise(Count = n(), .groups = 'drop')

# Visualizing party affiliation by zip code

ggplot(party_affiliation_zip, aes(x = Zip, y = Count, fill = Party)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Party Affiliation by Zip Code", x = "Zip Code", y = "Number of Voters")

# This script groups the dataset by Zip and Party, calculates the number of voters in each category,
# and visualizes the distribution using a dodged bar chart for clear comparison between parties within zip codes.
# saved the plot as a .png file party-by-zip.png
#
#
# this is a duplicate of race-zip-comp.png
# Calculating racial composition by zip code

racial_composition_zip <- data_renamed %>%
  group_by(Zip, Race) %>%
  summarise(Count = n(), .groups = 'drop')

# Visualizing racial composition by zip code

ggplot(racial_composition_zip, aes(x = Zip, y = Count, fill = Race)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Racial Composition by Zip Code", x = "Zip Code", y = "Number of Voters")

# This script groups the data by Zip and Race, calculates the count of voters for each race within each zip code,
# and visualizes the racial composition using a dodged bar chart for easy comparison across races within zip codes.
# saved the plot as a .png race-by-zip.png
#
#
# Analyzing demographic patterns by school district

demographic_patterns_school <- data_renamed %>%
  group_by(School_Dist, Race, Gender, Party) %>%
  summarise(Count = n(), .groups = 'drop')

# Visualizing demographic patterns in school districts (example for race)

ggplot(demographic_patterns_school, aes(x = School_Dist, y = Count, fill = Race)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Demographic Patterns by School District - Race", x = "School District", y = "Number of Voters")

# This script provides a template for analyzing demographic patterns within school districts. The example focuses
# on race, but you can adjust the `aes` (aesthetic mappings) for gender or party affiliation as needed.
# It groups the dataset by School_Dist along with other demographic variables, calculates the count,
# and visualizes the patterns using a bar chart. Adjust the fill aesthetic and facet the plot for more detailed analysis.
# saved the plot as a .png file demo-by-school.png
#
#


