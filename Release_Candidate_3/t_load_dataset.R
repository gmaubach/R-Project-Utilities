#-------------------------------------------------------------------------------
# Module        : t_load_dataset.R
# Author        : Georg Maubach
# Date          : 2016-08-15
# Update        : 2016-08-15
# Description   : Load dataset and print information on contents
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_module_name = "t_load_dataset"
t_version = "2016-08-15"
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
t_load_dataset <- function(file_path,
                           file_name) {
  # Loads and RData file with all objects in it and prints information on its
  # contents
  #
  # Args:
  #  file_path (string):
  #    String with path name.
  #  file_name (string):
  #    String with file name.
  #
  # Operation:
  #   Loads the RData file with all its objects, stores the objects in the
  #   global environment .GlobalEnv and prints information about the objects.
  #
  # Usage:
  #   The function is designed to work only on data frames.
  #
  # Returns:
  #   Nothing, but stores loaded objects directly into the global environment.
  #
  # Error handling:
  #   None.
  #-----------------------------------------------------------------------------
  
  cat("----------------------- [ t_load_dataset() ] ----------------------\n\n")
  
  file_location <- file.path(file_path, file_name)
  
  cat(paste0('Loading ', file_location, " ...\n\n"))
  
  dataset_list <- load(file = file_location,
                       envir = .GlobalEnv)
  
  cat(paste0(
    length(dataset_list),
    " dataset(s) loaded:\n"))
  cat(dataset_list)
  cat("\n\n")

  for (dataset in dataset_list) {
    cat(paste0("Dataset '", dataset, "' contains ",
                nrow(get(dataset, envir = .GlobalEnv)),
                " cases in ",
                ncol(get(dataset, envir = .GlobalEnv)),
                " variables:\n"))
    cat(names(get(dataset, envir = .GlobalEnv)))
    cat("\n\n")
  }
  
  cat("------------------------------ [ Done ] ---------------------------\n\n")
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    
    # Example dataset
    var1 <- c(1, 2, 3)
    var2 <- c(4, 5, 6)
    d_data1 <- data.frame(var1, var2)
    
    var3 <- c(7, 8, 9)
    var4 <- c(10, 11, 12)
    d_data2 <- data.frame(var3, var4)
    
    # Save datasets
    v_file_name <- "test_t_load_dataset.RData"
    
    save(file = file.path(getwd(),
                          v_file_name),
         list = c("d_data1", "d_data2"))
    
    # Call function
    t_load_dataset(file_path = getwd(), file_name = v_file_name)
    
    # Cleanup
    unlink(file.path(getwd(), v_file_name))
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF
