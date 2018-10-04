library(nycflights13)
library(tidyverse)

#View the flights
View(flights)
#Show columns
colnames(flights)

#Filter - Had an arrival delay of two or more hours
filter(flights,arr_delay >= 120)
#or
flights %>%  filter(arr_delay >= 120)

#Filter - Flew to Houston (IAH or HOU)
filter(flights,dest == 'IAH' | dest == 'HOU')
#or
filter(flights,dest %in% c('IAH','HOU'))

#Assign Filter to Value
result <- filter(flights, dep_time >= 000 & dep_time <= 600)
View(result)

#Arrange - Descending
result <- arrange(result, desc(dep_time))
View(result)

#Find most delayed flights
flights %>% arrange(desc(dep_delay)) %>% head(3)

#Select
reduced_flights <- select(flights, dep_time, dep_delay, arr_time)
View(reduced_flights)
flights %>% select(matches("^dep|^arr.*time$|delay$")) -> reduced_flights2
View(reduced_flights2)

select(flights, contains("TIME", ignore.case = FALSE))
select(flights, contains("TIME", ignore.case = TRUE))

60 %% 5
61 %/% 5

mutate(flights, dep_time=dep_time*10)
transmute(flights, dep_time=dep_time*10)
