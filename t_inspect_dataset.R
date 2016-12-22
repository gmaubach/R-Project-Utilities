#-------------------------------------------------------------------------------
# Module        : t_inspect_dataset.R
# Author        : Georg Maubach
# Date          : 2016-08-15
# Update        : 2016-12-22
# Description   : Load dataset and print information on contents
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_module_name = "t_inspect_dataset"
t_version = "2016-12-22"
t_status = "released"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ", Status: ", t_status, ")", "\n", "\n",
         "Copyright (C) Georg Maubach 2016

This software comes with ABSOLUTELY NO WARRANTY.", "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
# Switch t_do_test to TRUE to run test
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_inspect_dataset <- function(dataset) {
  # Inspects a dataset and gives basic information about its contents.
  #
  # Args:
  #  dataset
  #    Data frame object.
  #
  # Operation:
  #   Performs checks on datasets.
  #
  # Returns:
  #   Nothing.
  #
  # Error handling:
  #   None.
  #
  # Credits:
  #   Chapman, Chris: R for Marketing Research and Analytics,
  #   Heidelberg: Springer, 2015, p. 59
  #   (3.3.3 Recommended approach to inspecting data)
  #-----------------------------------------------------------------------------

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


  cat("---------- [ t_inspect_dataset() ] ----------\n\n")
  library(car)
  library(Hmisc)

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

  cat("---------- [ Done ] ----------\n\n")
}

# [ Test Defintion ]------------------------------------------------------------
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
    t_inspect_dataset(dataset = d_data2)
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF

