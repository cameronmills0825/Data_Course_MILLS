library(tidyverse)
df <- read_csv("C:/Users/email/Data_Course_MILLS/Assignments/Assignment_7/Utah_Religions_by_County.csv")
df <- 
  df %>% 
  pivot_longer(cols = -c(County, Pop_2010), 
               names_to = "Religion")
