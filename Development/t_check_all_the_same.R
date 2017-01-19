#-------------------------------------------------------------------------------
# Module        : t_check_all_the_same.R
# Author        : Georg Maubach
# Date          : 2016-07-24
# Update        : 2016-07-24
# Description   : Check if the elements of an object are all the same
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-07-24"
t_module_name = "t_check_all_the_same.R"
t_status = "released"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ", Status: ", t_status, ")", "\n", "\n",
         "Copyright (C) Georg Maubach 2016
         This software comes with ABSOLUTELY NO WARRANTY.", "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_check_all_the_same <- function(object) {
  # Check if the elements of an object are all the same
  #
  # Args:
  #   object (vector, list, data.frame):
  #     Object with elements
  #
  # Operation:
  #   Checks if the elements of the given object are all the same.
  #
  # Returns:
  #   TRUE if the elements within object are all the same.
  #   FALSE otherwise.
  #
  # Error handling:
  #   None.
  #
  # Credits: Grolemund, Garrett: Hands-on Programming with R, Sebastopol: O'Reilly,
  #          1st Edition, 2014, Chapter 7 - Programs, p. 127
  
  if (length(unique(object)) == 1) {
    return (TRUE)
  } else {
    return (FALSE)
  }
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    temp <- c(1, 2, 3, 4, 5)
    result <- t_check_all_the_same(object = temp)
    cat(paste0("\n", "The values of c(1, 2, 3, 4, 5) are all unique: ", result, "\n"))
    temp <- c(1, 1, 1, 1, 1)
    result <- t_check_all_the_same(object = temp)
    cat(paste0("\n", "The values of c(1, 1, 1, 1, 1) are all unique: ", result, "\n"))
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF .