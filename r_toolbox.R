#-------------------------------------------------------------------------------
# Library       : t_toolbox.R
# Author        : Georg Maubach
# Date          : 2016-05-25
# Update        : 2016-06-16
# Description   : Utilities for working with R
# Source System : R 3.2.5 (64 Bit)
# Target System : R 3.2.5 (64 Bit)
#
# Copyright (C) by Georg Maubach 2016
#
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-05-25"
t_module_name = "r_toolbox.R"

cat(
  paste0("\n",
    t_module_name, " (Version: ", t_version, ")", "\n", "\n",
"Copyright (C) Georg Maubach 2016

This software comes with ABSOLUTELY NO WARRANTY.", "\n", "\n"))

#-----------#
# Configure #
#-----------#

# Set the toolbox path to whatever is suitable for you
t_toolbox_location = "H:/2016/Programming/R-Project/r_toolbox/"

#--------------#
# Load Modules #
#--------------#

for (file in list.files(path = t_toolbox_location,
                        pattern = "t_",
                        full.names = TRUE,
                        ignore.case = TRUE)) {
  print(paste0("Loading module ", file))
  source(file)
}

# EOF .





