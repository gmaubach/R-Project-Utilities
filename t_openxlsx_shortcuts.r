#-------------------------------------------------------------------------------
# Module        : t_openxlsx_shortcuts.R
# Author        : Georg Maubach
# Date          : 2016-05-19
# Update        : 2016-07-07
# Description   : Shortcuts for working with openxslx package
# Source System : R 3.2.2 (64 Bit)
# Target System : R 3.2.2 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-06-07"
t_module_name = "t_openxlsx_shortcuts.R"
t_status = "released"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ", Status: ", t_status, ")", "\n", "\n",
         "Copyright (C) Georg Maubach 2016

This software comes with ABSOLUTELY NO WARRANTY.", "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- FALSE

library(openxlsx)

# [ Function Defintion ]--------------------------------------------------------
t_create_workbook <- function() {
  # Creates an openxlsx workbook
  #
  # Args:
  #   none
  #
  # Operation:
  #   Creates an openxlsx workbook. Just to have a consistent naming.
  #
  # Returns:
  #   openxlsx object.
  #
  # Error handling:
  #   None.

  return(createWorkbook())
  }

t_add_sheet <- function (workbook, 
                         sheetname,
                         dataset,
                         freeze_row = 2,
                         freeze_col = 2) {
  # Add a worksheet with an autofilter to the first row, 
  # freeze the row and column and auto-adjust column width
  #
  # Args:
  #   workbook (workbook object):
  #     A workbook object created with createWorkbook.
  #   sheetname (character vector):
  #     Name of new Excel sheet as character vector.
  #   freeze_row (numeric):
  #     Number of columns to freeze. Number must be greater than or equal to 2.
  #   freeze_col (numeric):
  #     Number of rows to freeze. Number must be greater than or equal to 2.
  #
  # Operation:
  #   Adds a worksheet to an already existing openxlsx workbook object, adds the
  #   data from a given dataset, sets an auto-filter to the first line and
  #   freezes panes.
  #
  # Returns:
  #   Nothing.
  #
  # Error handling:
  #   None.

  openxlsx::addWorksheet(workbook,
    sheetName = sheetname)
  openxlsx::writeDataTable(workbook, 
    sheet = sheetname,     
    x = dataset)
  ### writeDataTable writes data to a sheet an adds
  ### autofilter to the first line
  if (freeze_row <= 1 | freeze_col <= 1) {
    NULL # do nothing
  }
  else {
    openxlsx::freezePane(workbook,
      sheet = sheetname,
      firstActiveRow = freeze_row,
      firstActiveCol = freeze_col)
  }
  
  openxlsx::setColWidths(workbook,
    sheet = sheetname,
    cols = 1:ncol(dataset), 
    widths = "auto")
}

t_write_xlsx <- function(workbook, path, filename, overwrite = FALSE) {
  # Saves an openxlsx workbook object
  #
  # Args:
  #   workbook (openxls object):
  #     openxlsx workbook object.
  #   path (character):
  #     String in R notation with "/" instead of "\" ending with "/".
  #   filename (character):
  #     Filename of new Excel workbook.
  #   overwrite (logical):
  #     Flag to indicate if the file shall be overwritten.
  #
  # Operation:
  #   Saves a workbook object to an Excel file.
  #
  # Returns:
  #   Nothing.
  #
  # Error handling:
  #   None.
  
  openxlsx::saveWorkbook(workbook, 
    file = file.path(path, filename),
    overwrite = overwrite)
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    # no test defined
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# End Module -------------------------------------------------------------------

