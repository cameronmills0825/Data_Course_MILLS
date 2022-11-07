library(tidyverse)
library(easystats)
library(janitor)
library(modelr)

# Cleaning Data:
df <- read_csv("./Data/GradSchool_Admissions.csv")
df <- df %>% 
  mutate(admit = case_when(admit == 1 ~ TRUE, 
                           TRUE ~ FALSE))
df$Student <- seq.int(nrow(df))
df <- df[, c(5, 1, 2, 3, 4)]

