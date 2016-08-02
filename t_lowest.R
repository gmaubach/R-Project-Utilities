#-------------------------------------------------------------------------------
# Module        : t_highest.R
# Author        : Georg Maubach
# Date          : 2016-08-02
# Update        : 2016-08-02
# Description   : Show highest value of variable
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-08-02"
t_module_name = "t_lowest.R"
t_status = "released"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ", Status: ", t_status, ")", "\n", "\n",
         "Copyright (C) Georg Maubach 2016
         
         This software comes with ABSOLUTELY NO WARRANTY.", "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- TRUE

# [ Function Defintion ]--------------------------------------------------------
t_lowest <- function(dataset, variable, number = 5, show = c()) {
  #-----------------------------------------------------------------------------
  # Shows the lowest value of a variable
  #
  # Args:
  #   dataset (data frame, data table):
  #     Object with dimnames, e.g. data frame, data table.
  #   variable (vector):
  #     Vector with values that can be sorted.
  #
  # Operation:
  #   Sorts the dataset according to variable and prints the number of lowest
  #   values gives by number.
  #   Show can take additional variables to show in output if desired.
  #   NA are sorted last and never shown as lowest values, thus always omitted
  #   implicitly.
  #
  # Returns:
  #   Nothing.
  #
  # Error handling:
  #   None.
  #
  # Credits: Muenchen: R for SAS and SPSS Users, Heidelberg: Springer, 2. Ed., 
  #          2011, p. 314f
  #-----------------------------------------------------------------------------
  if(length(show) == 0) { show = variable }
  print(head(dataset[order(dataset[variable], 
                           decreasing = FALSE,
                           na.last = TRUE) , show],
             n = number))
}


# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    cat("\n", "\n", "Test function t_lowest()", "\n", "\n")
    
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
    
    t_lowest(dataset = ds_example, variable = "hsap", number = 5, show = "hsap")
    
    t_lowest(dataset = ds_example, variable = "mmul", number = 5, show = "mmul")
    
    t_lowest(dataset = ds_example, variable = "mmul", number = 5)
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF .

