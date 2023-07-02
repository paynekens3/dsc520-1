# Assignment: Week 4 - Test Scores Exercise
# Name: Payne, McKenzie
# Date: 2023-06-29

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/mcken/OneDrive/Desktop/dsc520/dsc520-1/data")

# Question 1.1: What are the observational units in this study?
## Answer: The observational units compare the performance of students by 
## course grades and total points earned in chosen course
scores_dataset <- read.csv("scores.csv")
scores_dataset

# Question 1.2: Identify the variables mentioned in the narrative paragraph and
## determine which are categorical and quantitative?
## Categorical: Section( Sports vs Regular)
## Quantitative: Score (Points earned in Course)

# Question 1.3: Create one variable to hold a subset of your data set that 
# contains only the Regular Section and one variable for the Sports Section.
library(dplyr)
select(scores_dataset, "Section")
section_regular <- filter(scores_dataset, Section == "Regular")
section_sports <- filter(scores_dataset, Section == "Sports")
section_regular
section_sports

# Question 1.4: Use the Plot function to plot each Sections scores and the 
# number of students achieving that score.Use additional Plot Arguments to label
# the graph and give each axis an appropriate label. Once you have produced your 
# Plots answer the following questions:

library(ggplot2)
theme_set(theme_light())

ggplot(section_regular, aes(Score, Count)) + geom_point(color = "pink") + ggtitle("Test Scores: Regular")
ggplot(section_sports, aes(Score, Count)) + geom_point(color = "pink") + ggtitle("Test Scores: Sports")

ggplot(section_regular, aes(x = Score)) + geom_histogram(bins = 6, color = "purple", fill = "pink") + ggtitle("Test Scores: Regular") + 
  xlab("Score") + ylab("Count")
ggplot(section_sports, aes(x = Score)) + geom_histogram(bins = 6, color = "purple", fill = "pink") + ggtitle("Test Scores: Sports") + 
  xlab("Score") + ylab("Count")
        
# Question 1.5: Comparing and contrasting the point distributions between the 
# two section, looking at both tendency and consistency: Can you say that one 
# section tended to score more points than the other? Justify and explain your 
# answer. 
## Comparing these two data sets we can see clearly that the Sports Section has
## had a tendency to score more points on assignments vs the Regular Section. If
## you look at the graph you can see more points of our data set for Sports are 
## in the higher range of scores compared to the Regular section more 
## consistently. The general range of scores were higher as well compared to the
## Regular ection. 

# Question 1.6: Did every student in one section score more points than every 
# student in the other section? If not, explain what a statistical tendency 
# means in this context.
## No every student in either section did not score more than the other section.
##  A statistical tendency can essentially be a general pattern/trend that does 
## not apply to every individual case in our data set. Here we can see although
## the sports section average may be higher than th average of the Regular 
## section, this just indicates this section may have a tendency to score higher 
## however this does not imply that this section has every student scoring higher
## then the other section.

# Question 1.7: What could be one additional variable that was not mentioned in 
# the narrative that could be influencing the point distributions between the 
# two sections?
## A variable could have been with the students knowing they were signing up
## for a class using sports application this could have attracted more sports
## fans making the motivation/interest a lot higher than in the regular section
## creating more of a drive in the assignments leading to higher scores. 