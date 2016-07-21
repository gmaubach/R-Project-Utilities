#-------------------------------------------------------------------------------
# Module        : t_merge_variables.R
# Author        : Georg Maubach
# Date          : 2016-06-06
# Update        : 2016-06-09
# Description   : Merge two variables
# Source System : R 3.2.5 (64 Bit)
# Target System : R 3.2.5 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_module_name = "t_merge_variables.R"
t_version = "2016-06-09"
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
t_merge_variables <-
  function(dataset,
           var1,
           var2,
           merged_var) {
    # Merges two variables with identical, different or missing values
    #
    # Args:
    #  dataset (data frame, data table):
    #    Object with dimnames, e.g. data frame, data table.
    #  var1 (character):
    #    Variable 1 to be merged.
    #  var2 (character):
    #    Variable 2 to be merged.
    #  merged_var (class based on input variable, coercion done if possible):
    #    Variable with the merged variables var1 and var2.
    #
    # Operation:
    #   Var1 and var2 are merged like follows:
    #   if var1 == var2: merged_var <- var1
    #   if var1 != var2: merged_var <- -1 (-1 = indicating mismatch)
    #   if var1 is filled & var2 is missing: merged_var <- var1
    #   if var1 is missing & var2 is filled: merged_var <- var2
    #   if var1 is missing & var2 is missing: merged_var <- -2 
    #                                         (-2 = indicating NA)
    #
    # Returns:
    #   Original dataset and variable given in "merged_var" will be added.
    #
    # Error handling:
    #   None.
    #
    # Credits: 
    #   https://www.mail-archive.com/r-help@r-project.org/msg236012.html
    
    # Initialize
    dataset[merged_var] = rep(NA, nrow(dataset))

    dataset[merged_var] <-
      # Check 1: var1 missing, var2 missing
      ifelse(is.na(dataset[, var1]) & is.na(dataset[, var2]), 
        # then
        dataset[[merged_var]] <- -2,
        # Check 2: var1 filled, var2 missing
        ifelse(!is.na(dataset[, var1]) & is.na(dataset[, var2]),
          # then
          dataset[[merged_var]] <- dataset[, var1],
          # Check 3: var1 missing, var2 filled
          ifelse(is.na(dataset[ , var1]) & !is.na(dataset[, var2]),
            # then
            dataset[[merged_var]] <- dataset[ , var2],
            # Check 4: var1 == var2
            ifelse(dataset[, var1] == dataset[, var2],
              # then: use var1
              dataset[[merged_var]] <- dataset[, var1],
              #Leftover: var1 != var2
              dataset[merged_var] <- -1))))
      
    return(dataset)
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    # Example dataset
    customer.x <- c("Miller", "Smith", NA,    "Bird", NA)
    customer.y <- c("Miller",  NA,     "Doe", "Fish", NA)
    ds_test <-
      data.frame(customer.x, customer.y, stringsAsFactors = FALSE)
    
    # Call function
    ds_merge <- t_merge_variables(
      dataset = ds_test,
      var1 = "customer.x",
      var2 = "customer.y",
      merged_var = "customer"
    )
    
    # Dataset after function call
    ds_merge
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF

