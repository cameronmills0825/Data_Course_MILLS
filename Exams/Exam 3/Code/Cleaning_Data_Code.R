library(tidyverse)
library(janitor)
df <- read_csv("C:/Users/email/Data_Course_MILLS/Exams/Exam 3/Data/FacultySalaries_1995.csv")
clean_names(df)

df <- 
df %>% 
  pivot_longer(cols = contains(c("FullProfSalary", "AssocProfSalary", "AssistProfSalary")), 
               names_to = "Rank_Salary", 
               values_to = "Salary")

df <- 
  df %>% pivot_longer(cols = contains(c("FullProfComp", "AssocProfComp", "AssistProfComp", "CompAll")), 
                      names_to = "Rank_Comp", 
                      values_to = "Comp")

df <- 
  df %>% pivot_longer(cols = contains(c("FullProfs", "AssocProfs", "AssistProfs")), 
                      names_to = "Rank_Profs", 
                      values_to = "Num_Profs")

df %>% 
  ggplot(aes(x=Rank_Salary, y=Salary, z=Tier, fill=Rank_Salary)) + 
  geom_boxplot()


dat <- read_csv("C:/Users/email/Data_Course_MILLS/Exams/Exam 3/Data/Juniper_Oils.csv")

dat <- dat %>% 
  pivot_longer(cols = contains(c("ene", "ol", "al", "compound")), 
               names_to = "Compound", 
               values_to = "Conc")

  
