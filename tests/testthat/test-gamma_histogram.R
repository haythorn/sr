test_that("gamma histogram is stable", {
  # generating code in test_mask_histogram.R
  load(file = "fe_out.rda")
  vdiffr::expect_doppelganger("full embedding histogram",
                              gamma_histogram(fe_out, bins=32, caption="test plot"))
})
