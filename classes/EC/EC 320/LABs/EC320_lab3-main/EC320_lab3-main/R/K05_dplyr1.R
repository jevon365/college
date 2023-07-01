#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                           Koan #5: select and filter
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In this koan, you'll learn the first two dplyr verbs: 'select' and 'filter'.
# Selecting eliminates variables you aren't interested in and filtering reveals
# only the relevant observations.

# To conquer this challenge:
# 1. When facing an exercise, bravely fill in the blank and prepare for action.
# 2. Liberate the code from its comment chains (Ctrl+Shift+C on Windows,
#    Cmd+Shift+C on Macs).
# 3. Then place your cursor at the end of the last line of the chunk and command
#.   it to run in the console (Ctrl/Cmd+Return).
# 4. Preserve your progress by saving (Ctrl/Cmd+S) and verifying your answers
#.   (Ctrl/Cmd+Shift+T).
# 5. Once you've achieved 100% mastery, transform your work into an html
#    treasure (Ctrl/Cmd+Shift+K) and share your spoils on Canvas!

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Run this code to attach the tidyverse and load your dataset:
library(tidyverse)

students <- read_csv(
  "https://raw.githubusercontent.com/cobriant/students_dataset/main/students.csv",
  show_col_types = FALSE
) %>%
  mutate(
    study_time = factor(study_time, levels = c("less than 2H", "2 - 5H", "5 - 10H", "more than 10H")),
    alcohol = factor(alcohol, levels = c("very low", "moderately low", "medium", "moderately high", "very high"))
  )

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- select() -----
#
# The function 'select()' lets you select columns (variables) of a tibble
# by name. No quotes are needed because they're variable names. Here's an
# example where we pare down 9 columns into just 3:

students %>%
  select(sex, study_time, final_grade)

# 1. Take `students` and then select only the last 3 columns: grade1, grade2,
# and final_grade.

#1@

# students %>%
#   __

#@1


# You can also use `select` to rename a variable. For instance, suppose we wanted
# to select the grade columns and also to rename final_grade to be grade3.

students %>%
  select(grade1, grade2, grade3 = final_grade)

# 2. Use `select()` to rename the variable `alcohol` to be `alcohol_consumption`.

#2@

# students %>%
#   __

#@2


# Finally, make sure to read the qelp docs on 'select()':
?qelp::select

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- filter() -----

# The next dplyr function we'll learn about is 'filter()'. It lets us filter
# our tibble by some logical condition, like "sex is equal to female".
# This gives us all the rows (observations) with females. Note that since
# "female" is not a variable, it's a character string, it needs quotes.

students %>%
  filter(sex == "female")

# Read the qelp docs on 'filter()':
?qelp::filter

# 3. Write a query that finds all the "A" students (final_grade higher than 90).

#3@

# students %>%
#   __

#@3


# 4. Write a query to find all the male students who study more than 10 hours
# per week. Notice: this is actually two logical conditions. You have options
# for solving this: you can use `&`, separate them with a comma (condition1,
# condition2), or filter() twice.

#4@

# students %>%
#   __

#@4


# 5. Write a query to answer this: which students got B's in their first
# semester but then turned it around to eventually earn A's for their final
# grade?

#5@

# students %>%
#   __

#@5

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

