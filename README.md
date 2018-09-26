# DASB - Data Science Basic
Data Science Basic Module of HSLU

## R
### Install package
install.packages("package-name")

example:
```cmd
install.packages("tidyverse")
install.packages(c("nycflights13", "gapminder", "Lahman"))
```

### Include package
library("package-name")

example:
```cmd
library(tidyverse)
```

### Recreate Dataset
dput("dataset")

example:
```cmd
dput(mtcars) #copy output
mtcars <-    #insert copied output
```

### Data Exploration
