# Assignment: American Community Survey Exercise
# Name: McKenzie A Payne
# Date: 2023-21-06

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_light())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/mcken/OneDrive/Desktop/dsc520/dsc520-1/data")


# Question 1: What are the elements in your data (including the categories and data types)
# Id: Categorical (Nominal) - Integer
# State: Categorical (Nominal) - String
# HSDegree: Categorical (Binary) - String
# Age: Categorical (Nominal) - Integer
#Income: Continuous (Ratio) - Integer


## Question 1.1:  Please provide the output from the following functions: str(); nrow(); ncol()
acse_dataset <- read.csv("acs-14-1yr-s0201.csv")
str(acse_dataset)
nrow(acse_dataset)
ncol(acse_dataset)

## Question 1.2: Create a Histogram of the HSDegree variable using the ggplot2 package.
### Set a bin size for the Histogram.
### Include a Title and appropriate X/Y axis labels on your Histogram Plot.
ggplot(acse_dataset, aes(HSDegree)) + geom_histogram(bins = 10) + ggtitle("2014 American Community Survey Data") + 
  xlab("High School Degree (%)") + ylab("Frequency (Count)")

## Question 1.3: Answer the following questions based on the Histogram produced:
# 1. Based on what you see in this histogram, is the data distribution unimodal? 
# Based on the Histogram results this only has two peaks making it bimodal
# 2. Is it approximately symmetrical? no
# 3. Is it approximately bell-shaped? no
# 4. Is it approximately normal? no
# 5. If not normal, is the distribution skewed? If so, in which direction? yes, positively skewed to the right
# 6. Include a normal curve to the Histogram that you plotted
ggplot(acse_dataset, aes(HSDegree)) + geom_histogram(aes(y=..density..), bins = 12, binwidth = 2.775, color = "black", fill = "white") +
  ggtitle("2014 American Community Survey Data") + xlab("High School Degree (%)") + ylab("Density") +
  stat_function(fun = dnorm, color="red", args=list(mean=mean(acse_dataset$HSDegree), sd=sd(acse_dataset$HSDegree)))
#7.Explain whether a normal distribution can accurately be used as a model for this data
# For this data set I do not believe a normal distribution would be appropriate due to the nature
# of this data being positively skewed. These data points distributed evenly enough around
# the mean to properly visual our data 

# Question 1.4: Create a Probability Plot of the HSDegree variable.
p <- ggplot(acse_dataset, aes(sample = HSDegree))
p + stat_qq()
p + stat_qq() + stat_qq_line()
# Question 1.5: Answer the following questions based on the Probability Plot:
# 1. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
# Based on the Probability Plot, this line skews from that of a straight line, so it is not an approximately normal
# distribution. 
# 2.If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
# Since this is not approximately normal we do not see the distribution displayed as symmetrical  meaning it is not
# even balanced around the center, we know this data has a skewed distribution to right due to the data deviating from a 
# straight line to the right hand side of t e plot.. 

## Question 1.6: Now that you have looked at this data visually for normality, you will now quantify normality 
# with numbers using the stat.desc() function. Include a screen capture of the results produced.
library(pastecs)
stat.desc(acse_dataset$HSDegree, basic = TRUE, desc = TRUE, norm = FALSE, p= 0.95)

# Question 1.7: In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores.
# Skew: With Skew measuring the symmetry of our distribution, in this chart we see our skew for HSDegree being at 0.77. 
# This indicates a right skew due to anything over 0  indicating a right skew, a 0 skew equaling symmetrical distribution, and 
# less than 0 equaling a left skew. These results reflect the findings we had come across in our probability plot as well. 
# Kurtosis: With the Kurtosis measuring -0.18 this shows us the measurements of this data is a flatter distribution than that
# of a normal one which would have been equal to 0. Kurtosis will show us the peakdness of our distribution for HSDegree.
# Z-Scores: With A Z-score indicating to us how many standard deviations a data point is from the mean of our data. A positive 
# score indicating above the means vs. a negative below the mean.
# In addition, explain how a change in the sample size may change your explanation? 
# Sample Size Impact: A change in our size whether by a couple data points or a ton will impact all of our results by
# making them become more precise where as if we decrease the size our results can become less precise giving us less 
# data to calculate our measurements form. This will impact not only the mean and stand deviation of our data but also 
# the skewness and kurtosis measurements as well since they are based on the distribution and shape of our data which 
# can change whether we add or take form the sample size. 

