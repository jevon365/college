#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                       Koan #7: summarize and group_by
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In this koan, you'll learn about the final two dplyr verbs: 'summarize' and
# 'group_by.' These two can be very powerful for developing insights about your
# data.

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

#                            ----- summarize() -----

# 'summarize()' reduces a tibble down to a customized summary.

# For example, when you want to know the minimum value of a variable,
# or the maximum, or the mean, or the median, you can use 'summarize()'.

students %>%
  summarize(
    finalgrade_min = min(final_grade),
    finalgrade_max = max(final_grade)
    )

# The output is a tibble with columns as summary statistics. Make
# sure to give the new columns names (finalgrade_min and finalgrade_max).

# 1. Take 'students', filter for only A students (students who ended up with a
# final grade higher than 90), and then summarize to find the average (mean)
# first-semester grade and average (mean) second-semester grade.

#1@

# students %>%
#   __

#@1

# 2. How much do A students study on average? To do this, take 'students',
# filter again for A students, mutate with case_when to make study_time
# estimates numeric, and then use summarize to find the average amount of time
# A students report studying.

#2@

# students %>%
#   __

#@2

# Read the qelp docs on 'summarize()':
?qelp::summarize

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                             ----- group_by() -----

# The final dplyr function we'll learn is 'group_by()'. It sorts your data into
# buckets (groups) by the variable you specify. For example, this code sorts
# students into buckets by sex:

students %>%
  group_by(sex)

# There's no obvious difference between a grouped tibble and an ungrouped tibble
# except that a grouped tibble has a special attribute called Groups:

# A tibble: 374 × 9
# Groups:   sex [2] <---- here's the attribute!
# sex    study_time    failures romantic alcohol     absences grade1 grade2 final_grade
# <chr>  <fct>            <dbl> <chr>    <fct>          <dbl>  <dbl>  <dbl>       <dbl>
# 1 female less than 2H         0 no       moderately…       12   66.3   70.5        69.4
# 2 female less than 2H         0 yes      moderately…        0   66.1   51.2        49.1
# 3 female 5 - 10H              0 no       very low           6   80.2   77.4        76.7

# 'group_by()' isn't very useful on its own. To see how powerful it is, you can
# pair it with summarize(). This code sorts students into buckets by alcohol
# consumption and then visits each bucket one by one to calculate the average
# grade by group. You can see as alcohol consumption increases, average grades
# decrease:

students %>%
  group_by(alcohol) %>%
  summarize(final_grade_avg = mean(final_grade))

# On its own, 'summarize()' outputs a tibble with *one row*. But in conjunction
# with 'group_by()', 'summarize()' outputs a tibble with the same number of rows
# as there are buckets (groups). Grouped summaries can be profoundly useful.

# 3. Do males fail more classes on average than females? Hint: you'll group_by
# a variable and then summarize another.

#3@

# students %>%
#   __

#@3

# 4. Are the grades of students who are in romantic relationships lower than
# students who are single, on average? Hint: again, you're grouping by one
# variable and summarizing another.

#4@

# students %>%
#   __

#@4

# Now let's answer the question: "Do you have to study more than 10H per week to
# get an A?" That is, what percentage of A students study for more than 10H per
# week? We can filter, group_by, summarize, and then mutate:
students %>%
  filter(final_grade >= 90) %>%
  group_by(study_time) %>%
  summarize(n = n()) %>%
  mutate(percent = n / sum(n))

# Notice I use a new summarize helper function: n(). It just tallies how many
# observations belong in the group. Since group_by and summarize with n() is
# such a useful combination, dplyr wrapped up that combination in another
# function 'count'. Just remember: count is the same as group_by plus summarize
# plus n(). The code below does the same thing as above:
students %>%
  filter(final_grade >= 90) %>%
  count(study_time, name = "n") %>%
  mutate(percent = n / sum(n))

# So the answer to our question: just 11.8% of the A students studied more than
# 10 hours per week. The rest are studying much less.

# 5. Show that 58.8% of A students drink "very low" amounts of alcohol and only
# 5.88% drink "very high" amounts. You can use group_by with summarize, or you
# can use count.

#5@

# students %>%
#   __

#@5

# Read the qelp docs on 'group_by()':
?qelp::group_by

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.
