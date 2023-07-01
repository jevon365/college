K12 <- read_file("../../R/K12_ggplot_geom.R")

test_that("K12: Question 1", {
  skip_incomplete(K12, "01")
  p <- parse_eval(str_match_q(K12, "01"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomBar")
})

test_that("K12: Question 2", {
  skip_incomplete(K12, "02")
  p <- parse_eval(str_match_q(K12, "02"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomBar")
})

test_that("K12: Question 3", {
  skip_incomplete(K12, "03")
  p <- parse_eval(str_match_q(K12, "03"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomPath")
})

test_that("K12: Question 4", {
  skip_incomplete(K12, "04")
  p <- parse_eval(str_match_q(K12, "04"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomArea")
})

test_that("K12: Question 5", {
  skip_incomplete(K12, "05")
  p <- parse_eval(str_match_q(K12, "05"))
  expect_equal(class(p$layers[[1]]$position)[[1]], "PositionDodge")
})

test_that("K12: Question 6", {
  skip_incomplete(K12, "06")
  p <- parse_eval(str_match_q(K12, "06"))
  expect_equal(names(p$layers[[1]]$aes_params), "alpha")
})

test_that("K12: Question 7", {
  skip_incomplete(K12, "07")
  p <- parse_eval(str_match_q(K12, "07"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomDensity")
})

test_that("K12: Question 8", {
  skip_incomplete(K12, "08")
  p <- parse_eval(str_match_q(K12, "08"))
  expect_equal(names(p$layers[[1]]$aes_params), "alpha")
})

test_that("K12: Question 9", {
  skip_incomplete(K12, "09")
  p <- parse_eval(str_match_q(K12, "09"))
  expect_equal(class(p$layers[[2]]$geom)[[1]], "GeomVline")
})

test_that("K12: Question 10", {
  skip_incomplete(K12, "10")
  p <- parse_eval(str_match_q(K12, "10"))
  expect_equal(class(p$layers[[2]]$geom)[[1]], "GeomVline")
})

test_that("K12: Question 11", {
  skip_incomplete(K12, "11")
  p <- parse_eval(str_match_q(K12, "11"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomPoint")
})

test_that("K12: Question 12", {
  skip_incomplete(K12, "12")
  p <- parse_eval(str_match_q(K12, "12"))
  expect_equal(class(p$layers[[2]]$geom)[[1]], "GeomSmooth")
})

test_that("K12: Question 13", {
  skip_incomplete(K12, "13")
  p <- parse_eval(str_match_q(K12, "13"))
  expect_equal(class(p$layers[[2]]$geom)[[1]], "GeomSmooth")
})

test_that("K12: Question 14", {
  skip_incomplete(K12, "14")
  p <- parse_eval(str_match_q(K12, "14"))
  expect_equal(class(p$layers[[2]]$geom)[[1]], "GeomSmooth")
})

test_that("K12: Question 15", {
  skip_incomplete(K12, "15")
  p <- parse_eval(str_match_q(K12, "15"))
  expect_equal(p$labels$x, "log(gdpPercap)")
})

test_that("K12: Question 16", {
  skip_incomplete(K12, "16")
  p <- parse_eval(str_match_q(K12, "16"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomHex")
})

test_that("K12: Question 17", {
  skip_incomplete(K12, "17")
  p <- parse_eval(str_match_q(K12, "17"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomLine")
})

test_that("K12: Question 18", {
  skip_incomplete(K12, "18")
  p <- parse_eval(str_match_q(K12, "18"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomBoxplot")
})

test_that("K12: Question 19", {
  skip_incomplete(K12, "19")
  p <- parse_eval(str_match_q(K12, "19"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomViolin")
})
