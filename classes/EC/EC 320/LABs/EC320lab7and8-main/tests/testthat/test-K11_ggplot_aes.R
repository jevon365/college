K11 <- read_file("../../R/K11_ggplot_aes.R")

test_that("K11: Question 1", {
  skip_incomplete(K11, 1)
  p <- parse_eval(str_match_q(K11, 1))
  expect_equal(names(p$facet$params$facets), "year")
})

test_that("K11: Question 2", {
  skip_incomplete(K11, 2)
  p <- parse_eval(str_match_q(K11, 2))
  expect_equal(p$labels$colour, "continent")
})

test_that("K11: Question 3", {
  skip_incomplete(K11, 3)
  p <- parse_eval(str_match_q(K11, 3))
  expect_equal(p$labels$colour, "continent")
  expect_equal(p$labels$fill, "year")
})

test_that("K11: Question 4", {
  skip_incomplete(K11, 4)
  p <- parse_eval(str_match_q(K11, 4))
  expect_equal(p$labels$shape, "continent")
})

test_that("K11: Question 5", {
  skip_incomplete(K11, 5)
  p <- parse_eval(str_match_q(K11, 5))
  expect_equal(p$labels$colour, "continent")
  expect_equal(p$labels$size, "pop")
})
