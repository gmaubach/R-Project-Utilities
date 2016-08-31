#-------------------------------------------------------------------------------
# Module        : t_clrscr.R
# Author        : Georg Maubach
# Date          : 2016-08-31
# Update        : 2016-08-31
# Description   : Count valid values across variables
# Source System : R 3.2.5 (64 Bit)
# Target System : R 3.2.5 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-08-31"
t_module_name = "t_clrscr.R"
t_status = "released"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ", Status: ", t_status, ")", "\n", "\n",
         "Copyright (C) Georg Maubach 2016
         
         This software comes with ABSOLUTELY NO WARRANTY.", "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_clrscr <- function() {
  # Clears the console window of R Studio IDE
  #
  # Args:
  #   none
  #
  # Operation:
  #   Clears the windows of the R Studio IDE.
  #
  # Returns:
  #   Nothing.
  #
  # Error handling:
  #   None.
  #
  # Credits: 
  # http://stackoverflow.com/questions/7771577/clear-startup-screen-in-r-rstudio
  
  cat("\14")  # or cat("\f") would do
  
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    t_clrscr()
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF .

