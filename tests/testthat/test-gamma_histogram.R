test_that("gamma histogram is stable", {
  # have to present fe_result
  me <- embed(mgls, 9)
  t <- me[ ,1]
  p <- me[ ,2:9]
  fe_out <- fe_search(p, t)
  vdiffr::expect_doppelganger("full embedding histogram",
                              gamma_histogram(fe_out, bins=32, caption="test plot"))
})
