#Used packages:
#
#install.packages(c("callr", "reprex", "tidyverse", "viridisLite", "viridis", "forcats", "nycflights13"))

library("tidyverse")
library("viridis")
library("forcats")
library("nycflights13")

View(diamonds)

#Exercise 7.3.4.1
#Explore the distribution of each of the x, y, and z 
#variables in diamonds. What do you learn? Think about a 
#diamond and how you might decide which dimension is the 
#length, width, and depth.
diamonds %>%
  mutate(id = row_number()) %>%
  select(x, y, z, id) %>%
  gather(variable, value, -id)  %>%
  ggplot(aes(x = value)) +
  geom_density() +
  geom_rug() +
  facet_grid(variable ~ .)

#Exercise 7.3.4.2
#Explore the distribution of price. Do you discover 
#anything unusual or surprising? (Hint: Carefully 
#think about the binwidth and make sure you try 
#a wide range of values.)
ggplot(filter(diamonds, price < 2500), aes(x = price)) +
  geom_histogram(binwidth = 10, center = 0)

ggplot(filter(diamonds), aes(x = price)) +
  geom_histogram(binwidth = 100, center = 0)

diamonds %>%
  mutate(ending = price %% 10) %>%
  ggplot(aes(x = ending)) +
  geom_histogram(binwidth = 1, center = 0) +
  geom_bar()

diamonds %>%
  mutate(ending = price %% 100) %>%
  ggplot(aes(x = ending)) +
  geom_histogram(binwidth = 1) +
  geom_bar()

diamonds %>%
  mutate(ending = price %% 1000) %>%
  filter(ending >= 500, ending <= 800)  %>%
  ggplot(aes(x = ending)) +
  geom_histogram(binwidth = 1) +
  geom_bar()

#Exercise 7.3.4.3
#How many diamonds are 0.99 carat? How many
#are 1 carat? What do you think is the cause of the 
#difference?
diamonds %>%
  filter(carat >= 0.99, carat <= 1) %>%
  count(carat)

diamonds %>%
  filter(carat >= 0.9, carat <= 1.1) %>%
  count(carat) %>%
  print(n = 30)

#Exercise 7.3.4.4
#Compare and contrast coord_cartesian() vs 
#xlim() or ylim() when zooming in on a 
#histogram. What happens if you leave binwidth
#unset? What happens if you try and zoom so only 
#half a bar shows?
ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price)) +
  coord_cartesian(xlim = c(100, 5000), ylim = c(0, 3000))

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price)) +
  xlim(100, 5000) +
  ylim(0, 3000)

#Exercise 7.4.1.1
#What happens to missing values in a histogram? 
#What happens to missing values in a bar chart? 
#> Why is there a difference?
diamonds2 <- diamonds %>%
  mutate(y = ifelse(y < 3 | y > 20, NA, y))

ggplot(diamonds2, aes(x = y)) +
  geom_histogram()

diamonds %>%
  mutate(cut = if_else(runif(n()) < 0.1, NA_character_, as.character(cut))) %>%
  ggplot() +
  geom_bar(mapping = aes(x = cut))

#Exercise 7.4.1.2
#What does na.rm = TRUE do in mean() and sum()?
mean(c(0, 1, 2, NA), na.rm = TRUE)
sum(c(0, 1, 2, NA), na.rm = TRUE)

#Exercise 7.5.1.1.1
#Use what you???ve learned to improve the
#visualization of the departure times
nycflights13::flights %>%
  mutate(
    canceled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>%
  ggplot() +
  geom_boxplot(mapping = aes(y = sched_dep_time, x = canceled))
