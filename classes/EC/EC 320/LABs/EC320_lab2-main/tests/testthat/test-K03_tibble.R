K03 <- read_file("../../R/K03_tibble.R")

test_that("K03: Question 1", {
  skip_incomplete(K03, 1)
  expect_true(all(c(
    str_detect(str_match_q(K03, 1)[[1]],
               'sex\\s*=\\s*c\\(\\s*"male"\\s*,\\s*"female"\\s*,\\s*"male"\\s*\\)'),
    str_detect(str_match_q(K03, 1)[[1]], "study_time\\s*=\\s*c\\(\\s*0\\s*,\\s*12\\s*,\\s*8\\s*\\)"),
    str_detect(str_match_q(K03, 1)[[1]], "grade\\s*=\\s*c\\(\\s*84\\s*,\\s*72\\s*,\\s*90\\s*\\)")
  )))
})

test_that("K03: Question 2", {
  skip_incomplete(K03, 2)
  expect_true(
    all(
      str_detect(str_match_q(K03, 2)[[1]], "nrow\\(\\s*student_sampleA\\s*\\)\\s*==\\s*3"),
      str_detect(str_match_q(K03, 2)[[1]], "ncol\\(\\s*student_sampleA\\s*\\)\\s*==\\s*3")
    )
  )
})

test_that("K03: Question 3", {
  skip_incomplete(K03, 3)
  expect_true(
    all(
      parse_eval(str_match_q(K03, 3)[[1]])
    )
  )
})

test_that("K03: Question 4", {
  skip_incomplete(K03, 4)
  expect_true(
      nrow(parse_eval(str_match_q(K03, 4)[[1]])) == 4
  )
})
