#' Moving Window Search
#'
#' Calculate Gamma values for a window moving through the data.
#'
#' This is used for data sets that are ordered on one or more dimension, such as
#' time series or spatial data.  The search slides a window across the data set,
#' calculating gamma for the data at each step  A change in causal dynamics will
#' appear as a spike in gamma when the causal discontinuity is in the window,
#' @export
#' @param predictors A Numeric vector or matrix whose columns are proposed inputs
#' to a predictive function
#' @param target A Numeric vector, the output variable that is to be predicted
#' @param plot Logical, set this to FALSE if you don't want the plot
#' @param caption Character string, caption for plot
#' @param window_size Integer width of the window that will move through the data
#' @param by The increment between successive window starts
#' @return An invisible data frame containing starting and ending positions of
#' each window with its associated gamma
#' @examples
#' he <- embed(henon_x, 17)
#' t <- he[ , 1]
#' p <- he[ ,2:17]
#' moving_window_gamma(p, t, caption = "my data")
#' mw <- moving_window_gamma(p, t, window_size = 100, plot = FALSE)
#===========================================================
moving_window_gamma <- function(predictors,
                                target,
                                window_size = 40,
                                by = 1,
                                plot = TRUE,
                                caption = "")
#===========================================================
{

  if (is.vector(predictors)) {
    predictors <- as.matrix(predictors)
  }

  n_windows <- (length(target) - window_size) / by
  output <- data.frame(starts=integer(n_windows), ends=integer(n_windows), Gamma=double(n_windows))
  output$starts <- (0:(n_windows-1) * by + 1)
  output$ends <- output$starts + window_size

  for (i in 1:n_windows) {
    p_in_window <- predictors[ output$starts[i]:output$ends[i], ]
    t_in_window <- target[ output$starts[i]:output$ends[i] ]
    output$Gamma[i] <- gamma_test(p_in_window, t_in_window)$Gamma
  }

  if(plot) {
    width <- output$ends[1] - output$starts[1]
    print(ggplot(data = output) +
      geom_line(mapping = aes(x = starts, y = Gamma)) +
      scale_x_continuous(breaks = output$starts, labels = as.character(output$starts)) +
      labs(title = "Moving Window Gamma Search",
           caption = caption,
           subtitle = paste("Each window contains ", width, " data points"),
           x = "Window start",
           y = "Gamma"
      ))
  }

  invisible(output)
}

