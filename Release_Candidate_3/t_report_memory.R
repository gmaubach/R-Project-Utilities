#-------------------------------------------------------------------------------
# Module        : t_report_memory.R
# Author        : Georg Maubach
# Date          : 2016-06-15
# Update        : 2016-06-15
# Description   : Report on available and allocated memory
# Source System : R 3.2.5 (64 Bit)
# Target System : R 3.2.5 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_module_name = "t_report_memory.R"
t_version = "2016-06-15"
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
t_report_memory <- function() {
  cat(paste0("Memory (MB): Limit = ",
             round(memory.limit(size = NA)),
             ", obtained from OS = ",
             round(memory.size(max = TRUE)),
             ", in use = ",
             round(memory.size(max = FALSE))))
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    t_report_memory()
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF
