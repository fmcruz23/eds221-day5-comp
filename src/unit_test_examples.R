# Testing testthat 

# Requires packages: 
install.packages("testthat")
install.packages("devtools")
install.packages("remotes")
library(testthat)

# Create a function that takes any numeric df, finds mean of all columns, then finds the max column mean and the min column mean, and returns those min and max mean values in a vector (min_mean_value, max_mean_value)

# apply(df, MARGIN = 2, FUN, na.rm = TRUE)
#' Range of means 
#' This function calculates minimum and maximum means of columns of a data frame
#'
#' @param df data frame
#'
#' @return
#' @export
#'
#' @examples
min_and_max_means <- function(df) {
  all_column_means <- apply(df, 2, mean, na.rm = TRUE)
  max_mean <- max(all_column_means)
  min_mean <- min(all_column_means)
  return(c(min_mean, max_mean))
}
min_and_max_means(mtcars)

# Tests
expect_length(min_and_max_means(df = mtcars), 3)

expect_true(min_and_max_means(mtcars)[1] < min_and_max_means(mtcars)[2])

expect_type(min_and_max_means(mtcars), "double")
