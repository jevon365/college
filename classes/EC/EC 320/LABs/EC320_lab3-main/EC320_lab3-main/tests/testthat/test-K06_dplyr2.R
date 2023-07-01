K06 <- read_file("../../R/K06_dplyr2.R")

test_that("K06: Question 1", {
  skip_incomplete(K06, 1)
  s <- parse_eval(str_match_q(K06, 1))
  expect_true(all(s$final_grade[1:3] < 50))
})

test_that("K06: Question 2", {
  skip_incomplete(K06, 2)
  s <- parse_eval(str_match_q(K06, 2))
  expect_true(all(s$failures[1:10] == 3))
})

test_that("K06: Question 3", {
  skip_incomplete(K06, 3)
  s <- parse_eval(str_match_q(K06, 3))
  expect_true(all(s$absences[1:3] == c(75, 56, 54)))
})

test_that("K06: Question 4", {
  skip_incomplete(K06, 4)
  s <- parse_eval(str_match_q(K06, 4))
  expect_true(nrow(s) == 13)
})

test_that("K06: Question 5", {
  skip_incomplete(K06, 5)
  s <- parse_eval(str_match_q(K06, 5))
  expect_true(all(
    nrow(s) == 5, all(s$final_grade > 95), all(s$sex == "female")
  ))
})

test_that("K06: Question 6", {
  skip_incomplete(K06, 6)
  s <- parse_eval(str_match_q(K06, 6))
  expect_true(s$alcohol[1] == 2)
})
