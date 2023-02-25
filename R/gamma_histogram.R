
#' Plot Histogram of Gammas
#'
#' Produce a histogram showing the distribution in a population of gamma
#' values, used to examine the result of a full embedding search.  Pass the result
#' of fe_search() Use this function to look for structure
#' in the predictors.  For example, it this histogram is bimodal, there is probably
#' one input variable which is absolutely required for a good predictive function.
#' @export
#' @param fe_results The result of fe_search or full_embedding_search.  A matrix
#' containing a column labeled x, of Numeric gamma values.
#' It also contains an integer column of masks, but that is not used by this function.
#' @param bins Numeric, number of bins in the histogram
#' @param caption Character string caption for the plot
#' @examples
#' e2_embed6 <- embed(example2_data, 7)
#' t <- e2_embed6[ ,1]
#' p <- e2_embed6[ ,2:7]
#' full_search <- fe_search(predictors = p, target = t)
#' gamma_histogram(full_search, caption = "my data")
#===========================================================
gamma_histogram <- function(fe_results, bins = 100, caption = "")
  #===========================================================
{
  ggplot(fe_results, aes(x = Gamma)) +
    geom_histogram(bins=bins, color="#000000", fill="blue") +
    labs(
      title = paste("Distribution of ", nrow(fe_results), " Gammas"),
      caption = caption,
      x = "Gamma values",
      y = "Count"
    )
}

