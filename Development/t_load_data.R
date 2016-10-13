#-------------------------------------------------------------------------------
# Module        : t_load_data.R
# Author        : Georg Maubach
# Date          : 2016-06-15
# Update        : 2016-06-15
# Description   : Merge two variables
# Source System : R 3.2.5 (64 Bit)
# Target System : R 3.2.5 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_module_name = "t_load_data.R"
t_version = "2016-06-15"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ")", "\n", "\n",
         "This software comes with ABSOLUTELY NO WARRANTY.",
         "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
# Switch t_do_test to TRUE to run test
t_do_test <- TRUE

# [ Function Defintion ]--------------------------------------------------------
t_load_data <- function(directory,
                        filename,
                        case_info = TRUE,
                        memory_info = FALSE) {
  
  if(memory_info == TRUE) {
    cat(paste0("Memory before loading data (MB): Limit = ",
               round(memory.limit(size = NA)),
               ", obtained from OS = ",
               round(memory.size(max = TRUE)),
               ", in use = ",
               round(memory.size(max = FALSE)),
               "\n"))
  }

  workplace_before_loading <- ls()
  load(file.path(directory, filename))
  workplace_after_loading <- ls()
  name_of_loaded_object <- get((unlist(setdiff(workplace_after_loading,
                                   workplace_before_loading)[1])))
  # print(name_of_loaded_object)
  # str(name_of_loaded_object)
  
  if(memory_info == TRUE) {
    cat(paste0("Memory after  loading data (MB): Limit = ",
               round(memory.limit(size = NA)),
               ", obtained from OS = ",
               round(memory.size(max = TRUE)),
               ", in use = ",
               round(memory.size(max = FALSE)),
               "\n"))
  }
  
  cat(paste0("Object size (",
             name_of_loaded_object,
             "): "))
  format(object.size(name_of_loaded_object), units = "MB")
  cat("\n\n")
  print(paste("Cases: ", nrow(name_of_loaded_object)))
  
  return(name_of_loaded_object)
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    # Example dataset
    customer.x <- c("Miller", "Smith", NA,    "Bird", NA)
    customer.y <- c("Miller",  NA,     "Doe", "Fish", NA)
    ds_test <- data.frame(customer.x, customer.y, stringsAsFactors = FALSE)
    
    directory <- file.path("C:", "temp")
    filename <- "test.RData"
    location <- file.path(directory, filename)
                           
    save(ds_test, file = location)
    
    t_load_data(directory = directory,
                filename = filename,
                case_info = TRUE,
                memory_info = TRUE)
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
# Nothing to do.

# EOF

