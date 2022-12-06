# EXAM 4 (A redo of exam 1!)

library(stringr)
library(data.table)
library(tidyverse)

# I. Read the cleaned_covid_data.csv file into an R data frame. (20 pts)
covid_data <- read_csv("./Data/cleaned_covid_data.csv")

# II. Subset the data set to just show states that begin with “A” and save this as an object called A_states. (20 pts)
A_States <- subset(covid_data, grepl('A', covid_data$Province_State))

  
# III. Create a plot of that subset showing Deaths over time, with a separate facet for each state. (20 pts)
A_States %>% 
  ggplot(aes(x=Last_Update, y=Deaths, color=Province_State)) + 
  geom_point() + 
  geom_smooth(method = "loess", se=FALSE) + 
  facet_wrap(~Province_State)

# IV. Find the “peak” of Case_Fatality_Ratio for each state and save this as a new data frame object called state_max_fatality_rate. (20 pts)
state_max_fatality_rate <- covid_data[ , c("Province_State", "Case_Fatality_Ratio")]
state_max_fatality_rate1 <- state_max_fatality_rate[order(state_max_fatality_rate$Case_Fatality_Ratio, decreasing=TRUE), ]
state_max_fatality_rate1 <- Reduce(rbind,
                                   by(state_max_fatality_rate1,
                                      state_max_fatality_rate1["Province_State"],
                                      head, n=1))
state_max_fatality_rates <- state_max_fatality_rate1[order(-state_max_fatality_rate1$Case_Fatality_Ratio), ] # This is the good dataframe for this problem
colnames(state_max_fatality_rates)
names(state_max_fatality_rates)[names(state_max_fatality_rates) == "Case_Fatality_Ratio"] <- "Maximum_Fatality_Ratio" #Renaming column
head(state_max_fatality_rates)

# V. Use that new data frame from task IV to create another plot. (20 pts)

state_max_fatality_rates %>% 
  ggplot(aes(x=reorder(Province_State, -Maximum_Fatality_Ratio), y=Maximum_Fatality_Ratio)) +
  geom_col() + 
  theme(axis.text.x = element_text(angle = 90))


