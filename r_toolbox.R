#------------------------------------------------------------
# Library       : r_toolbox.R
# Author        : Georg Maubach
# Date          : 2017-01-10
# Update        : 2017-01-10
# Description   : Utilities for working with R
# Source System : R 3.2.5 (64 Bit)
# Target System : R 3.2.5 (64 Bit)
#
# Copyright (C) by Georg Maubach 2016
#
#--------1---------2---------3---------4---------5---------6

# Changelog
# 2017-01-10
# Modules are sourced into the environment "toolbox" instead
# of the .GlobalEnv. The "toolbox" environment is attached
# to the ".GlobalEnv".

t_version = "2017-01-10"
t_module_name = "r_toolbox.R"
t_status = "released"

cat(
  paste0(
    "\n",
    t_module_name,
    " (Version: ",
    t_version,
    ", Status: ",
    t_status,
    ")",
    "\n\n",
    "This software comes with ABSOLUTELY NO WARRANTY.",
    "\n\n"
  )
)

#-----------#
# Configure #
#-----------#

# Set the toolbox path to whatever is suitable for you
c_path_toolbox     <- c_path_toolbox
c_filename_toolbox <- c_filename_toolbox

#--------------#
# Load Modules #
#--------------#

toolbox <- new.env()

for (file in list.files(path = c_path_toolbox,
                        pattern = "^t_",
                        full.names = TRUE,
                        ignore.case = TRUE)) {
  cat(paste0("\n",
    "-----------------------------------------------------",
    "\n",
    "Loading module '", basename(file),
    "' from '", dirname(file), "':\n"))
  sys.source(
    file = file.path(
      c_path_full$modules,
      file),
    envir = toolbox)

  attach(what = toolbox)

  cat("Available toolbox functions:\n")
  ls(toolbox)
}

#---------#
# Cleanup #
#---------#

rm(list = c("file"))

# EOF .

