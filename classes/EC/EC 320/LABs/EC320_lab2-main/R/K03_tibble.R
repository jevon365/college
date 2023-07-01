#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                                Koan #3: Tibbles
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Embrace the art of tibble(), and let your data dance in harmony. As you delve
# in, knowledge shall blossom, revealing the secrets of tidy data frames. With
# each use, your familiarity shall flourish, guiding you towards a world of
# organized and efficient data management.

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

# Attach the tidyverse to your current session get started:
library(tidyverse)

# Read the qelp docs for 'tibble':
?qelp::tibble

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                         ----- Building a tibble -----
#
# Suppose we want to create a tibble with data on students and their grades.
# First we take a sample of 3 students. Here's the data in written form:
#
# First, there's a male student who studies for 8 hours per week and earned a 78.
# Second, there's a female student who studies for 4 hours per week and earned a 74.
# Third, there's a female student who studies for 4 hours per week and earned an 86.

# Here's how to put that data into a tibble in R. Read this carefully and run
# the code (highlight the code you want to run or put your cursor at the end
# of the expression and hit Ctrl/Cmd-Return):

student_sampleA <- tibble(
  sex = c("male", "female", "female"),
  study_time = c(8, 4, 4),
  grade = c(78, 74, 86)
)

# Note: I used variable assignment here: `student_sampleA <-` to give the tibble
# a name. Run the code above. You should see `student_sampleA` pop up as a
# variable available in your Environment (the upper right hand panel). Now we
# can reference that tibble using its name `student_sampleA`.

student_sampleA

# Now suppose we take a second sample of students:
# Fourth, there's a male student who studies for 0 hours and earns an 84.
# Fifth, there's a female student who studies for 12 hours and earns a 72.
# Sixth, there's a male student who studies for 8 hours and earns a 90.

# 1. Create another tibble that holds `student_sampleB`. (Warning: for the tests
# to pass here, you need to match my style for defining `students` exactly).

#1@

# student_sampleB <- __

#@1

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                       ----- Inspecting your tibble -----

# There are a few ways to see the data held in a tibble. The first way is to
# print the tibble by calling its name:

student_sampleA

# Another way is to use 'view()' to open a view of the data in a separate tab.
# Warning: having view() in your R script is kind of annoying when you're also
# running the tests, because the tests run the file, which opens new tabs
# each time. To prevent this behavior, just comment out lines that view() when
# you're done with them.

# view(student_sampleA)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Tibble Dimensions -----

# You can use the functions 'nrow()' and 'ncol()' to find the dimensions of the
# tibble.
?qelp::nrow
?qelp::ncol

# 2. How many rows and columns does `student_sampleA` have? Fill in the blanks
# with numbers.

#2@

# nrow(student_sampleA) == __
# ncol(student_sampleA) == __

#@2

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Variable Names -----

# You can get the variable (column) names of a tibble using `names()`:

# 3. Fill in the blanks below. Notice that `names()` returns a character vector,
# so names of variables need quotes.

#3@

# names(student_sampleA) == c(__, __, __)

#@3

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Adding Rows -----

# Suppose you want to append a row (or several) to your dataset. You can do that
# using the function 'add_row()'. It takes the tibble as the first argument and
# then variable names and values to construct the new row.

# 4. Suppose we got a new observation (row): a seventh student is a female who
# studied for 8 hours and got a 92. Add the new observation to `student_sampleB`:

#4@

# student_sampleB %>%
#   add_row(
#     sex = __,
#     hours_studying = __,
#     grade = __
#   )

#@4

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: qplot.
