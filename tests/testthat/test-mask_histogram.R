test_that("mask_histogram works", {
  # compare some results (one fe_search, multiple samples)
  #me <- embed(mgls, 9)
  #t <- me[ ,1]
  #p <- me[ ,2:9]
  #fe_out <- fe_search(p, t)
  #save(fe_out, file = "fe_out.rda")
  load(file = "fe_out.rda")
  vdiffr::expect_doppelganger("plot mask bits",
                              mask_histogram(fe_out[1:32, ], 8, caption="test plot"))

})
