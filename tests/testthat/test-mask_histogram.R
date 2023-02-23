test_that("mask_histogram works", {
  # compare some results (one fe_search, multiple samples)
  pt <- get_pt(8)
  p <- pt$p
  t <- pt$t
  fes <- fe_search(p, t)
  vdiffr::expect_doppelganger("plot mask bits", mask_histogram(fes[1:32, ], 8, caption="test plot"))

})
