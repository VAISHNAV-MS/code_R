# CLEANING  DATA IN R

library(tidyverse)

View(starwars)
glimpse(starwars)

# we want to  recognise "gender" as a categorical var
class(starwars$gender)
unique(starwars$gender)

starwars$gender=as.factor(starwars$gender)
class(starwars$gender) # because we are interested inn levelss
levels(starwars$gender)

starwars$gender=factor((starwars$gender),levels=c("masculine", "feminine"))
levels(starwars$gender)

# next part of cleaning data, is selecting variables

starwars %>%
  select(name,height,ends_with("color")) %>% 
  names()

# we filter the obs we want
# in hair_color, we have
unique(starwars$hair_color)

starwars %>% 
  select(name,height,ends_with("color")) %>% 
  filter(hair_color %in% c("blond","brown")&
           height<180)
 
 # missing data
mean(starwars$height)
  mean(starwars$height,na.rm = T)

  starwars %>% 
    select(name,gender,hair_color,height)

  # na omit. removes all NA holders
  starwars %>% 
    select(name,gender,hair_color,height) %>% 
    na.omit()
  
  # to properly remove the NA without loss in information in dataset, we use
  starwars %>% 
    select(name,gender,hair_color,height) %>% 
    filter(!complete.cases(.))
# this  give the 14 rows / obs where NA is present
  
  #drop_na
  starwars %>% 
    select(name,gender,hair_color,height) %>% 
    filter(!complete.cases(.)) %>% 
    drop_na(height)
  
  # so height might not be recorded so its genuinely  NA, BUT
  # hair_color NA might include droids who have no hair, 
  # so we want to replace missing values with NONE
  
  starwars %>% 
    select(name,gender,hair_color,height) %>% 
    filter(!complete.cases(.)) %>% 
    mutate(hair_color=replace_na(hair_color,"NONE")) %>% 
  view()

  # DUPLICATES  
  names=c("a","b","a","d")
  age=c(22,30,22,19)
f=data.frame(names,age)  
view(f)
duplicated(f)
f[duplicated(f),]
f[!duplicated(f),]

f %>% distinct()  # using tidyverse
f %>% distinct() %>% 
  view()

# RECODING VARIABLES

# we want to have levels of gender as 1 and 2 
starwars %>%  select(name,gender)

starwars %>%  select(name,gender) %>% 
  mutate(gender_new=recode(gender,"masculine"=1,"feminine"=2)) %>% 
  view()
