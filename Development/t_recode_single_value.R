#-------------------------------------------------------------------------------
# Module        : t_recode_single_value.R
# Author        : Georg Maubach
# Date          : 2016-06-14
# Update        : 2016-06-14
# Description   : Recode Single value
# Source System : R 3.2.5 (64 Bit)
# Target System : R 3.2.5 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-06-14"
t_module_name = "t_recode_single_value.R"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ")", "\n", "\n",
         "This software comes with ABSOLUTELY NO WARRANTY.",
         "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_recode_single_value <- function(dataset,
                         variable_to_recode,
                         filter_variable,
                         condition,
                         filter_value,
                         new_value) {
  
  
  
  return(dataset)
  
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    cat("\n", "\n", "Test function t_count_na()", "\n", "\n")
    
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
    ds_example <- t_count_na(dataset = ds_example,
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

