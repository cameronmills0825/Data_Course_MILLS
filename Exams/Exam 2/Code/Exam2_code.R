library(tidyverse)
library(easystats)
library(modelr)
library(broom)
library(qdap)
library(stringr)
library(reshape2)
library(lubridate)
library(patchwork)

# 1. 
df <- read_csv("C:/Users/email/Data_Course_MILLS/Exams/Exam 2/Data/unicef-u5mr.csv")

?separate
?mutate
?as.numeric
?str_split_fixed
?as.Date
#2. 
dat <- 
df %>% 
  pivot_longer(starts_with("U5MR."), names_to = "Year")
dat[c('U5MR', 'Year')] <- str_split_fixed(dat$Year, 'U5MR.', 2)
  
dat <- dat[c('CountryName', 'Continent', 'Region', 'Year', 'value')] %>% 
  select(-contains("U5MR"))

year_num <- as.numeric(unlist(dat$Year))
year_num
class(year_num)
sum(length(dat$Year))
length(year_num)
list(year_num)
dat$Time <- year_num

year_num <- as.Date(as.character(year_num), format = "%Y")

# 3. 
plot1 <- 
dat %>% 
  ggplot(aes(x=Time, y=value)) + 
  geom_path() + 
  facet_wrap(~Continent) + 
  theme(axis.text.x = element_text(angle = 90))

# 4. 
ggsave("C:/Users/email/Data_Course_MILLS/Exams/Exam 2/Plots/MILLS_Plot_1.png", plot1, width = 4, height = 4, dpi = 300)

# 5.
mean <- 
dat %>% group_by(CountryName, Time, Continent, Region) %>% 
  summarize(avg = mean(value, na.rm=TRUE, .groups = 'drop'))
  
plot2 <- 
  mean %>% ggplot(aes(x=Time, y=avg, color=Continent)) + 
  geom_path()
# 6. 
ggsave("C:/Users/email/Data_Course_MILLS/Exams/Exam 2/Plots/MILLS_Plot_2.png", plot2, width = 4, height = 4, dpi = 300)

# 7. 
mod1 <- glm(data = dat, 
            formula = value ~ Time)

mod2 <- glm(data = dat, 
            formula = value ~ Time + Continent)

mod3 <- glm(data = dat, 
            formula = value ~ Time * Continent)

 # 8. 
compare_performance(mod1, mod2, mod3, rank = TRUE)
  # Model 3 is the best because its R^2 value is the highest and the mean standard error is the lowest among the three plots. 

# 9.
pred_1_plot <- 
add_predictions(dat, mod1) %>% 
  ggplot(aes(x=Time, y=pred, color=Continent)) +
    geom_path()

pred_2_plot <- 
add_predictions(dat, mod2) %>% 
  ggplot(aes(x=Time, y=pred, color=Continent)) +
  geom_path()

pred_3_plot <- 
add_predictions(dat, mod3) %>% 
  ggplot(aes(x=Time, y=pred, color=Continent)) +
  geom_path()

pred_1_plot + pred_2_plot + pred_3_plot
