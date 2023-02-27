#' Mask histogram - display a histogram of mask bits.
#'
#' After a full embedding search, it is sometimes useful to see which bits
#' appear in a subset of the masks, for example, the masks with the lowest Gamma
#' values.  Filtering of the search results should be done before calling this
#' function, which uses whatever it is given.  The histogram can show which
#' predictors are generally useful.  For selecting an effective mask it isn't as
#' useful as you might think - it doesn't show interactions between predictors,
#' for mask selection it would only work for linear combinations of inputs.
#'
#' @export
#' @param fe_result Output data frame from fe_search.  Normally you would filter
#' this by, for example, selecting the top 100 results from that output
#' @param dimension Integer number of effective columns in a mask, ncol of the
#' predictors given to the search
#' @param tick_step Integer, where to put ticks on the x axis
#' @param caption A character string you can use to identify this graph
#' @examples
#' e2_embed6 <- embed(example2_data, 9)
#' t <- e2_embed6[ ,1]
#' p <- e2_embed6[ ,2:9]
#' full_search <- fe_search(predictors = p, target = t)
#' goodies <- full_search[1:10, ]
#' mask_histogram(goodies, 8, caption = "mask bits in top 10 Gammas")
#'
#' baddies <- tail(full_search, 10)
#' mask_histogram(baddies, 8, caption = "bits appearing in 10 worst gammas")
mask_histogram <- function(fe_result,
                           dimension,
                           tick_step = 2,
                           caption = "") {
  temp <- integer(dimension)
  for (i in 1:nrow(fe_result)) {
    temp <- temp + int_to_intMask(fe_result[ i, ]$mask, dimension)
  }
  # plot labels, seems like I'm missing an easier solution but here it is
  ticks <- seq(from = 1, to = dimension, by = tick_step)
  idx <- NULL
  ggplot(data = data.frame(idx = 1:dimension, temp),
         aes(x = idx, y = temp)) +
    geom_col(fill = "blue") +
    scale_x_continuous(breaks = ticks) +
    labs(
      title = "Distribution of masks",
      caption = caption,
      x = "Position",
      y = "Count"
    )
}
