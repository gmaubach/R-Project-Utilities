#-------------------------------------------------------------------------------
# Module        : t_get_factor_levels.R
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

t_module_name = "t_get_factor_levels.R"
t_version = "2016-06-23"
t_status = "testing"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ")", "\n", "\n",
         "Development status: ", t_status, "\n", "\n",
         "This software comes with ABSOLUTELY NO WARRANTY.",
         "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
# Switch t_do_test to TRUE to run test
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_get_factor_levels <- function(dataset,
                                variable = 0)  {
  # Gets the factor levels of factor variables
  #
  # Args:
  #  dataset (data frame, data table):
  #    Object with dimnames, e.g. data frame, data table.
  #  variable (character):
  #    Variable to get factor levels for.
  #
  # Operation:
  #   If variable is 0 the factor levels of all variables in the dataset
  #   is returned as a named numerical vector.
  #   If variable is a character vector containing a variable name, e. g.
  #   "variable-1" the factor level of this variable is returned as a
  #   atomic numerical vector.
  #
  # Returns:
  #   Named numerical vector or atomic numeric vector
  #
  # Error handling:
  #   None.
  # 
  # ToDo:
  #   - Return an atomic named numerical vector if a variable is applied.
  #   - Implement test()
  #
  # Credits:
  # (1) Maindonald: Using R for Data Analysis and Graphics, p. 63
  #     (https://cran.r-project.org/doc/contrib/usingR.pdf)

  if(variable == 0) {
    return(
      sapply(dataset,
             function(x) {
               if(!is.factor(x)) {  # variable NOT factor
                 return(0) } else {
                   length(levels(x))
                 }
             }
      )
    )
  } else {  # variable NOT NULL
    if(is.factor(dataset[[variable]])) {
      return(length(levels(dataset[[variable]])))
    } else {  # variable NOT factor
      return(0)
    }
  }
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
rm("t_module_name", "t_version", "t_do_test", "t_test")

# EOF
