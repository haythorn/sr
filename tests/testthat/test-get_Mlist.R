test_that("get_Mlist works", {
  pt <- get_pt(8)
  p <- pt$p
  t <- pt$t

  # plot
  vdiffr::expect_doppelganger("basic Mlist works", get_Mlist(p,t, caption="test plot"))

  # vector input
  p1 <- as.vector(select_by_mask(p,int_to_intMask(1,8)))
  vdiffr::expect_doppelganger("Mlist on vector input", get_Mlist(p1, t))

  # data.frame input equals matrix
  ml <- get_Mlist(p,t)
  expect_equal(get_Mlist(as.data.frame(p), t), ml)

  # sample lengths multiples of by
  vdiffr::expect_doppelganger("Mlist on non modular length", get_Mlist(p,t, by = 22, caption="test plot"))

})
