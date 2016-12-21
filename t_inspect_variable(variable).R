t_inspect_variable <- function(variable,
                               elements = 10,
                               decimals = 1)
{
  cat("\nFirst elements \n")
  print(head(variable, n = elements))

  cat("\nLast elements \n")
  print(tail(variable, n = elements))

  cat(paste("\nSome random elements in the middle", "\n"))
  v_retain <- sample(length(variable), size = elements)
  print(variable[v_retain])

  if (inherits(x = variable,
               what = "factor") |
      inherits(x = variable,
               what = "ordered"))
  {
    v_abs <- sort(table(variable), useNA = "always")
    v_rel <- round(
      100 * prop.table(v_abs),
      decimals)

    v_abs_kum <- cumsum(v_abs)
    v_rel_kum <- cumsum(v_rel)

    v_table <-
      cbind(v_abs, v_rel, v_abs_kum, v_rel_kum)
    c_row = 1

    v_sum <- addmargins(v_table, c_row)
    v_table <- cbind(v_sum)

    v_result_table <- data.frame(v_table)
    print(v_result_table)
    v_result_table["Sum", "v_abs_kum"] <- NA
    v_result_table["Sum", "v_rel_kum"] <- NA

    cat("\n")
    print(v_result_table)

    invisible(v_result_table)
  }

  if (inherits(x = variable,
               what = "numeric"))
  {
    # to be done
  }

  if (inherits(x = variable,
               what = "character"))
  {
    # to be done
  }

  invisible(0)
}


