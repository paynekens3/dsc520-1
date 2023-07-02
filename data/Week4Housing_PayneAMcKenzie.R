# Assignment: Week 4: Housing Dataset Exercise
# Name: Payne, McKenzie
# Date: 2023-06-29

setwd('C:/Users/mcken/OneDrive/Desktop/dsc520/dsc520-1/data')
library(plyr)
library(ggplot2)
theme_set(theme_light())
options(scipen = 999)

# Question 1: Use the apply function on a variable in your dataset
apply(house_dataset[, 14, drop = F], 2, mean)

# Question 2: Use the aggregate function on a variable in your dataset
aggregate(square_feet_total_living ~ bedrooms, house_dataset, mean)

# Question 3: Use the plyr function on a variable in your dataset
## Split some data, perform a modification to the data, and then bring it back together
modified_data <- ddply(house_dataset, "prop_type", transform, renovated_year_diff = 2023 - year_renovated)
modified_data

# Question 4: Check distributions of the data
ggplot(house_dataset, aes(x = `Sale Price`)) +
  geom_histogram(binwidth = 50000, fill = "pink", color = "white") +
  labs(title = "Distribution of Sale Price")

# Question 5: Identify if there are any outliers
outliers <- boxplot.stats(house_dataset$`Sale Price`)$out
outliers

# Question 6: Create at least 2 new variables
house_dataset$age <- 2023 - house_dataset$year_built
house_dataset$bed_bath_ratio <- house_dataset$bedrooms / (house_dataset$bath_full_count + house_dataset$bath_half_count + house_dataset$bath_3qtr_count)
head(house_dataset)