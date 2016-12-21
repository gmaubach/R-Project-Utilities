#-------------------------------------------------------------------------------
# Module        : t_select_variables_by_type.R
# Author        : Georg Maubach
# Date          : 2016-06-23
# Update        : 2016-06-23
# Description   : Merge two variables
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_module_name = "t_select_variables_by_type.R"
t_version = "2016-06-23"
t_status = "testing"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ", Status: ", t_status, ")", "\n", "\n",
         "Copyright (C) Georg Maubach 2016

This software comes with ABSOLUTELY NO WARRANTY.", "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
# Switch t_do_test to TRUE to run test
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_select_variables_by_type <- function(dataset,
                                       type) {
  # Select variable by variable type
  #
  # Args:
  #  dataset (data frame, data table):
  #    Object with dimnames, e.g. data frame, data table.
  #  type (character):
  #    An atomic character vector with object modes,
  #    e. g. "numeric", "character", "factor", etc.,
  #    for a variable within a dataset.
  #
  # Operation:
  #   Selects the variable of the given "type" using the inherits function.
  #
  # Returns:
  #   Character vector with matching variable names.
  #
  # Error handling:
  #   None.
  #
  # Credits:
  #   https://stat.ethz.ch/pipermail/r-help/2016-May/438383.html

  selection <- sapply(dataset, function(x) {inherits(x, type)})
  return(names(dataset)[selection])
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    # Example dataset
    # To be done
    ds_test <- data.frame()

    # Call function
    # To be done

    # Dataset after function call
    ds_test
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF
