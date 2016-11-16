t_get_variable_types <- function(dataset) {

  variable_types <- data.frame(
    matrix(NA, length(names(dataset)), 2)
  )
  rownames(variable_types) <- names(dataset)
  colnames(variable_types) <- c("Type", "Countable")

  for (name in names(dataset)) {
    if (inherits(dataset[, name], "numeric")) {
      variable_types[name, "Type"] <- "numeric"
      variable_types[name, "Countable"] <- TRUE
    } else if (inherits(dataset[, name], "logical")) {
      variable_types[name, "Type"] <- "logical"
      variable_types[name, "Countable"] <- TRUE
    } else if (inherits(dataset[, name], "factor")) {
      variable_types[name, "Type"] <- "factor"
      variable_types[name, "Countable"] <- TRUE
    } else if (inherits(dataset[, name], "character")) {
      variable_types[name, "Type"] <- "character"
      variable_types[name, "Countable"] <- FALSE
    } else {
      variable_types[name, "Type"] <- "other"
      variable_types[name, "Countable"] <- FALSE
    }
  }

  invisible(variable_types)
}
