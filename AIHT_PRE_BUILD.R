
#install.packages("dplyr")
#library(dplyr)
##install.packages("tidyverse")
#library(ggplot2)
# Read the CSV file into a data frame
df <- read.csv("~/Desktop/AIHT2/states.csv")

# Now, you can use glimpse() function
glimpse(df)

# Cleaning 
jkdf = df[df$state_name == 'UTTAR PRADESH', ]
jkdf

# Plotting

# Population
ggplot(jkdf, aes(x = name_of_city, y = population_total)) +
  geom_bar(stat = "identity", fill = "blue") +  # Create the bar graph
  labs(x = "City", y = "Population", title = "Population of Cities") +  # Add labels and title
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) # Rotate x-axis labels if needed


# Summarize population data for each city
city_summary <- aggregate(population_total ~ name_of_city, data = jkdf, FUN = sum)

# Create pie chart
ggplot(city_summary, aes(x = "", y = population_total, fill = name_of_city)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  labs(fill = "City") +
  theme_void() +
  theme(legend.position = "right") +
  guides(fill = guide_legend(title = "City"))

# Bubble plot
ggplot(jkdf, aes(x = name_of_city, y = population_total, size = total_graduates)) +
  geom_point(color = "green", alpha = 0.6) +
  labs(x = "City", y = "Population", title = "Population of Cities wrt Graduates (Bubble Plot)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

ggplot(jkdf, aes(x = name_of_city, y = population_total, size = effective_literacy_rate_total)) +
  geom_point(color = "brown", alpha = 0.6) +
  labs(x = "City", y = "Population", title = "Population of Cities wrt Literacy Rates (Bubble Plot)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 



# Create the circular plot
ggplot(jkdf, aes(x = name_of_city, y = population_total, fill = name_of_city)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  labs(x = NULL, y = NULL, title = "Population of Cities (Circular Barplot)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

# Male Population

ggplot(jkdf, aes(x = name_of_city, y = population_male)) +
  geom_bar(stat = "identity", fill = "skyblue") +  # Create the bar graph
  labs(x = "City", y = "Population", title = "Population of Cities") +  # Add labels and title
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels if needed

# Summarize population data for each city
city_summary <- aggregate(population_male ~ name_of_city, data = jkdf, FUN = sum)

# Create pie chart
ggplot(city_summary, aes(x = "", y = population_male, fill = name_of_city)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  labs(fill = "City") +
  theme_void() +
  theme(legend.position = "right") +
  guides(fill = guide_legend(title = "City"))

# Female Population

ggplot(jkdf, aes(x = name_of_city, y = population_female)) +
  geom_bar(stat = "identity", fill = "pink") +  # Create the bar graph
  labs(x = "City", y = "Population", title = "Population of Cities") +  # Add labels and title
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels if needed

# Summarize population data for each city
city_summary <- aggregate(population_female ~ name_of_city, data = jkdf, FUN = sum)

# Create pie chart
ggplot(city_summary, aes(x = "", y = population_female, fill = name_of_city)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  labs(fill = "City") +
  theme_void() +
  theme(legend.position = "right") +
  guides(fill = guide_legend(title = "City"))

# Male vs Female population

males <- sum(jkdf$population_male)
females <- sum(jkdf$population_female)

# Bar graph
maleFemaledf <- data.frame(Gender = c("Females", "Males"),
                           Population = c(females, males))

# Plot for bar graph
ggplot(maleFemaledf, aes(x = Gender, y = Population, fill = Gender)) +
  geom_bar(stat = "identity") +
  labs(x = "Gender", y = "Population", title = "Population by Gender (Bar Graph)")

# Create pie chart
ggplot(maleFemaledf, aes(x = "", y = Population, fill = Gender)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  labs(fill = "City") +
  theme_void() +
  theme(legend.position = "right") +
  guides(fill = guide_legend(title = "City"))

# literacy

ggplot(jkdf, aes(x = name_of_city, y = effective_literacy_rate_total)) +
  geom_bar(stat = "identity", fill = "red") +  # Create the bar graph
  labs(x = "City", y = "Population", title = "Population of Cities") +  # Add labels and title
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels if needed

# Male Population

ggplot(jkdf, aes(x = name_of_city, y = effective_literacy_rate_male)) +
  geom_bar(stat = "identity", fill = "blue") +  # Create the bar graph
  labs(x = "City", y = "Literacy Rate", title = "Population of Cities") +  # Add labels and title
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels if needed

# Female Population

ggplot(jkdf, aes(x = name_of_city, y = effective_literacy_rate_female)) +
  geom_bar(stat = "identity", fill = "pink") +  # Create the bar graph
  labs(x = "City", y = "Literacy Rate", title = "Literacy rates") +  # Add labels and title
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels if needed


# Male vs Female population

males <- sum(jkdf$effective_literacy_rate_male)/nrow(jkdf)
females <- sum(jkdf$effective_literacy_rate_female)/nrow(jkdf)

# Bar graph
maleFemaledf <- data.frame(Gender = c("Females", "Males"),
                           effective_literacy_rate = c(females, males))

# Plot for bar graph
ggplot(maleFemaledf, aes(x = Gender, y = effective_literacy_rate, fill = Gender)) +
  geom_bar(stat = "identity") +
  labs(x = "Gender", y = "Literacy Rate", title = "Literates by Gender (Bar Graph)")


# Education

ggplot(jkdf, aes(x = name_of_city, y = total_graduates)) +
  geom_bar(stat = "identity", fill = "red") +  # Create the bar graph
  labs(x = "City", y = "Education", title = "Education of Cities") +  # Add labels and title
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels if needed

# Bubble plot
ggplot(jkdf, aes(x = name_of_city, y = total_graduates, size = total_graduates)) +
  geom_point(color = "red", alpha = 0.6) +
  labs(x = "City", y = "Population", title = "Education of Cities (Bubble Plot)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

# Male Population

ggplot(jkdf, aes(x = name_of_city, y = male_graduates)) +
  geom_bar(stat = "identity", fill = "skyblue") +  # Create the bar graph
  labs(x = "City", y = "Graduates", title = "Graduates in Cities") +  # Add labels and title
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels if needed

# Summarize population data for each city
city_summary <- aggregate(male_graduates ~ name_of_city, data = jkdf, FUN = sum)

# Female Population

ggplot(jkdf, aes(x = name_of_city, y = female_graduates)) +
  geom_bar(stat = "identity", fill = "pink") +  # Create the bar graph
  labs(x = "City", y = "Graduates", title = "Female Graduates in Cities") +  # Add labels and title
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels if needed

# Summarize population data for each city
city_summary <- aggregate(female_graduates ~ name_of_city, data = jkdf, FUN = sum)

# Create pie chart
ggplot(city_summary, aes(x = "", y = female_graduates, fill = name_of_city)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  labs(fill = "City") +
  theme_void() +
  theme(legend.position = "right") +
  guides(fill = guide_legend(title = "City"))

# Male vs Female population

males <- sum(jkdf$male_graduates)
females <- sum(jkdf$female_graduates)

# Bar graph
maleFemaledf <- data.frame(Gender = c("Females", "Males"),
                           Population = c(females, males))

# Plot for bar graph
ggplot(maleFemaledf, aes(x = Gender, y = Population, fill = Gender)) +
  geom_bar(stat = "identity") +
  labs(x = "Gender", y = "Graduates", title = "Graduates by Gender (Bar Graph)")

