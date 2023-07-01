K04 <- read_file("../../R/K04_ggplot_intro.R")

test_that("K04: Question 1a", {
  skip_incomplete(K04, "1a")
  expect_true(parse_eval(str_match_q(K04, "1a")) == 9)
})

test_that("K04: Question 1b", {
  skip_incomplete(K04, "1b")
  expect_true(parse_eval(str_match_q(K04, "1b")) == 374)
})

test_that("K04: Question 1c", {
  skip_incomplete(K04, "1c")
  expect_true(str_detect(str_match_q(K04, "1c"), "names\\(\\s*students\\s*\\)"))
})

test_that("K04: Question 2", {
  skip_incomplete(K04, 2)
  p <- parse_eval(str_match_q(K04, 2))
  expect_true(
    all(
      class(p$layers[[1]]$geom)[[1]] == "GeomBar",
      p$labels$x == "sex"
    )
  )
})

test_that("K04: Question 3", {
  skip_incomplete(K04, 3)
  p <- parse_eval(str_match_q(K04, 3))
  expect_true(
    all(
      class(p$layers[[1]]$geom)[[1]] == "GeomBar",
      p$labels$x == "alcohol"
    )
  )
})

test_that("K04: Question 4", {
  skip_incomplete(K04, 4)
  p <- parse_eval(str_match_q(K04, 4))
  expect_true(
    all(
      class(p$layers[[1]]$geom)[[1]] == "GeomBar",
      p$labels$x == "final_grade"
    )
  )
})

test_that("K04: Question 5", {
  skip_incomplete(K04, 5)
  p <- parse_eval(str_match_q(K04, 5))
  expect_true(
    all(
      class(p$layers[[1]]$geom)[[1]] == "GeomBar",
      p$labels$x == "study_time"
    )
  )
})


test_that("K04: Question 6", {
  skip_incomplete(K04, 6)
  p <- parse_eval(str_match_q(K04, 6))
  expect_true(
    all(
      class(p$layers[[1]]$geom)[[1]] == "GeomBar",
      p$labels$x == "romantic"
    )
  )
})

test_that("K04: Question 7", {
  skip_incomplete(K04, 7)
  p <- parse_eval(str_match_q(K04, 7))
  expect_true(
    all(
      class(p$layers[[1]]$geom)[[1]] == "GeomPoint",
      "grade1" %in% p$labels,
      "grade2" %in% p$labels
    )
  )
})

test_that("K04: Question 8", {
  skip_incomplete(K04, 8)
  p <- parse_eval(str_match_q(K04, 8))
  expect_true(
    all(
      class(p$layers[[1]]$geom)[[1]] == "GeomPoint",
      "absences" %in% p$labels,
      "grade2" %in% p$labels
    )
  )
})

test_that("K04: Question 9", {
  skip_incomplete(K04, 9)
  p <- parse_eval(str_match_q(K04, 9))
  expect_true(
    all(
      class(p$layers[[1]]$geom)[[1]] == "GeomBoxplot",
      "alcohol" %in% p$labels,
      "final_grade" %in% p$labels
    )
  )
})

test_that("K04: Question 10", {
  skip_incomplete(K04, 10)
  p <- parse_eval(str_match_q(K04, 10))
  expect_true(
    all(
      class(p$layers[[1]]$geom)[[1]] == "GeomBar",
      str_detect(
        str_match_q(K04, 10), "aes\\(x\\s*=\\s*romantic\\s*,\\s*fill\\s*=\\s*sex\\s*\\)"
        ) | str_detect(
          str_match_q(K04, 10), "aes\\(x\\s*=\\s*sex\\s*,\\s*fill\\s*=\\s*romantic\\s*\\)"
        ) | str_detect(
          str_match_q(K04, 10), "facet_wrap\\(\\s*~\\s*sex\\s*\\)"
        ) | str_detect(
          str_match_q(K04, 10), "facet_wrap\\(\\s*~\\s*romantic\\s*\\)"
        )
    )
  )
})
