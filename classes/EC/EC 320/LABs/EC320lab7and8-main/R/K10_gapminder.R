#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                             Koan #10: gapminder
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In this koan, I'll introduce you to a new dataset called `gapminder`. This
# is panel data on life expectancy, population, and gdp per capita for 142
# countries around the world, measured every five years between 1952 and 2007.
# To get the dataset, install the package also named `gapminder` by running:
# install.packages("gapminder")
# Remember to comment out any lines that install packages in your R scripts
# because if you leave them in, they will keep you from being able to knit that
# script to html.

library(gapminder)
library(tidyverse)

# To check that you've loaded the dataset:
gapminder %>%
  slice_head(n = 5)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 1. What are the 3 observations in the Americas with the lowest life expectancies?

# Hint: the output should look something like this:
# # A tibble: 3 × 6
# country continent  year lifeExp     pop gdpPercap
# <fct>   <fct>     <int>   <dbl>   <int>     <dbl>
# 1 Haiti   Americas   1952    37.6 3201488     1840.
# 2 Bolivia Americas   1952    40.4 2883315     2677.
# 3 Haiti   Americas   1957    40.7 3507701     1727.

# 2. What are the 3 observations in Europe with the highest life expectancies?

# Hint: the output should look something like this:
# # A tibble: 3 × 6
# country     continent  year lifeExp      pop gdpPercap
# <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
# 1 Iceland     Europe     2007    81.8   301931    36181.
# 2 Switzerland Europe     2007    81.7  7554661    37506.
# 3 Spain       Europe     2007    80.9 40448191    28821.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 3. Which (one) country has the highest life expectancy in each continent?

# Hint: the output should look something like this:
# # A tibble: 5 × 6
# # Groups:   continent [5]
# country   continent  year lifeExp       pop gdpPercap
# <fct>     <fct>     <int>   <dbl>     <int>     <dbl>
# 1 Reunion   Africa     2007    76.4    798094     7670.
# 2 Canada    Americas   2007    80.7  33390141    36319.
# 3 Japan     Asia       2007    82.6 127467972    31656.
# 4 Iceland   Europe     2007    81.8    301931    36181.
# 5 Australia Oceania    2007    81.2  20434176    34435.

# 4. Show that the median gdpPercap around the world has risen steadily since 1952.

# Hint: the output should look something like this:
# # A tibble: 12 × 2
# year gdpPercap_median
# <int>            <dbl>
# 1  1952            1969.
# 2  1957            2173.
# 3  1962            2335.
# 4  1967            2678.

