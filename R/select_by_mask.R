#' Select Columns Using a Bitmask
#'
#' Selects columns from a matrix.  A column is included in the output when the
#' corresponding mask value is 1.
#' @export
#' @param data A Numeric vector or matrix in tidy form
#' @param intMask An Integer vector whose length equals number of columns in data
#' @return A matrix containing the columns of data for which intMask is 1
#' @examples
#' e2 <- embed(example2_data, 17)
#' tn <- e2[ , 1]
#' pn <- e2[ ,2:17]
#' msk <- integer(16)
#' msk[c(1,2,3,4,6,7,9)] <- 1  # select these columns
#' p <- select_by_mask(pn, msk)
#' gamma_test(predictors = p, target = tn)
#'
#' mask <- int_to_intMask(15, 16)     # pick out the first four columns
#' p <- select_by_mask(pn, mask)
#' get_Mlist(predictors = p, target = tn, by = 50)
#===========================================================
select_by_mask <- function(data, intMask) {
  #===========================================================

  if (ncol(data) != length(intMask)) {
    stop("Error: Mask length not equal to input column dimension")
  }

  indices <- which(intMask == 1)
  newData <- data[ ,indices]   # the input columns

  names(newData) <- names(data)[indices]  # is this necessary?

  return(newData)
}

