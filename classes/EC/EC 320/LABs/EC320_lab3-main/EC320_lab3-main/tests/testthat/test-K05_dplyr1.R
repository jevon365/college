K05 <- read_file("../../R/K05_dplyr1.R")

test_that("K05: Question 1", {
  skip_incomplete(K05, 1)
  s <- parse_eval(str_match_q(K05, 1))
  expect_true(all(names(s) == c("grade1", "grade2", "final_grade")))
})

test_that("K05: Question 2", {
  skip_incomplete(K05, 2)
  s <- parse_eval(str_match_q(K05, 2))
  expect_true("alcohol_consumption" %in% names(s))
})

test_that("K05: Question 3", {
  skip_incomplete(K05, 3)
  s <- parse_eval(str_match_q(K05, 3))
  expect_true(all(s$final_grade > 90))
})

test_that("K05: Question 4", {
  skip_incomplete(K05, 4)
  s <- parse_eval(str_match_q(K05, 4))
  expect_true(all(s$sex == "male") & all(s$study_time == "more than 10H"))
})

test_that("K05: Question 5", {
  skip_incomplete(K05, 5)
  s <- parse_eval(str_match_q(K05, 5))
  expect_true(
    all(
      all(s$grade1 < 90),
      all(s$grade1 > 80),
      all(s$final_grade > 90)
    )
  )
})
