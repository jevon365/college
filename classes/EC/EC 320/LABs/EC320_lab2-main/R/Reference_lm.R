#'                    Intro to the Tidyverse by Colleen O'Briant
#'                             Reference Sheet: lm
#'
#' This reference sheet will introduce you to the function `lm()`, which is used
#' to use ordinary least squares to fit a linear regression in R. "lm" stands for
#' "linear model". There are *NO TESTS* and *NO EXERCISES* here: just read this
#' over and reference back to it when you're asked to run regressions in your
#' problem sets.
library(tidyverse)
students <- read_csv(
  "https://raw.githubusercontent.com/cobriant/students_dataset/main/students.csv",
  show_col_types = FALSE
) %>%
  mutate(
    study_time = factor(study_time, levels = c("less than 2H", "2 - 5H", "5 - 10H", "more than 10H")),
    alcohol = factor(alcohol, levels = c("very low", "moderately low", "medium", "moderately high", "very high"))
  )

#' `lm()` fits a linear model to a dataset using the method of least-squares. Read
#' a little about how to use it here:
?qelp::lm

#' # 1 `broom::tidy()`
#'
#' Take the relationship between first-semester grades and final grades:
students %>%
  ggplot(aes(x = grade1, y = final_grade)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

#' The relationship looks very linear, so we might try linear regression to fit
#' the model: $final grade_i = \beta_0 + \beta_1 grade1_i + u_i$
#' This is how to estimate this simple regression using `lm()`:
students %>%
  lm(final_grade ~ grade1, data = .)

#' `lm()` outputs a "lm object" which has a bunch of information in it but prints
#' the bare minimum: the estimate for the intercept $\beta_0$ (-3.861) and the
#' estimate for the slope $\beta_1$ (1.042). These are the "coefficients".
#' To access other useful information like standard errors and p-values, use
#' `broom::tidy()`. Make sure to install the package `broom` by running this
#' code:
# install.packages("broom")
#' Then comment out or delete the previous line: you can't compile a document
#' which contains code where you install a package.
#' Here's me taking the code above and piping the lm object into `broom::tidy()`
#' to get a "tidied" (organized in a tibble) version of the regression output.
# students %>%
#   lm(final_grade ~ grade1, data = .) %>%
#   broom::tidy()

#' The standard errors, statistic, and p.value tell us in three different ways
#' how confident we can be in the estimates for the intercept and the slope.
#'
#' # 2 R-squared
#' `broom` has another function for accessing data about lm objects: it's
#' `broom::glance()`. This is useful especially for accessing the R-squared for
#' a regression, which you'll learn about a little later in the class.
# students %>%
#   lm(final_grade ~ grade1, data = .) %>%
#   broom::glance()

#' # 3 Fitted values and Residuals
#' The last thing you'll be asked to do in this class is to find the fitted
#' values and the residuals for a regression. There are two handy functions with
#' memorable names that I prefer for this task: `fitted.values()` and `residuals()`:

#+eval=F
students %>%
  lm(final_grade ~ grade1, data = .) %>%
  fitted.values()

students %>%
  lm(final_grade ~ grade1, data = .) %>%
  residuals()
