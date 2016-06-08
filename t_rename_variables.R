#-------------------------------------------------------------------------------
# Module        : t_rename_variables.R
# Author        : Georg Maubach
# Date          : 2016-05-25
# Update        : 2016-06-07
# Description   : Count NA's
# Source System : R 3.2.2 (64 Bit)
# Target System : R 3.2.2 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-06-07"
t_module_name = "t_rename_variables.R"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ")", "\n", "\n",
         "This software comes with ABSOLUTELY NO WARRANTY.",
         "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_rename_variables <- function(dataset,
                               old_varnames,
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
  #   http://stackoverflow.com/questions/21502465/replacement-for-rename-in-dplyr/26146202#26146202

  variable_names <- colnames(dataset)
  variable_names[which(variable_names %in% old_varnames)] <- new_varnames
  colnames(dataset) <- variable_names
  
  return(dataset)
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
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

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_do_test", "t_test")

# EOF .

