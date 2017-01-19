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

t_module_name = "t_inspect_dataset"
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
t_inspect_dataset <- function
(
  dataset,
  file = "Dataset_Inspection.txt",
  show = TRUE
)
#-----------------------------------------------------------
#' @title t_inspect_dataset()
#'
#' @description
#' \code{function_name} inspects a dataset and gives basic
#'  information about its contents
#'
#' @usage
#'   t_inspect_dataset(
#'     dataset,
#'     file = "filename",
#'     show = TRUE)
#'
#' @param dataset (data.frame, data.table)
#'   Dataset object.
#'  @param file (string)
#'    Filename to dump the inspection results to.
#'  @param show (logical)
#'    Print result file to screen.
#'
#' @details
#'   @section Operation
#'   Performs checks on datasets. The result is written to
#'   the output window AND to a file named in the "file"
#'   argument. This is necessary cause the generated text
#'   can not be fully read after operation in the output
#'   window.
#'   If a filename with ending, e. g. ".txt" is provided an
#'   external viewer is called. If the ending is omitted and
#'   the R internal viewer is called.
#'   @section Error Handling
#'   None.
#'   @section Side Effects
#'   This function uses sink(type = "output"). If
#'   sink(type = "output") is used before this might cause
#'   problems. See ?sink for more information.
#'
#' @return Nothing.
#'
#' @examples
#'   See test for this function later in this module.
#'
#' @concept data preparation exploration quality control
#'
#' @author Georg Maubach
#'
#' @source
#' Chapman, Chris: R for Marketing Research and Analytics,
#'   Heidelberg: Springer, 2015, p. 59
#'   (3.3.3 Recommended approach to inspecting data)
#-----------------------------------------------------------
{
  function_name <- "t_inspect_dataset()"
  cat(paste(function_name, "...\n"))  # indicate start
  #---------------------------------------------------------

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

  library(car)
  library(Hmisc)

  sink(
    file = file,
    type = "output",
    split = TRUE)

  cat('--- [ Check if superfluous header lines were loaded (head) ] ---\n\n')
  print(head(dataset))

  cat('\n\n--- [ Check for additional blank lines at the end (tail) ] ---\n\n')
  print(tail(dataset))

  cat('\n\n--- [ Check a set of randomly selected rows (some) ] ---\n\n')
  print(car::some(dataset))

  cat('\n\n--- [ First glance of the data (summary) ] ---\n\n')
  print(summary(dataset))

  cat('\n\n--- [ Data Overview (describe) ] ---\n\n')
  print(Hmisc::describe(dataset))

  cat('\n\n--- [ Duplicate cases ] ---\n\n')

  for (variable in colnames(dataset))
  {
    v_list <- t_find_duplicates_in_variable(
      variable = dataset[, variable])
    if (exists("d_duplicates"))
    {
      d_duplicates <- rbind(d_duplicates, v_list)
    } else
    {
      d_duplicates <- as.data.frame(v_list)
    }
  }
  v_list <- list(Variables = colnames(dataset))
  d_duplicates <- cbind(v_list, d_duplicates)
  print(d_duplicates)

  cat("---------- [ End of file ] ----------\n\n")

  sink(type = "output")

  if (show == TRUE)
  {
    file.show(file,
              header = paste0("Inspection Result: ", file),
              delete.file = FALSE)

    # %ToDo%
    # Here I would like to have the name of the dataset
    # handed over to the function, e. g. dataset = iris then
    # I would like to print "Inspection Result: iris".
    # Is there a way to achieve this?
  }

  #---------------------------------------------------------
  cat(paste("...", function_name, "\n"))  # indicate end
}
#-----------------------------------------------------------

# [ Test Defintion ]----------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {

    # Example dataset
    var1 <- c(1, 2, 3)
    var2 <- c(4, 5, 6)
    d_data1 <- data.frame(var1, var2)

    var3 <- c(7, 8, 9)
    var4 <- c(10, 11, 12)
    d_data2 <- data.frame(var3, var4)

    # Call function
    t_inspect_dataset(dataset = d_data1)
    t_inspect_dataset(
      dataset = d_data2,
      file = "Dataset_Inspection")  # without ending
    t_inspect_dataset(
      dataset = d_data2,
      file = "Dataset_Inspection.txt")  # with ending
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

