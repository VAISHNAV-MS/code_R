# exploring data in R

library(tidyverse
        )
data()
?starwars
dim(starwars)  # gives the # rows and coln  and obs

str(starwars)  # structure of the df
# the problem is that this is very messy
# these are lists

glimpse(starwars)  # so we use this instead 
# givves the var, its type, the obs

View(starwars) # gives the data in a neat and tidy format in a table

head(starwars)  # gives 1st 6 rows of dataset

starwars$name   # gives the name coln from dataset

attach(starwars)  # when we usee starwars dataset in some function 
#we dont need to use the $ sign, instead we can give the name of coln

names(starwars)  # gives names of the var

length(starwars)  # thevar length

class(starwars)   
class(starwars$mass)

unique(starwars)

class(starwars$eye_color)
  unique(starwars$eye_color)

  class(starwars$hair_color)
  unique(starwars$hair_color) 
# helps to spot NA in the dataset
  
  view(sort(table(hair_color),decreasing = TRUE))
#  sorts hair_color coln with decreasing frequency
  # view gives a table like outlook
  
  sort(table(hair_color),decreasing = TRUE)
  # gives our req outcome, but its not neat, so we use view
  
  barplot(sort(table(hair_color),decreasing = TRUE))
# gives a bar plot of the table
  
  # using pipe operator  ( and then)
starwars %>%
  select(hair_color) %>%
  count(hair_color) %>%
  arrange(desc(n))  %>%
view()

# NA
is.na(hair_color)  # gives a  vector of TRUE FALSE 
starwars[is.na(hair_color),]  # extract the rows which the connd is true
# so these are the 5 rows where is.na = TRUE . i.e., NA values exists

view(starwars[is.na(hair_color),]) # gives a neat table

# we deal now with numerical var  ex:height
class(height)
length(height)
summary(height)

boxplot(height) # to get a sense of the shape of the data
hist(height)   


