#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                       Koan #6: arrange, slice, and mutate
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In this koan, you'll learn about the next three dplyr verbs: 'arrange',
# 'slice', and 'mutate'. 'arrange' sorts a tibble by a certain variable, 'slice'
# selects integer rows, and 'mutate' creates new variables that may or may
# not be transformations of existing variables.

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

#                             ----- arrange() -----

# arrange() rearranges the rows of your tibble by the variable you specify.
# For instance, this sorts the data by final_grade (descending):

students %>%
  arrange(desc(final_grade))

# 1. Use arrange() to query the data to see who got the *lowest* final grades
# instead of the highest.

#1@

# students %>%
#   __

#@1


# 2. Query the data to see who had the most failures (failed classes the previous
# year).

#2@

# students %>%
#   __

#@2


# 3. Query the data to see who had the most absences.

#3@

# students %>%
#   __

#@3

# Read the qelp docs on arrange():
?qelp::arrange

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- slice() -----

# slice() lets you select rows by their integer locations. So if you want to
# select the second row of 'students':
students %>%
  slice(2)

# And if you want to select the second, third, and fourth rows:
students %>%
  slice(c(2, 3, 4))

# Or equivalently:
students %>%
  slice(2:4)

# 4. Take 'students' and grab rows 256 all the way up to 268.

#4@

# students %>%
#   __

#@4

# Two related functions are slice_head() and slice_tail(). slice_head() takes
# the first 'n' rows of a tibble:
students %>%
  slice_head(n = 5)

# And slice_tail() takes the last 'n' rows of a tibble:
students %>%
  slice_tail(n = 5)

# We can use slice_head() along with arrange() to find the students with extreme
# values for variables, like the 3 students with the most absences:
students %>%
  arrange(desc(absences)) %>%
  slice_head(n = 3)

# 5. Find the five female students with the highest final grades. (hint: you
# should use filter, arrange, and slice to solve this problem).

#5@

# students %>%
#   __

#@5

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                              ----- mutate() -----

# Use 'mutate()' to add new variables to your tibble. Those new variables can
# even be transformations of other existing variables. For example, we can add
# 5 extra points to everyone's final grade and then call that variable
# final_grade_curved (you may need to pipe this into view() to see all the
# variables because the data is getting pretty wide):
students %>%
  mutate(final_grade_curved = final_grade + 5)

# In the code below, I change the variable 'study_time' to be numeric by using
# mutate() along with case_when(). case_when() takes a vector (in this case,
# study_time), a list of logical conditions (in this case, study_time ==
# "less than 2H", study_time == "2 - 5H", study_time == "5 - 10H", and
# study_time == "more than 10H"), and after the tilde, a value to return the
# first time that logical condition returns TRUE. Here I'm saying to reassign
# 'study_time' to say that the person studied 1 hour if they reported studying
# "less than 2H".
students %>%
  mutate(study_time = case_when(
    study_time == "less than 2H" ~ 1,
    study_time == "2 - 5H" ~ 3.5,
    study_time == "5 - 10H" ~ 7.5,
    study_time == "more than 10H" ~ 12
  ))

# 6. Change the variable 'alcohol' to be numeric by making "very low" consumption
# map to 1, "moderately low" consumption map to 2, etc.

#6@

# students %>%
#   __

#@6

# Read the qelp docs on 'mutate()':
?qelp::mutate

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.
