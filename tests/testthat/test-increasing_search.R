test_that("increasing search works", {
  pt <- get_pt(8)
  p <- pt$p
  t <- pt$t

  # plot is stable so calculation is stable
  vdiffr::expect_doppelganger("standard increasing search", increasing_search(p,t, caption="test plot"))

  # vector input is not accepted
  p1 <- as.vector(select_by_mask(p,int_to_intMask(1,8)))
  expect_error(increasing_search(p1, t))

  # data.frame input equals matrix input, looking at output arrays
  ml <- increasing_search(p,t)
  expect_equal(increasing_search(as.data.frame(p), t), ml)

})
