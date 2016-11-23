# Credit: http://stackoverflow.com/questions/10689055/create-an-empty-data-frame

t_create_empty_dataset <- function(num_rows = 1,
                                   num_cols = 1,
                                   row_names = NA,
                                   col_names = NA,
                                   init_value = NA) {

  frame <- as.data.frame(
    matrix(
      init_value,
      nrow = num_rows,
      ncol = num_cols))

  saved_option_warn <- getOption("warn")
  options(warn = -1)
  if (!is.na(row_names)) {rownames(frame) <- row_names}
  if (!is.na(col_names)) {colnames(frame) <- col_names}
  options(warn = saved_option_warn)

  invisible(frame)
}




}
