# Credit: http://stackoverflow.com/questions/10689055/create-an-empty-data-frame

t_create_empty_dataset <- function(num_rows, num_cols) {
  frame <- data.frame(matrix(NA, nrow = num_rows, ncol = num_cols))
  return(frame)
}
