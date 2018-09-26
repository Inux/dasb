# DASB - Data Science Basic
Data Science Basic Module of HSLU

## R - Basics
* Install package
    ```R
    install.packages("tidyverse")
    install.packages(c("nycflights13", "gapminder", "Lahman"))
    ```

* Include package
    ```R
    library(tidyverse)
    ```

* Recreate Dataset
    ```R
    dput(mtcars) #copy output
    mtcars <-    #insert copied output
    ```

## Data Exploration

### Data
* Output data
    ```R
    mpg #dataset name
    ```

### Visualization
* Creating a ggplot
    ```R
    ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
    ```
* Tempate for ggplot
    ```R
    ggplot(data = <DATA>) + <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
    ```