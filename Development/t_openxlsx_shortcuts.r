# 2016-05-19_openxlsx_shotcuts.inc.r

t_openxlsx_shortcuts_version = 1

library(openxlsx)

t_create_workbook <- function() {
  return(createWorkbook())
  }

t_add_sheet <- function
  ### Add sheet with an autofilter to the first row, 
  ### freeze the row and column and
  ### auto-adjust column width
  (workbook, 
  ### a workbook object created with createWorkbook
  sheetname,
  dataset,
  freeze_row = 2,
  freeze_col = 2)
  {
  addWorksheet(workbook,
    sheetName = sheetname)
  writeDataTable(workbook, 
    sheet = sheetname,     
    x = dataset)
  ### writeDataTable writes data to a sheet an adds
  ### autofilter to the first line
  if (freeze_row <= 1 | freeze_col <= 1) {
    NULL # do nothing
  }
  else {
    freezePane(workbook,
      sheet = sheetname,
      firstActiveRow = freeze_row,
      firstActiveCol = freeze_col)
  }
  
  setColWidths(workbook,
    sheet = sheetname,
    cols = 1:ncol(dataset), 
    widths = "auto")
}

t_write_xlsx <- function(workbook, path, filename, overwrite = FALSE) {
  saveWorkbook(workbook, 
    file = file.path(path, filename),
    overwrite = overwrite)
}

# EOF

