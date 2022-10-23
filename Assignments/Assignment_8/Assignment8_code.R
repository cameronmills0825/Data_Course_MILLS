library(tidyverse)
library(easystats)
library(modelr)
library(broom)
# ASSIGNMENT 8 # 

# 1. 
df <- read_csv("C:/Users/email/Data_Course_MILLS/Assignments/Assignment_8/mushroom_growth.csv")

# 2. 
mod1 <- glm(data = df, 
            formula = GrowthRate ~ Temperature * Light * Nitrogen)
mod2 <- glm(data = df, 
            formula = GrowthRate ~ Temperature + Light + Nitrogen)
mod3 <- glm(data = df, 
            formula = GrowthRate ~ Temperature * Humidity)
mod4 <- glm(data = df, 
            formula = GrowthRate ~ Temperature * Light * Humidity * Nitrogen)

compare_performance(mod1, mod2, mod3, mod4, rank = TRUE)

add_predictions(df, mod1) %>% 
  ggplot(aes(x=Nitrogen, y=pred, color=factor(Temperature))) + 
  geom_point() + 
  geom_smooth(se=FALSE)

add_predictions(df, mod2) %>% 
  ggplot(aes(x=Nitrogen, y=pred, color=factor(Temperature))) + 
  geom_point() + 
  geom_smooth(se=FALSE)

add_predictions(df, mod3) %>% 
  ggplot(aes(x=Nitrogen, y=pred, color=factor(Temperature))) + 
  geom_point() + 
  geom_smooth()

add_predictions(df, mod4) %>% 
  ggplot(aes(x=Light, y=pred, color=factor(Temperature))) + 
  geom_point() + 
  geom_smooth()

# 3. 
  # Model 1: 
    # In this model, GrowthRate is dependent on the temperature * the amount of light * nitrogen present. The plot shows that there is a downward slope, indicating that as temperature increases, the growthrate decreases. The plot shows that higher temperatures started and ended with a higher growth rate, but nitrogen levels affected how fast the mushrooms grew, as indicated by the different slopes. 
  # Model 2:
    # In this model, I showed growth rate as a funtion of temperature + nitrogen + light. The graph looks similar to the interactive version (model 1), but the slope is a straight line, indicating that the different factors are additive and not interactive, thus not changing the slope at all depending on nitrogen levels present. 
  # Model 3: 
    # Model 3 demonstrates the relationship of growth rate as a function of temperature * humidity. This plot doesn't show much. The slope is almost flat, indicating that temperature interacting with humidity doesn't affect the growth rate. 
  # Model 4:
    # Model 4 shows growth rate as a function of Temperature * light * humidity * nitrogen. This plot shows how temperature influenced growth rate when interacting with humidity and nitrogen levels. The slope difference between the two temperatures is much more noticeable than the other plots. The growthrate in 20 degrees is more steep than the growth rate in 25 degrees. 

# 4. 
model_performance(mod1) # MSE = 86.598
model_performance(mod2) # MSE = 87.208
model_performance(mod3) # MSE = 87.279
model_performance(mod4) # MSE = 71.550
 
# 5. 
compare_performance(mod1, mod2, mod3, mod4, rank = TRUE)
# Mod 4 is best

# 6. 
new_mod4 <- data.frame(Temperature = c(25, 30, 35), 
                       Nitrogen = c(60, 55, 30), 
                       Light = c(10, 15, 25), 
                       Humidity = "Low")
add_predictions(new_mod4, mod4) %>% # 7. 
  ggplot(aes(x=Nitrogen, y=pred)) + 
  geom_point() + 
  geom_smooth()

###################################################

# 1. I would say that none of my predected response values from my best model are meaningful, just because initially, the MSE was high. But on the plot, the growth rate is affected by the nitrogen levels. As the nitrogen levels increased, the predicted growth rate significantly decreased. 
# 2. My model 4 had a non-linear relationship. An article online that explains how to deal with modeling non-linear relationships in R is https://data-flair.training/blogs/r-nonlinear-regression/
# 3. 
df2 <- read_csv("C:/Users/email/Data_Course_MILLS/Assignments/Assignment_8/non_linear_relationship.csv")
model_1 <- glm(data = df2, 
               formula = response ~ predictor)
add_predictions(df2, model_1) %>% 
  ggplot(aes(x=predictor, y=pred)) + 
  geom_point()
