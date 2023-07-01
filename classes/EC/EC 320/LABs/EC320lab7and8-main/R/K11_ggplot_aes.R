#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                       Koan #11: ggplot aesthetic mappings
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In order to progress:
# 1. Read all instructions carefully.
# 2. When you come to an exercise, fill in the blank, un-comment the line
#    (Ctrl/Cmd Shift C), and execute the code in the console (Ctrl/Cmd Return).
#    If the piece of code spans multiple lines, highlight the whole chunk or
#    simply put your cursor at the end of the last line.
# 3. Save (Ctrl/Cmd S).
# 4. Test that your answers are correct (Ctrl/Cmd Shift T).

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# This koan is a quick refresher on ggplot aesthetic mappings ('aes').

#   Aesthetic mappings do just one simple thing: they take variables (columns)
#   in your data and map them to visual elements in your plot.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Run this code to get started:

library(tidyverse)
library(gapminder)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                            ----- x and y axis -----

# When you declare which variable should be represented on which axis, you're
# using an *aesthetic mapping* (taking variables in your data and mapping them
# to visual elements in your plot). That's why 'x = ' and 'y = ' are wrapped in
# 'aes()' in a ggplot.

gapminder %>%
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Each point in the scatterplot above represents an observation (row): a certain
# country in a certain year. We can easily create different plots for each
# 'continent' using facet_wrap(). The tilde '~' can be read as "by". So by
# adding a facet layer, we "facet *by* continent". Make sure to take a look at
# the plot.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  facet_wrap(~ continent)

# 1. Change the plot above to facet by 'year' instead of faceting by 'continent'.

#1@

# __

#@1

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                               ----- color -----

# An alternative to faceting is to use color as the plot aesthetic to
# differentiate between continents. So all the points in Africa will be red,
# Europe will be blue, etc. This is an 'aes'thetic mapping because we're taking
# a variable 'continent' and mapping it to the visual element 'color'.

# 2. Draw a scatterplot comparing gdpPercap and lifeExp, where different
# continents are drawn with different colors.

#2@

# gapminder %>%
#   ggplot(aes(x = gdpPercap, y = lifeExp, color = __)) +
#   geom_point()

#@2

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                                ----- fill -----
#
# 'color' is an aesthetic mapping which changes the color of the *outline* of
# the geometry. If instead you want to change the color of the *fill* of the
# geometry, use 'fill' instead of 'color'.

# To see both the 'color' and the 'fill' of a point, I'll use 'shape = 21':
# points with outlines.

# 3. Use 'color' to represent 'continent', and use 'fill' to represent 'year'.

#3@

# gapminder %>%
#   ggplot(aes(x = gdpPercap, y = lifeExp, color = __, fill = __)) +
#   geom_point(shape = 21)

#@3

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                               ----- shape -----
#
# A third aesthetic mapping is 'shape'. We actually just used 'shape' in
# the previous question, outside of the 'aes' call in 'geom_point'. That
# set the shape of the points to a fixed value (shape = 21: points with
# outlines).

# 4. Try mapping 'shape' to 'continent' *inside* of an aes() call.

#4@

# gapminder %>%
#   ggplot(aes(x = gdpPercap, y = lifeExp)) +
#   geom_point(aes(shape = __))

#@4

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                                ----- size -----
#
# 5. So far we have 3 aesthetic mappings other than x and y axis:
# They are 'color', 'fill', and 'shape'. The last 'aes' we'll talk about is
# 'size', which adjusts point size. Add 2 'aes' to this plot: map 'continent' to
# 'color', and map 'pop' to 'size'. Notice another legend is added.

#5@

# gapminder %>%
#   ggplot(aes(x = gdpPercap, y = lifeExp)) +
#   geom_point()

#@5

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment.
#   Make sure to return to this topic to meditate on it later.
