#-------------------------------------------------------------------------------
# Module        : t_replace_na.R
# Author        : Georg Maubach
# Date          : 2016-06-27
# Update        : 2016-06-27
# Description   : Replace NA with another value
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-06-27"
t_module_name = "t_replace_na.R"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ")", "\n", "\n",
         "This software comes with ABSOLUTELY NO WARRANTY.",
         "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_replace_na <- function(dataset, variables, value) {
  # Replace NA with another given value
  #
  # Args:
  #   dataset (data frame, data table):
  #     Object with dimnames, e.g. data frame, data table.
  #   variables (character vector):
  #     List of variable names.
  #
  # Operation:
  #   NA is replaced by the value given with the parameter "value".
  #
  #   A factor is converted explicitly with as.character(), the missing value
  #   replacement is done and then the character vector is converted back with
  #   as.factor(). Thus NA becomes a category of the new factor variable.
  #
  #   Although the function can operate on a character vector for the variables
  #   whose NA values shall be changed it might be more efficient to use the
  #   function with lapply like follows:
  #
  #   dataset <- lapply()
  #
  # Caution:
  #   Please check your data in case you replace NA within factors due to
  #   explicit type conversion. Tests were done only for the below given
  #   dataset.
  #
  # Returns:
  #   Original dataset.
  #
  # Error handling:
  #   None.
  #
  # Credits: https://www.mail-archive.com/r-help@r-project.org/msg236537.html
  for (variable in variables) {
    if (inherits(dataset[, variable], "factor") == TRUE) {
      dataset[, variable] <- as.character(dataset[, variable])
      print(class(dataset[, variable]))
      dataset[, variable][is.na(dataset[, variable])] <- value
      dataset[, variable] <- as.factor(dataset[, variable])
      print(class(dataset[, variable]))
    } else {
      dataset[, variable][is.na(dataset[, variable])] <- value
    }
  }
  return(dataset)
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    cat("\n", "\n", "Test function t_count_na()", "\n", "\n")
    
    # Example dataset
    ds_example <- data.frame(a=c(1,NA,2), b = rep(NA,3), c = c("A","b",NA))
    
    cat("\n", "\n", "Example dataset before function call", "\n", "\n")
    cat("Variables and their classes:\n")
    print(sapply(ds_example, class))
    cat("Dataset:\n")
    print(ds_example)
    
    cat("\n", "\n", "Function call", "\n", "\n")
    ds_result <- t_replace_na(ds_example, "a", value = -1)
    cat("\n", "\n", "Dataset after function call", "\n", "\n")   
    print(ds_result)
    
    cat("\n", "\n", "Function call", "\n", "\n")
    ds_result <- t_replace_na(ds_example, "b", value = -2)
    cat("\n", "\n", "Example dataset after function call", "\n", "\n")   
    print(ds_result)

    cat("\n", "\n", "Function call", "\n", "\n")    
    ds_result <- t_replace_na(ds_example, "c", value = -3)
    cat("\n", "\n", "Example dataset after function call", "\n", "\n")   
    print(ds_result)    
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_do_test", "t_test")

# EOF .
