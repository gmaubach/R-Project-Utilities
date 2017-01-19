# PRE
# source(
#   file = "t_openxlsx_shortcuts.R,
#   echo = FALSE)
# source(
#   file = "t_export_table_2_xls.R,
#   echo = FALSE)

t_clean_generate_statistic <- function
(
 variable,
 include = TRUE,
 filter,  # numeric vector with cases as long as variable
 decimals = 1,
 use_na = "always"
)

  # PRE
  # - Selection of cases to include/exclude
  # - Variable suitable for using with table() function

  # POST

{
  # Create table before cleaning
  d_before_n <- table(variable, useNA = use_na)
  d_before_pct <- round(prop.table(d_before_n) * 100,
                        digits = decimals)
  d_before_cum <- cumsum(d_before_pct)
  d_before <- cbind(
    d_before_n,
    d_before_pct,
    d_before_cum)
  addmargins(d_before)
  d_before <- cbind(id = row.names(d_before), d_before)

  # Generate subset
  v_subset <- variable[filter]

  # Create table after cleaning
  d_after <- table(v_subset, useNA = use_na)
  d_after_pct <- round(prop.table(d_after_n) * 100,
                        digits = decimals)
  d_after_cum <- cumsum(d_after_pct)
  d_after <- cbind(
    d_after_n,
    d_after_pct,
    d_after_cum)
  addmargins(d_after)

  d_after <- cbind(id = row.names(d_after), d_after)

  # Match tables before and after cleaning
  d_cleaning_statistic <-
    merge(
      x = d_before, y = d_after,
      by.x = "id",  by.y = "id",
      all.x = TRUE, all.y = FALSE)

  # Return
  return(d_cleaning_statistic)
}

t_clean_write_statistic <- function
(
  statistic,  # cleaning statistic data frame
  workbook,   # xlsx workbook
  sheetname = "Cleaning_Statistic",
  position  = list(row = 2,  # override if multiple
                       col = 2)  # tables shall be saved
)

  # PRE
  # - Existing openxlsx workbook
  # - t_export_table_2_xlsx() function loaded

  # POST

{
  library(openxlsx)

  end_position <- t_export_table_2_xls(
    table = statistic,
    xlsx_workbook = workbook,
    sheetname = sheetname,
    row_names = FALSE,
    col_names = FALSE,
    start_position = position,
    border_line = TRUE)

  return(end_position)
}

t_clean_save_statistic <- function
(
  workbook,
  path = getwd(),
  filename = paste0(
    as.character(Sys.Date()), "_",
    "Cleaning_Statistic.xlsx"),
  overwrite = TRUE
)

  # PRE
  # - t_write_xlsx() function loaded

  # POST

{
  library(openxlsx)

  openxlsx::saveWorkbook(
    workbook,
    file = file.path(
      path,
      filename),
    overwrite = overwrite)
}

t_clean_clean_dataset <- function
(
  dataset,    # data frame
  include,    # TRUE, FALSE
  selection   # cases vector as long as dataset with values
              # TRUE/FALSE
)

  # PRE
  # POST

{
  if (include == TRUE)
  {
    dataset <- dataset[selection , ]
  } else
  {
    dataset <- dataset[!selection, ]
  }

  return(dataset)
}

