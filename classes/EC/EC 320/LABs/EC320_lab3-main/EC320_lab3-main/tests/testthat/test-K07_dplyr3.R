K07 <- read_file("../../R/K07_dplyr3.R")

test_that("K07: Question 1", {
  skip_incomplete(K07, 1)
  s <- parse_eval(str_match_q(K07, 1))
  expect_true(all(
    near(s[[1, 1]], 91.6, tol = .1),
    near(s[[1, 2]], 92.2, tol = .1)
  ))
})

test_that("K07: Question 2", {
  skip_incomplete(K07, 2)
  s <- parse_eval(str_match_q(K07, 2))
  expect_true(
    near(s[[1, 1]], 4.59, tol = .1)
  )
})

test_that("K07: Question 3", {
  skip_incomplete(K07, 3)
  s <- parse_eval(str_match_q(K07, 3))
  expect_true(
    all(
      near(s[[1, 2]], .283, tol = .01),
      near(s[[2, 2]], .369, tol = .01)
    )
  )
})

test_that("K07: Question 4", {
  skip_incomplete(K07, 4)
  s <- parse_eval(str_match_q(K07, 4))
  expect_true(
    all(
      near(s[[1, 2]], 74.7, tol = .1),
      near(s[[2, 2]], 71.9, tol = .1)
    )
  )
})

test_that("K07: Question 5", {
  skip_incomplete(K07, 5)
  s <- parse_eval(str_match_q(K07, 5))
  expect_true(
    near(s[[1, ncol(s)]], .588, tol = .01)
  )
})
