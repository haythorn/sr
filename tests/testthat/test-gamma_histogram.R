test_that("gamma histogram is stable", {
  # have to present fe_result
  pt <- get_pt(8)
  p <- pt$p
  t <- pt$t
  fes <- fe_search(p, t)
  vdiffr::expect_doppelganger("full embedding histogram", gamma_histogram(fes, bins=32, caption="test plot"))
})
