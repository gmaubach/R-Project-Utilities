#-----------------------------------------------------------
# Organisation: Wein Wolf Import GmbH & Co. Verwaltungs KG
# Department  : Sales
# Author      : Georg Maubach
# Contributors: n/a
#
# Copyright (C) 2016,
#     Wein Wolf Import GmbH & Co. Verwaltungs KG
#
# This program is free software; you can redistribute it
# and/or modify it under the terms of the GNU General Public
# License Version 2 as published by the Free Software
# Foundation.
# (https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
#
# This program is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
# PURPOSE.
#-----------------------------------------------------------

t_module_name = "t_delete_empty_variables.R"
t_version = "2017-01-10"
t_status = "released"

cat(
  paste0(
    "\n",
    t_module_name,
    " (Version: ",
    t_version,
    ", Status: ",
    t_status,
    ")",
    "\n\n",
    "This software comes with ABSOLUTELY NO WARRANTY.",
    "\n\n"
  )
)

# If do_test is not defined globally define it here locally
# by un-commenting it. Switch t_do_test to TRUE to run test.
t_do_test <- FALSE

#-----------------------------------------------------------
t_delete_empty_variables <- function
(
  dataset
)
#-----------------------------------------------------------
#' @title t_delete_empty_variables()
#'
#' @description
#' \code{function_name} deletes variables with all NA from
#' dataset.
#'
#' @usage
#'   t_delete_empty_variables(dataset = iris)
#'
#' @param dataset (data frame, data table)
#'   A dataset.
#'
#' @details
#'   Function checks if all cases are missing for a
#'   variable. If so, the variable is deleted from the
#'   dataset.
#'
#' @return Returns the given dataset without the variables
#' which were discovered as empty.
#'
#' @examples
#'   See test.
#'
#' @include filename.R to be loaded before this function
#'
#' @author Georg Maubach
#-----------------------------------------------------------
{
  function_name <- "t_delete_empty_variables()"
  cat(paste(function_name, "...\n"))  # indicate start
  #---------------------------------------------------------

  n_cases <- nrow(dataset)

  deleted_variables <- c()

  for (variable in names(dataset))
  {
    n_miss <- sum(is.na(dataset[[variable]]))
    if (n_cases == n_miss)  # all missing
    {
      dataset[[variable]] <- NULL
      deleted_variables <- c(deleted_variables, variable)
    }
  }

  cat(
    paste0(
      "Deleted ",
      length(deleted_variables),
      " empty variables.\n"))
  print(deleted_variables)

  #---------------------------------------------------------
  cat(paste("...", function_name, "\n"))  # indicate end

  return(dataset)
}
#-----------------------------------------------------------

# [ Test Defintion ]----------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    # Example dataset
    # To be done
    ds_test <- data.frame()

    # Call function
    # To be done

    # Dataset after function call
    invisible(ds_test)
  }
}

# [ Test Run ]----------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]----------------------------------------------
rm("t_module_name",
   "t_version",
   "t_status",
   "t_do_test",
   "t_test")

# EOF .

