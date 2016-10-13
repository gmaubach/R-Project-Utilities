#-------------------------------------------------------------------------------
# Module        : t_find_orignals_and_duplicates.R
# Author        : Georg Maubach
# Date          : 2016-05-30
# Update        : 2016-05-30
# Description   : Find original values and their duplicates
# Source System : R 3.2.2 (64 Bit)
# Target System : R 3.2.2 (64 Bit)
# License       : GPL-2
#
# Copyright (C) by Georg Maubach 2016
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License, version 2
# as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the
#
# Free Software Foundation, Inc.
# 51 Franklin Street
# Fifth Floor, Boston, MA  02110-1301
# USA.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-05-30-002"
t_module_name = "t_find_originals_and_duplicates.R"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ")", "\n", "\n",
         
         "Copyright (C) Georg Maubach 2016

This software comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under the 
conditions of the GNU General Public License, version 2. Please see License.txt
distributed with this software for details.",
         
         "\n", "\n"))

do_test <- TRUE

t_find_originals_and_duplicates <- function(dataset,
                                            key_variable) {
  # Find the originals and their corresponding duplicates
  #
  # Args:
  #   dataset (data frame, data table):
  #     Object with dimnames, e.g. data frame, data table.
  #   key_variable (character vector):
  #     Vector of variable name that shall be used to identify duplicates.
  #     Only one key variable is allowed.
  #
  # Operation:
  #   Finds the duplicates in the key_variable. These values are used to filter
  #   the dataset to get the originals and the corresponding duplicates.
  #
  # Returns:
  #   Original dataset with variable "originals_and_duplicates" added.
  #
  # Error handling:
  #   None.
  #
  # Rational:
  #   R function duplicated() delivers a list of duplicates and leaves the
  #   original values out. To determine what has to be done with the duplicate
  #   cases it is sometimes necessary to compare the original dataset with its
  #   duplicates based on key variables. Duplicate cases might have different
  #   values in variables other than key variables. These differences can be
  #   used to make decisions of what to do with these cases.
  
  duplicates <- duplicated(dataset[key_variable])
  
  unique_duplicates <- unique(dataset[duplicates , key_variable])
  
  ds_temp <- data.frame()

  for (item in unique_duplicates) {
    print(paste0("Item: ", item))
    
    print("\n\n")
    ds_temp_per_item <- dataset[key_variable] == item
    print("Dataset: ds_temp_per_item")
    print(ds_temp_per_item)
    
    print("\n\n")
    ds_temp <-
      ds_temp | ds_temp_per_item
    print("Dataset: ds_temp")
    print(ds_temp)
  }
  
  print("\n\n")
  print("Dataset: ds_temp")
  print(ds_temp)
  names(ds_temp)[names(ds_temp) == key_variable] <- "originals_and_duplicates"
  
  cbind(dataset, ds_temp)
 
  return(dataset)
}

#-------------------------------------------------------------------------------

test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    cat("\n", "\n", "Test function t_find_originals_and_duplicates()", "\n", "\n")
    
    # Example dataset
    id <- c(1000, 1001, 1001, 1002, 1003, 1003, 1003, 1004)
    customer <- c("Customer A", "Customer B", "Customer B", "Customer C",
                  "Customer D", "Customer D", "Customer D", "Customer E")
    sales <- c(100, 40, 80, 70, 100, 50, 80, 65)
    purchases <- c(5, 2, 3, 7, 9, 8, 1, 6)
    
    ds_example <- data.frame(id, customer, sales, purchases)
    
    cat("\n", "\n", "Example dataset before function call", "\n", "\n")
    print(ds_example)
    
    cat("\n", "\n", "Function call", "\n", "\n")
    ds_example <- t_find_originals_and_duplicates(ds_example,
                                                  key_variable = "id")
    
    cat("\n", "\n", "Example dataset after function call", "\n", "\n")
    print(ds_example)
  }
}

test(do_test = do_test)

# EOF .

