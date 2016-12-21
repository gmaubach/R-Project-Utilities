t_frequencies <- function(variable,
                          sort = FALSE,  # sort freq
                          decimals = 1,  # round to decimals
                          useNA = "always")
{
  if (sort)
  {
    v_abs <- sort(table(variable, useNA = useNA))
  } else
  {
    v_abs <- table(variable, useNA = useNA)
  }

  v_rel <- round(100 * prop.table(v_abs),
                 decimals)

  v_abs_kum <- cumsum(v_abs)
  v_rel_kum <- cumsum(v_rel)

  v_table <-
    cbind(v_abs, v_rel, v_abs_kum, v_rel_kum)
  if (is.na(rownames(v_table)[nrow(v_table)]))
  {
    rownames(v_table)[nrow(v_table)] <- "NA"
  }

  c_row = 1
  v_sum <- addmargins(v_table, c_row)
  v_table <- cbind(v_sum)

  v_result_table <- v_table
  v_result_table["Sum", "v_abs_kum"] <- NA
  v_result_table["Sum", "v_rel_kum"] <- NA
  colnames(v_result_table) <-
    c("abs", "rel", "abs_kum", "rel_kum")

  cat("\n")
  print(v_result_table)

  invisible(v_result_table)
}
