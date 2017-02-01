#-----------------------------------------------------------
# Organisation: Wein Wolf Import GmbH & Co. Verwaltungs KG
# Department  : Sales
# Author      : Georg Maubach
#
# Copyright (C) 2016,
#     Wein Wolf Import GmbH & Co. Verwaltngs KG
# All rights reserved.
#
# Custom-build function. Distribution prohibited!
#-----------------------------------------------------------

cat("\nDefining f_create_subset() ...\n")

#-----------------------------------------------------------
t_create_subset <- function
(
  dataset = ds_prepared_6,
  group_variable = NA,
  group = NA
)
#-----------------------------------------------------------
#' @title t_create_subset.R
#'
#' @description
#' Create a subset using one variable and one value.
#'
#' @usage
#'   t_create_subset(
#'     dataset = my_data.RData,
#'     group_variable = "variale_name",
#'     group = value)
#'
#' @details
#'   Creates a subset from a dataset.
#'
#' @param dataset (data.frame)
#' @param group_variable (string)
#' @param group (value of the same type as group_variable)
#'
#' @return Returns a subset of the given dataset.
#'
#' @author Georg Maubach
#'
#-----------------------------------------------------------
{
  function_name <- "t_create_subset()"
  cat(paste(function_name, "...\n"))
  #---------------------------------------------------------

  # Check if parameters given
  if (!is.na(group_variable) & !is.na(group)) {
    cat(paste0(
      "\nUsing variable '", group_variable,
      "' with entry '", group,
      "' to create sub group!\n"
      )
    )

    # Create sub group
    subset <- dataset[dataset[group_variable] == group , ]

    # Check if correct sub group values were selected
    check <- length(unique(subset[group_variable]))
    if (check == 1) {
      check_result <- "OK"
    } else {
      check_result <- "FAILED"
    }

    cat(paste0(
      check,
      " unique value(s) in group variable '",
      group_variable,
      "' (should be 1).\n")
    )

    cat(paste0("Check ",
      check_result,
      "!\n\n"
      )
    )
  } else {
    cat("\n\nDoing analysis on the whole dataset!\n\n")
    subset <- dataset
  }

  #---------------------------------------------------------
  cat(paste("...", function_name, "\n"))

  invisible(subset)
}
#-----------------------------------------------------------
cat("Done!\n")

# EOF .
