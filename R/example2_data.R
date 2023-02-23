#' Mackey-Glass with added noise
#'
#' 4999 data points
#'
#' @docType data
#'
#' @usage example2_data
#'
#' @keywords datasets
#'
#' @references Described in vignette 1_time_series_with_sr
#'
#' @examples
#' ex2_embedded <- embed(as.matrix(example2_data), 25)
#' targets <- ex2_embedded[ ,1]
#' predictors <- ex2_embedded[ ,2:25]
#' gamma_test(predictors, targets)
"example2_data"
