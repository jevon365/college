#' # Housing Prices Project (part 2)
#'
#' In the previous file, we worked on modeling the relationship between `price`
#' and `area`. In this file, we'll work on building a model with all the variables
#' in the dataset, but with special attention to the variable `bedrooms`. The
#' interesting thing with `bedrooms` is that it's a variable that appears to
#' be very important in the simple regression context, but when you add all the
#' other variables in the dataset, it loses a lot of statistical significance
#' and you may wonder whether it even belongs in the full model at all.
#' Multicollinearity is the culprit: `bedrooms` is highly correlated with several
#' of the other variables and as a result, its slope estimate will not be biased,
#' but it will be measured imprecisely (large standard errors). At the end of
#' this file we'll think about some possible fixes.

library(tidyverse)
houses <- read_csv("https://raw.githubusercontent.com/cobriant/EC320Lab9/main/Housing.csv")

#'
#' # 1. Simple Regression
#'
#' First, visualize the relationship between `log(price)` amd `bedrooms` with a
#' scatterplot (use `geom_jitter` since bedrooms is discrete).
#' Then fit the model $log(price) = \beta_0 + \beta_1 bedrooms + u$ and interpret
#' the slope coefficient's estimate and statistical significance. You should find
#' that `bedrooms` seems to be an important factor in house price.

#'
#' # 2. Multiple Regression
#'
#' Here I fit a full model of `log(price)`. Notice in the lm formula, I can use
#' a `.` to indicate I want to include all the other variables in the dataset.
#'
#' Interpret the slope coefficient on `bedrooms` and its statistical significance.
#' You should find that, compared to the simple regression, when we include
#' the other variables in the dataset, `bedrooms` starts to lose significance.

houses %>%
  lm(log(price) ~ ., data = .) %>%
  broom::tidy()

#'
#' # 3. Multicollinearity
#'
#' The reason why `bedrooms` starts to lose significance when we add more
#' variables is that `bedrooms` is highly correlated with many of the other
#' explanatory variables. Show that this is true by finishing the code below
#' to coerce each factor variable to be numeric so that we can calculate the
#' correlation matrix. What are the 3 variables `bedrooms` is most correlated
#' with?

# houses %>%
#   mutate(
#     mainroad = if_else(mainroad == "yes", 1, 0),
#     guestroom = if_else(guestroom == "yes", 1, 0),
#     basement = __,
#     hotwaterheating = __,
#     airconditioning = __,
#     prefarea = __,
#     furnishingstatus = case_when(
#       furnishingstatus == "furnished" ~ 1,
#       furnishingstatus == "semi-furnished" ~ 0.5,
#       furnishingstatus == "unfurnished" ~ 0
#     )
#   ) %>%
#   cor() %>%
#   view()

#'
#' # 4. Frisch-Waugh-Lovell Theorem
#'
#' Multiple regression lets us describe the relationship between two variables,
#' *all others held constant*. We can use the FWL theorem to visualize that
#' relationship, and here's how:
#' Since we want to hold everything else constant, we'll clean `bedrooms` of its
#' correlations with the other explanatory variables by using `mutate` to transform
#' `bedrooms` to be the residual of this regression:
#' `bedrooms ~ area + bathrooms + stories + mainroad + ...`: everything except for
#' price. (Hint: you might want to use the `.` trick in the regression above paired
#' with `select(-price)` to drop the price variable).
#' Do the same thing for `price`: clean `log(price)` of its correlations with
#' all the other explanatory variables except for `bedrooms`.
#' Then plot those bedroom_residuals on the x-axis against the
#' log_price_residuals on the y-axis. The slope of the line of best fit will
#' be the same as the slope coefficient in the multiple regression from question 2.
#' This lets you see, all other variables held constant, whether or not `bedrooms`
#' seems to have a strong linear relationship with `log(price)`.

# houses %>%
#   mutate(
#     bedrooms_resid = residuals(__),
#     log_price_resid = residuals(__)
#   ) %>%
#   ggplot(aes(x = bedrooms_resid, y = log_price_resid)) +
#   geom_point() +
#   geom_smooth(method = lm)

#' # 5. Conclusion
#'
#' We've shown that `bedrooms` suffers from multicollinearity because it is highly
#' correlated with other explanatory variables in the regression. As a result,
#' the estimator for its effect on price will be unbiased, but imprecise (standard
#' errors are large and the estimate may be statistically insignificant when in
#' reality it's likely an important variable in the data generating process).
#'
#' There are a couple of potential fixes for multicollinearity:
#' 1. We can increase the precision of all of the estimates by:
#'    Adding more data to increase the sample size, or
#'    Including more explanatory variables to soak up more of the variation in u
#' 2. Combine the correlated variables into an overall index (example: a price
#'    index combines prices of all kinds of consumer goods and services)
#' 3. Drop some of the correlated variables if they have insignificant coefficients.
#'    The problem here is that this may cause omitted variable bias depending on
#'    what those variables are.
#'
#' A question for you: Which of these fixes, if any, would be possible? Why?
