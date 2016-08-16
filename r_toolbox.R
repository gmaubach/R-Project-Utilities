#-------------------------------------------------------------------------------
# Library       : r_toolbox.R
# Author        : Georg Maubach
# Date          : 2016-05-25
# Update        : 2016-07-21
# Description   : Utilities for working with R
# Source System : R 3.2.5 (64 Bit)
# Target System : R 3.2.5 (64 Bit)
#
# Copyright (C) by Georg Maubach 2016
#
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-07-21"
t_module_name = "r_toolbox.R"
t_status = "released"

cat(
  paste0("\n",
    t_module_name, " (Version: ", t_version, ", Status: ", t_status, ")", "\n", "\n",
"Copyright (C) Georg Maubach 2016

This software comes with ABSOLUTELY NO WARRANTY.", "\n", "\n"))

#-----------#
# Configure #
#-----------#

# Set the toolbox path to whatever is suitable for you
v_toolbox_location <- v_toolbox_location

#--------------#
# Load Modules #
#--------------#

for (file in list.files(path = v_toolbox_location,
                        pattern = "t_",
                        full.names = TRUE,
                        ignore.case = TRUE)) {
  cat(paste0("\n",
    "--------------------------------------------------------------",
    "\n",
    "Loading module '", basename(file), "' from '", dirname(file), "':\n"))
  source(file)
}

#---------#
# Cleanup #
#---------#

rm(list = c("file"))

# EOF .

