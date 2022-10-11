library(tidyverse)
df <- read_csv("C:/Users/email/Data_Course_MILLS/Assignments/Assignment_7/Utah_Religions_by_County.csv")
df <- 
  df %>% 
<<<<<<< HEAD
  pivot_longer(cols = -c(County, Pop_2010, Religious, `Non-Religious`), 
               names_to = "Religion")

df %>% 
  ggplot(aes(x=Religious, y=`Non-Religious`, color=County)) + 
  geom_point() # Proportion of religious people to non-religious people (Perfectly Linear)

# Does population of a county correlate with the proportion of any specific religious group in that county?
df %>% 
  ggplot(aes(x=Pop_2010, y=value, color=Religion)) + 
  geom_point() + 
  facet_wrap(~County)
# Counties with a lower population tend to have a lower proportion of followers to any religion, with the exception of LDS. 
# LDS has a higher proportion among lower populated counties than other religions. 

# Does proportion of any specific religion in a given county correlate with the proportion of non-religious people?
df %>% 
  ggplot(aes(x=value, y=`Non-Religious`, color=Religion)) + 
  geom_point() + 
  facet_wrap(~County)
# It seems that in Counties with a higher population, there are higher proportions of LDS and a lower proportion of non-religious people. 
#     For example, in Utah County, a county with a high population, there are is an extremely high proportion of LDS people with an extremely low proportion of non-religious people. 
#     In Grand County, a county with a low population, there are lower proportions of LDS, Catholic, and Orthodox people, but high non-religious people. 
=======
  pivot_longer(cols = -c(County, Pop_2010), 
               names_to = "Religion")
>>>>>>> 9929a83b72b948a748d821a73bd4d55b80517d28
