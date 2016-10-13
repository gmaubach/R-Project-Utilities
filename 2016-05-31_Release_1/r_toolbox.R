#-------------------------------------------------------------------------------
# Library       : t_toolbox.R
# Author        : Georg Maubach
# Date          : 2016-05-25
# Update        : 2016-05-31
# Description   : Utilities for working with R
# Source System : R 3.2.2 (64 Bit)
# Target System : R 3.2.2 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-05-31"
t_module_name = "r_toolbox.R"

cat(
  paste0("\n",
    t_module_name, " (Version: ", t_version, ")", "\n", "\n",
    "This software comes with ABSOLUTELY NO WARRANTY.",
    "\n", "\n"))

#-----------#
# Configure #
#-----------#

# Set the toolbox path to whatever is suitable for you
t_toolbox_path = "H:/2016/Programming/R-Project/r_toolbox/"

# If you do want only to test a single module define this variable in the
# respective module and comment this variable definition out.
do_test = FALSE

#--------------#
# Load Modules #
#--------------#

for (file in list.files(path = t_toolbox_path,
                        pattern = "t_",
                        full.names = TRUE,
                        ignore.case = TRUE)) {
  print(paste0("Loading module ", file))
  source(file)
}

# EOF .





