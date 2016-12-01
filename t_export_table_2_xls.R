#-----------------------------------------------------------
# Organisation: Wein Wolf Import GmbH & Co. Verwaltungs KG
# Department  : Sales
# Author      : Georg Maubach
#
# Copyright (C) 2016,
#     Wein Wolf Import GmbH & Co. Verwaltngs KG
# All rights reserved.
#
# This program is free software; you can redistribute it
# and/or modify it under the terms of the GNU General Public
# License Version 2 as published by the Free Software
# Foundation.
# (https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
#
# This program is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
# PURPOSE.
#-----------------------------------------------------------

cat("\nDefining t_export_table_2_xls() ... \n")

#-----------------------------------------------------------
t_export_table_2_xls <- function
#-----------------------------------------------------------
#' @title t_export_table_2_xls
#'
#' @description
#' Exportiere Datensatz nach Excel.
#'
#' @usage
#'   t_export_table_2_xls
#'
#' @details
#'   Die Funktion schreibt ganze Datensaetze an eine
#'   vorgegebene Position auf einem Excel-Tabellenblatt.
#'   Sie berechnet nach jeder Uebertragung die Zellposition
#'   unterhalb des eingefuegten Datensatzes.
#'
#' @param param_name (type of the parameter)
#'   Describe what the parameter does,
#'   start with capital letter and end with fullstop,
#'   all parameters must be documented.
#' @param table (data.frame)
#' @param xlsx_workbook (openxlsx workbook)
#' @param sheetname (string)
#' @param row_names (logical)
#' @param col_names (logical)
#' @param row_pos (numerical value)
#' @param col_pos (numerical value)
#' @param border_line (logical)
#'
#' @return
#'   Liefert eine Liste mit zwei Elementen "row_position"
#'   "col_position" zurueck, die die rechte untere Ecke
#'   der eingefuegten Tabelle bezeichnen.
#'   Diese Werte koennen beim erneuten Aufruf der Funktion
#'   als Startpunkte fuer eine weitere Tabelle verwendet
#'   werden.
#'
#' @author Georg Maubach
#'
#-----------------------------------------------------------
  (
  table,
  xlsx_workbook = xlsx_workbook,
  sheetname = "Tab1",
  row_names = FALSE,
  col_names = FALSE,
  row_pos = 1,
  col_pos = 1,
  border_line = FALSE
  )
#-----------------------------------------------------------
{
  function_name <- "t_export_table_2_xls()"
  cat(paste(function_name, "...\n"))
  #---------------------------------------------------------

    stopifnot(sheetname %in% openxlsx::sheets(xlsx_workbook))

    if (border_line == TRUE) {
      borders = c("surrounding")
    } else {
      borders = c("none")
    }

    # str(row_pos)
    # class(row_pos)
    # print(row_pos)

    # Export table to Excel
    openxlsx::writeData(
      wb = xlsx_workbook,
      sheet = sheetname,
      x = table,
      rowNames = row_names,
      colNames = col_names,
      startRow = row_pos,
      startCol = col_pos,
      borders = borders
    )

    row_position <- row_pos + nrow(table)
    if (row_names == TRUE) {
      row_position <- row_position + 1
    }

    col_position <- col_pos + ncol(table)
    if (col_names == TRUE) {
      col_position <- col_position + 1
    }

    position <- list(row_position, col_position)
    names(position) <- c("row_position", "col_position")

    # print(position)
    # str(position)
    # class(position)

  #---------------------------------------------------------
  cat(paste("...", function_name, "\n"))

  invisible(position)
}
#-----------------------------------------------------------
cat("Done!\n")

# EOF .
