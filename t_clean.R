# @GMA 2017-01-12
# %TODO%
# - Add roxygen comments
# - Generate t_clean package

# PRE
library(openxlsx)
# source(
#   file = "t_openxlsx_shortcuts.R,
#   echo = FALSE)
# source(
#   file = "t_export_table_2_xls.R,
#   echo = FALSE)

t_clean_create_overview <- function()
{
  assign(
    x = "d_cleaning_overview",
    value = data.frame(),
    envir = .GlobalEnv)
}

#-----------------------------------------------------------

t_clean_generate_statistic <- function
(
 variable,
 include = TRUE,
 filter,  # numeric vector with cases as long as variable
 decimals = 1,
 show_na = TRUE,
 stat_name = "",  # if "" cleaning statistic is not viewed
 show_tables = FALSE,
 show_summary = FALSE
)

  # PRE
  # - Selection of cases to include/exclude
  # - Variable suitable for using with table() function
  # - Object "d_cleaning_overview" in .GlobalEnv, can be
  #   generated using "t_clean_create_overview()".

  # POST

{
  cat("t_clean_generate_statistic() ... \n")

  cases_before <- length(variable)

  # Create table before cleaning
  #-- before
  #---- abs, abs_cum
  if (show_na == TRUE)
  {
    d_before_abs <- table(variable, useNA = "always")
    names(d_before_abs)[length(d_before_abs)] <- c("na")
  } else
  {
    d_before_abs <- table(variable, useNA = "no")
  }
  d_before_abs_cum <- cumsum(d_before_abs)
  #---- bind abs, abs_cum
  d_before_abs_bind <- as.data.frame(d_before_abs)
  d_before_abs_bind <- cbind(d_before_abs_bind, d_before_abs_cum)
  colnames(d_before_abs_bind) <- c("item", "before_abs", "before_abs_cum")
  #---- pct, pct_cum
  d_before_pct <- round(prop.table(d_before_abs) * 100,
                        digits = decimals)
  d_before_pct_cum <- cumsum(d_before_pct)
  #---- bind pct, pct_cum
  d_before_pct_bind <- as.data.frame(d_before_pct)
  d_before_pct_bind <- cbind(d_before_pct_bind, d_before_pct_cum)
  colnames(d_before_pct_bind) <- c("item", "before_abs", "before_abs_cum")
  #---- bind abs, pct
  d_before <- merge(
    x = d_before_abs_bind, y = d_before_pct_bind,
    by = "item")
  colnames(d_before) <- c("item", "before_abs", "before_abs_cum",
                          "before_pct", "before_pct_cum")

  # Generate subset
  if (include == TRUE)
  {
    v_subset <- variable[filter]
  } else
  {
    v_subset <- variable[!filter]
  }

  cases_after <- length(v_subset)

  # Create table after cleaning
  #-- after
  #---- abs, abs_cum
  if (show_na == TRUE)
  {
    d_after_abs <- table(v_subset, useNA = "always")
    names(d_after_abs)[length(d_after_abs)] <- c("na")
  } else
  {
    d_after_abs <- table(v_subset, useNA = "no")
  }
  d_after_abs_cum <- cumsum(d_after_abs)
  #---- bind abs, abs_cum
  d_after_abs_bind <- as.data.frame(d_after_abs)
  d_after_abs_bind <- cbind(d_after_abs_bind, d_after_abs_cum)
  colnames(d_after_abs_bind) <- c("item", "after_abs", "after_abs_cum")
  #---- pct, pct_cum
  d_after_pct <- round(prop.table(d_after_abs) * 100,
                        digits = decimals)
  d_after_pct_cum <- cumsum(d_after_pct)
  #---- bind pct, pct_cum
  d_after_pct_bind <- as.data.frame(d_after_pct)
  d_after_pct_bind <- cbind(d_after_pct_bind, d_after_pct_cum)
  colnames(d_after_pct_bind) <- c("item", "after_abs", "after_abs_cum")
  #---- bind abs, pct
  d_after <- merge(
    x = d_after_abs_bind, y = d_after_pct_bind,
    by = "item")
  colnames(d_after) <- c("item", "after_abs", "after_abs_cum",
                          "after_pct", "after_pct_cum")

  # Match tables before and after cleaning
  d_cleaning_statistic <-
    merge(
      x = d_before, y = d_after, by = "item",
      all.x = TRUE, all.y = TRUE)

  d_cleaning_statistic[is.na(d_cleaning_statistic)] <- 0
  rownames(d_cleaning_statistic) <-
    d_cleaning_statistic[[colnames(d_cleaning_statistic)[1]]]
  d_cleaning_statistic[ , 1] <- NULL
  d_cleaning_statistic <-
    rbind(
      d_cleaning_statistic,
      sapply(d_cleaning_statistic, sum))
  rownames(
    d_cleaning_statistic)[nrow(
      d_cleaning_statistic)] <- c("Sum")
  d_cleaning_statistic["Sum", "before_abs_cum"] <- NA
  d_cleaning_statistic["Sum", "before_pct_cum"] <- NA
  d_cleaning_statistic["Sum", "after_abs_cum"] <- NA
  d_cleaning_statistic["Sum", "after_pct_cum"] <- NA

  # Write data to d_cleaning_overview
  d_cleaning_overview <<-
    rbind(
      d_cleaning_overview,
      data.frame(
        variable = stat_name,
        before   = cases_before,
        after    = cases_after))

  # Print results
  if (show_tables == TRUE)
  {
    cat("\n\n")
    cat("Before cleaning\n")
    print(d_before_abs)
    cat("\n\n")
    cat("After cleaning\n")
    print(d_after_abs)
  }

  if (show_summary == TRUE)
  {
    cat("\n\n")
    cat(paste("Cases before cleaning:", cases_before, "\n"))
    cat(paste("Cases after  cleaning:", cases_after, "\n"))
    cat("\n\n")
  }

  if (stat_name != "")
  {
    View(d_cleaning_statistic,
         paste0(
           "Clean Stat: ",
           stat_name))
  }

  cat("... t_clean_generate_statistic()\n")

  # Return
  return(d_cleaning_statistic)
}

#-----------------------------------------------------------

t_clean_write <- function
(
  statistic, # cleaning statistic data frame
  workbook,  # xlsx workbook
  sheetname, # should be "Overview" for d_cleaning_statistic
             # or "Details" for d_cleaning_overview
  row_names = TRUE, # TRUE/FALSE
  col_names = TRUE, # TRUE/FALSE
  position  = list(row = 2,  # override if multiple
                       col = 2)  # tables shall be saved
)

  # PRE
  # - Existing openxlsx workbook
  # - Existing sheets "Overview" and "Details"
  # - t_export_table_2_xlsx() function loaded

  # POST

{
  cat("t_clean_write() ... \n")

  library(openxlsx)

  end_position <- t_export_table_2_xlsx(
    table = statistic,
    xlsx_workbook = workbook,
    sheetname = sheetname,
    row_names = row_names,
    col_names = col_names,
    start_position = position,
    border_line = TRUE)

  cat("... t_clean_write()\n")

  invisible(end_position)
}

#-----------------------------------------------------------

t_clean_save <- function
(
  workbook,
  path = getwd(),
  filename = paste0(
    as.character(Sys.Date()), "_",
    "Cleaning_Documentation.xlsx"),
  overwrite = TRUE)

  # PRE
  # - t_write_xlsx() function loaded from
  #   t_openxlsx_shortcuts.R

  # POST

{
  cat("t_clean_save() ... \n")
  library(openxlsx)

  openxlsx::saveWorkbook(
    workbook,
    file = file.path(
      path,
      filename),
    overwrite = overwrite)

  cat("... t_clean_save()\n")
}

#-----------------------------------------------------------

t_clean_clean_dataset <- function
(
  dataset,    # data frame
  include,    # TRUE, FALSE
  filter      # cases vector as long as dataset with values
              # TRUE/FALSE to include or exclude according
              # to arg "include"
)

  # PRE
  # POST

{
  cat("t_clean_clean_dataset() ... \n")

  if (include == TRUE)
  {
    dataset <- dataset[filter , ]
  } else
  {
    dataset <- dataset[!filter, ]
  }

  cat("... t_clean_clean_dataset()\n")

  return(dataset)
}

#-----------------------------------------------------------

# EOF.


