# Assignment: Week 5: Housing Dataset Exercise
# Name: Payne, McKenzie
# Date: 2023-07-05

setwd('C:/Users/mcken/OneDrive/Desktop/dsc520/dsc520-1/data')
house_dataset <- readxl::read_xlsx("week-7-housing.xlsx")
house_dataset

## Question 1: Using the dplyr package, use the 6 different operations to 
## analyze/transform the data - GroupBy, Summarize, Mutate, Filter, Select, and 
## Arrange – Remember this isn’t just modifying data, you are learning about 
## your data also, so play around/start to understand your dataset in more detail

library(dplyr)
library(magrittr)
library(purrr)

## GroupBy
house_dataset %>% dplyr::group_by(building_grade)
## Summarize
house_dataset %>% summarize(avg_price = mean(`Sale Price`),median_price = median(`Sale Price`))
## Mutate
house_dataset %>% dplyr::mutate((`Sale Price`)/square_feet_total_living)
## Filter
house_dataset %>% dplyr::filter(zip5 == "98074")
## Select
house_dataset %>% dplyr::select((`Sale Price`), bedrooms, square_feet_total_living)
## Arrange
house_dataset %>% dplyr::arrange(year_built)

## Question 2: Using the purrr package – perform 2 functions on your dataset. 
# You could use zip_n, keep, discard, compact, etc.
purrr::map(house_dataset, is.numeric)
house_dataset %>% purrr::pluck(7)


##Question3 : Use the cbind and rbind function on your dataset
house_bed <- c("0", "1", "2", "3", "4")
house_full_bath <- c("0", "1", "2", "3", "4")
house_half_bath <- c("0", "1", "2", "3", "4")
house_bed_fullbath <- cbind(house_bed, house_full_bath)
house_bed_fullbath
house_bed_halfbath <- cbind(house_bed, house_half_bath)
house_bed_halfbath
house_type <- rbind(house_bed_fullbath, house_bed_halfbath)
house_type


##Quesion 4: Split a string, then concatenate the results back together
house_address_example <- house_dataset %>% purrr::pluck(7, 1)
strsplit(house_address_example, " ")
paste0(house_dataset %>% purrr::pluck(7, 1), collapse = " ")
