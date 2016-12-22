t_find_duplicates_in_variable <- function(variable)
{
  v_is_na <- is.na(variable)
  v_variable <- variable[!v_is_na]
  v_values <- length(v_variable)
  v_unique <- length(unique(v_variable))
  v_duplicates <- v_values - v_unique

  v_list <- list(
    Values = v_values,
    Unique = v_unique,
    Duplicates = v_duplicates,
    NAs        = sum(v_is_na))

  invisible(v_list)
}
