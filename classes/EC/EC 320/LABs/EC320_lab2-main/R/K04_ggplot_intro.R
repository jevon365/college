#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                           Koan #4: intro to ggplot
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Embrace the wisdom of ggplot(), and mastery shall be yours. As you explore its
# arguments, clarity shall emerge, illuminating the path to powerful
# visualizations. With each experience, your familiarity shall grow, and the
# realm of plots shall reveal itself before your eyes.

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

# Attach the tidyverse to your current session to get started:
library(tidyverse)

# Run this code to load a much larger dataset `students` into your environment.
# Make sure to highlight the whole chunk or put your cursor down at line 36 to run it.
# You'll need to be connected to the internet when you run these lines:
students <- read_csv(
  "https://raw.githubusercontent.com/cobriant/students_dataset/main/students.csv",
  show_col_types = FALSE
) %>%
  mutate(
    study_time = factor(study_time, levels = c("less than 2H", "2 - 5H", "5 - 10H", "more than 10H")),
    alcohol = factor(alcohol, levels = c("very low", "moderately low", "medium", "moderately high", "very high"))
    )

# Take a look at the dataset in a separate tab:
# view(students)

# I took the data from here and then tweaked it a little for our purposes:
# P. Cortez and A. Silva. Using Data Mining to Predict Secondary School Student
# Performance. In A. Brito and J. Teixeira Eds., Proceedings of 5th FUture BUsiness
# TEChnology Conference (FUBUTEC 2008) pp. 5-12, Porto, Portugal, April, 2008,
# EUROSIS, ISBN 978-9077381-39-7.

#' Here's a description of the variables:
#'
#' | Variable    | Description |
#' |-------------|-------------|
#' | sex         | "female" or "male" |
#' | study_time  | students report how many hours per week they study math |
#' | failures    | number of courses the student failed the previous year |
#' | romantic    | students report whether they are in a romantic relationship |
#' | alcohol     | students report their alcohol consumption (data is from Portugal) |
#' | absences    | number of school absences the student had that year |
#' | grade1      | first-semester math grade |
#' | grade2      | second-semester math grade |
#' | final_grade | final grade in their math course (some combination of grade1, grade2, and perhaps a final exam) |

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 1. Get to know the dataset: how many columns and rows are there? What are
# the variable names? Try to remember which functions we can call on `students`
# to answer each of these questions.

# Number of Columns:
#1a@
# __(students)
#@1a

# Number of Rows:
#1b@
# __(students)
#@1b

# Variable names:
#1c@
# __(students)
#@1c

# This koan is all about using ggplot() to draw plots. Check out the qelp docs
# first:
?qelp::ggplot

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Plots are a terrific way to determine the type of pattern that might exist
# in a dataset. For instance, do students who study more earn higher grades?
# And how do absences, alcohol, and romantic relationships seem to impact grades?
# If a student has failed classes before, does it make it more likely they will
# fail this class? And are any of these effects different for boys than girls?
# That is, if romantic relationships make boys' grades suffer, does it seem to
# make girls' grades suffer by the same amount?

# We'll use ggplot() to answer many of these questions in this koan. Note: the
# patterns we'll find in this dataset are *correlations* and we won't be able
# to speak to *causation* here. They are also correlations that existed in this
# specific time and place (math classes in a high school in Portugal during the
# 2005-2006 academic year), and they may or may not exist in the same way at a
# different time and place.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Questions 2-6 will have you visualize the distribution of a single variable,
# so reflect on "Learning the Tidyverse: and Illustrated Guide" chapter 4.1,
# recipes 1 and 2. Challenge yourself to memorize the syntax by typing it out
# without looking at the recipe.

# 2. Draw a plot to show whether there are more boys or girls in the dataset.

#2@

# students %>%
#   __

#@2

# 3. Draw a plot to describe student alcohol consumption. How many students drink
# very little versus "moderately low", "moderate", "moderately high", and "very high"?

#3@

# students %>%
#   __

#@3

# 4. Draw a plot to show the final grade distribution.

#4@

# students %>%
#   __

#@4

# 5. Draw a plot to show how many students study math less than 2H per week
# versus 2 - 5H, 5 - 10H, or more than 10H.

#5@

# students %>%
#   __

#@5

# 6. Draw a plot to show how many students report being in a romantic relationship
# versus not being in one.

#6@

# students %>%
#   __

#@6

# Questions 7-10 will have you visualize the relationship between two variables,
# so make sure to reflect on "Learning the Tidyverse: and Illustrated Guide"
# chapter 4.1, recipes 3-5. Challenge yourself to memorize the syntax by typing
# it out without looking at the recipe.

# 7. Draw a plot to show how much first-semester grades explain/predict
# second-semester grades.

#7@

# students %>%
#   __

#@7

# 8. Draw a plot to show how much absences explain/predict second-semester
# grades. Absences are counted, so technically they are discrete, however since
# they take on so many different values in this dataset (0 - 75), you should
# treat absences as if it is a continuous variable. Add a line of best fit.

#8@

# students %>%
#   __

#@8

# 9. Draw a plot that shows whether alcohol consumption seems to effect final
# grades.

#9@

# students %>%
#   __

#@9

# 10. Draw a plot that shows whether more females than males reported that they
# were in romantic relationships.

#10@

# students %>%
#   __

#@10

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.
