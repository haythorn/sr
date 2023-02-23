test_that("fe_search works", {
  # successful tests, e.g. math is covered by gamma_histogram tests
  # a couple of failure tests:
  x <- 1:500
  expect_error(fe_search(x, x))

  # vector, matrix, data.frame
  # a couple of outputs
})
