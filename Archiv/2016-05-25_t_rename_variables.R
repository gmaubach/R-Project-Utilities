#-------------------------------------------------------------------------------
# Module        : t_rename_variables.R
# Author        : Georg Maubach
# Date          : 2016-05-25
# Update        : 2016-05-25
# Description   : Count NA's
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

t_version = "2016-05-25"
t_module_name = "t_rename_variables.R"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ")", "\n", "\n",
         
         "Copyright (C) Georg Maubach 2016
         
         This software comes with ABSOLUTELY NO WARRANTY.
         This is free software, and you are welcome to redistribute it under the 
         conditions of the GNU General Public License, version 2. Please see License.txt
         distributed with this software for details.",
         
         "\n", "\n"))

do_test <- FALSE

t_rename_variables <- function(dataset,
                               old_varnames = NULL,
                               new_varnames) {
  # Rename a single variable or a list of variables
  #
  # Args:
  #   dataset (data frame, data table):
  #     Object with dimnames, e.g. data frame, data table.
  #   old_varnames (character vector):
  #     List of old variable names. If NULL all variables will be renamed.
  #   new_varnames (character vector):
  #     List of new variable names.
  #
  # Operation:
  #   Gives a list of variables a new name.
  #
  # Returns:
  #   Original dataset with variables renamed.
  #
  # Error handling:
  #   None.
  #
  # Credits: 
  #   Hain: Statistik mit R, 1. Ed., Hannover, 2011, p. 83

  # If all variables shall be renamed
  if (identical(old_varnames, NULL)) {
    stopifnot(length(dataset) == length(new_varnames))
    names(dataset) <- new_varnames
  } # if only a given set of variables is renamed
    else {
    stopifnot(length(old_varnames) == length(new_varnames))
    for (item in length(old_varnames)) {
      names(dataset)[names(dataset == old_varnames[[item]])] <- new_varnames[[item]]
    }
  }
  return(dataset)
}

#-------------------------------------------------------------------------------

test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    cat("\n", "\n", "Test function ", t_module_name, "\n", "\n")
    
    # Example dataset
    gene <- c("ENSG00000208234","ENSG00000199674","ENSG00000221622","ENSG00000207604", 
              "ENSG00000207431","ENSG00000221312","ENSG00134940305","ENSG00394039490",
              "ENSG09943004048")
    hsap <- c(0,0,0, 0, 0, 0, 1,1, 1)
    mmul <- c(NA,2 ,3, NA, 2, 1 , NA,2, NA)
    mmus <- c(NA,2 ,NA, NA, NA, 2 , NA,3, 1)
    rnor <- c(NA,2 ,NA, 1 , NA, 3 , NA,NA, 2)
    cfam <- c(NA,2,NA, 2, 1, 2, 2,NA, NA)
    ds_example <- data.frame(gene, hsap, mmul, mmus, rnor, cfam)
    ds_example$gene <- as.character(ds_example$gene)
    
    # Test 1
    print("Test 2: Rename all variables but providing to few names")
    
    cat("\n", "\n", "Example dataset before function call", "\n", "\n")
    print(ds_example)
    
    cat("\n", "\n", "Function call", "\n", "\n")
    
    # ds_example <- t_rename_variables(dataset = ds_example,
    #                                  old_varnames = NULL,
    #                                  new_varnames = c("var1", "var2"))
    
    cat("\n", "\n", "Example dataset after function call", "\n", "\n")
    print(ds_example)

    # Test 2
    print("Test 2: Rename all variables")
    
    cat("\n", "\n", "Example dataset before function call", "\n", "\n")
    print(ds_example)
    
    cat("\n", "\n", "Function call", "\n", "\n")
    
    ds_example <- t_rename_variables(dataset = ds_example,
                                     old_varnames = NULL,
                                     new_varnames = c("var1", "var2", "var3",
                                                      "var4", "var5", "var6"))
    
    cat("\n", "\n", "Example dataset after function call", "\n", "\n")
    print(ds_example)
    
    # Test 3
    print("Test 3: Rename selected variables")
    
    cat("\n", "\n", "Example dataset before function call", "\n", "\n")
    print(ds_example)
    
    cat("\n", "\n", "Function call", "\n", "\n")
    
    ds_example <- t_rename_variables(dataset = ds_example,
                                     old_varnames = c("mmul", "mmus"),
                                     new_varnames = c("var1", "var2"))
    
    cat("\n", "\n", "Example dataset after function call", "\n", "\n")
    print(ds_example)
    
    # Test 4
    print("Test 4: Rename selected variables but given wrong amount of variables")
    
    cat("\n", "\n", "Example dataset before function call", "\n", "\n")
    print(ds_example)
    
    cat("\n", "\n", "Function call", "\n", "\n")
    
    # ds_example <- t_rename_variables(dataset = ds_example,
    #                                  old_varnames = c("var1", "var2","var3"),
    #                                  new_varnames = c("mmul", "mmus"))
    
    cat("\n", "\n", "Example dataset after function call", "\n", "\n")
    print(ds_example)
  }
}

test(do_test = do_test)

# EOF .

