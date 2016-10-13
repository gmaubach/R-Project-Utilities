#-------------------------------------------------------------------------------
# Module        : t_count_non-na.R
# Author        : Georg Maubach
# Date          : 2016-06-13
# Update        : 2016-06-13
# Description   : Count non-NA's
# Source System : R 3.2.5 (64 Bit)
# Target System : R 3.2.5 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-06-13"
t_module_name = "t_count_non_na.R"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ")", "\n", "\n",
         "This software comes with ABSOLUTELY NO WARRANTY.",
         "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_count_non_na <- function(dataset,
                           variables = "all") {
  # Counts the number of non-NA's within given set of veriables
  #
  # Args:
  #   dataset (data frame, data table):
  #     Object with dimnames, e.g. data frame, data table.
  #   variables (character vector):
  #     List of variable names.
  #
  # Operation:
  #   Adds the variable "non_na_count" to the given dataset containing the count
  #   of NA's within the given variables
  #
  # Returns:
  #   Original dataset with variable "non_na_count" added.
  #
  # Error handling:
  #   None.
  #
  # Credits: 
  #   http://stackoverflow.com/questions/4862178/remove-rows-with-nas-in-data-frame
  #   http://r.789695.n4.nabble.com/Creating-variables-on-the-fly-td4720034.html
  
  if (identical(variables, "all")) {
    variable_list <- names(dataset)
  }  else {
    variable_list <- variables
  }  
  dataset[["non_na_count"]] <- apply(dataset[,variable_list],
                                     1, 
                                     function(x) sum(!is.na(x)))
  
  return(dataset)
  
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    cat("\n", "\n", "Test function t_count_non_na()", "\n", "\n")
    
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
    
    cat("\n", "\n", "Example dataset before function call", "\n", "\n")
    print(ds_example)
    
    cat("\n", "\n", "Function call", "\n", "\n")
    ds_example <- t_count_non_na(dataset = ds_example,
                                 variables = c("mmul", "mmus"))
    
    cat("\n", "\n", "Example dataset after function call", "\n", "\n")
    print(ds_example)
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_do_test", "t_test")

# EOF .

