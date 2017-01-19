#-------------------------------------------------------------------------------
# Module        : t_check_element_in_list
# Author        : Georg Maubach
# Date          : 2016-07-24
# Update        : 2016-07-24
# Description   : Check if all elements of an object are elements of a list
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-07-24"
t_module_name = "t_check_element_in_list.R"
t_status = "released"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ", Status: ", t_status, ")", "\n", "\n",
         "Copyright (C) Georg Maubach 2016
         This software comes with ABSOLUTELY NO WARRANTY.", "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_check_element_in_list <- function(object, list) {
  # Check if the elements of an object are all part of elements in a list
  #
  # Args:
  #   object (vector, list, data.frame):
  #     Object with elements
  #   list (list):
  #     List with elements to check against.
  #
  # Operation:
  #   Check if the elements of an object are all part of elements in a list.
  #
  # Returns:
  #   TRUE if the elements within object are all part of elements in the list.
  #   FALSE otherwise.
  #
  # Error handling:
  #   None.
  #
  # Credits: Grolemund, Garrett: Hands-on Programming with R, Sebastopol: O'Reilly,
  #          1st Edition, 2014, Chapter 7 - Programs, p. 127
  
  if (all(object %in% list)) {
    return (TRUE)
  } else {
    return (FALSE)
  }
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    # Test #1
    object <- c(1, 2, 3, 1, 2)
    list   <- c(1, 2, 3)
    result <- t_check_element_in_list(object = object, list = list)
    cat(paste0("\n", "The values of c(1, 2, 3, 1, 2) are all part of c(1, 2, 3): ",
               result, "\n"))
    
    # Test #2
    object <- c(1, 2, 3, 4, 5)
    list   <- c(1, 2, 3)
    result <- t_check_element_in_list(object = object, list = list)
    cat(paste0("\n", "The values of c(1, 2, 3, 4, 5) are all part of c(1, 2, 3): ",
               result, "\n"))
    
    # Test #3
    object <- c(1, 2, 3)
    list   <- c(1, 2, 3, 4, 5)
    result <- t_check_element_in_list(object = object, list = list)
    cat(paste0("\n", "The values of c(1, 2, 3) are all part of c(1, 2, 3, 4, 5): ",
               result, "\n"))
    
    # Test #4
    object <- c(1, 2, 3, 6, 7)
    list   <- c(1, 2, 3, 4, 5)
    result <- t_check_element_in_list(object = object, list = list)
    cat(paste0("\n", "The values of c(1, 2, 3, 4, 5) are all part of c(1, 2, 3): ",
               result, "\n"))
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF .