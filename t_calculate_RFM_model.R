#-----------------------------------------------------------
# Organisation: Wein Wolf Import GmbH & Co. Verwaltungs KG
# Department  : Sales
# Author      : Georg Maubach
# Contributors: n/a
#
# Copyright (C) 2016,
#     Wein Wolf Import GmbH & Co. Verwaltungs KG
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

t_module_name = "t_calculate_RFM_model.R"
t_version = "2016-12-14"
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

library(Hmisc)

# If do_test is not defined globally define it here locally
# by un-commenting it. Switch t_do_test to TRUE to run test.
t_do_test <- FALSE

#-----------------------------------------------------------
t_calculate_RFM_model <- function
(basis_4_regency,
 basis_4_frequency,
 basis_4_monetary,
 classes = 4,
 regency_weight = 1,
 frequency_weight = 1,
 monetary_weight = 1)
#-----------------------------------------------------------
#' @title t_calculate_RFM_model()
#'
#' @description
#' \code{function_name} Calculates the values for a
#' Regency-Frequency-Monetary model.
#'
#' @usage
#'   RFM <- t_calculate_RFM_model()
#'
#' @details
#'   Calcualtes the values for an RFM model:
#'   @section Regency
#'   The regency class is derived from a given time
#'   difference given in basis_4_regency.
#'   For this the function Hmisc::cut2 is used.
#'   The shortest time difference gets the highest class
#'   value, the longest time diffeerence gets the lowest
#'   class value.
#'   @section Frequency
#'   Calculates the frequency class using basis_4_frequency.
#'   @section Monetary
#'   Calculates the monetary class using basis_4_monetary.
#'   @section Rational for parameter names
#'   The RFM Analysis was developed using the elapsed amount
#'   of time from the last order, the frequency of orders
#'   and the volume of order given in sum of turnover.
#'   Nowadays RFM-Analysis is also done with other base
#'   values, e.g. gross margin instead of turnover. To
#'   reflect this situation the argument names are generic.
#'
#' @param basis_4_regency (numeric)
#'   A numeric vector with numbers representing time
#'   differences.
#' @param basis_4_frequency (numeric)
#' @param basis_4_monetary (numeric)
#' @param classes (numeric)
#'   Number of classes to generate.
#' @param regency_weight (numeric)
#' @param frequency_weight (numeric)
#' @param monetary_weight (numeric)
#'   The RFM Score can be calculated with every part having
#'   the same weight. If you decide to weight the parts you
#'   can use the different weighting arguments.
#'
#' @return Returns a complex object containing
#' (1) a list of factors with regency, frequency and
#' monetary classes,
#' (2) a list of vectors with regency, frequency and
#' monetary class boundaries,
#' (3) a list of vectors with regency, frequency and
#' monetary class values,
#' (4) a list with the RFM score with the score number and
#' the rescaled score number.
#' The return object can be subsetted twice, e.g.
#' RFM$classes$regency, RFM$boundaries$monetary,
#' RFM$score$value, RFM$score$rescaled.
#'
#' @author Georg Maubach
#'
#' @source
#' https://en.wikipedia.org/wiki/RFM_(customer_value)
#' Tsipsis: Segmentation for Retailers,
#'   in: Tsipsis: Data Mining Techniques for Retailers
#'   p. 333 - 348
#' Han, Jackie: Calculating Customer Lifetime Value with
#'   Recency, Frequency, and Monetary (RFM)
#'   (http://www.r-bloggers.com/calculating-customer-lifetime-value-with-recency-frequency-and-monetary-rfm/)
#' Ohri, Ajay: R for Business Analytics, p. 299f
#' http://stackoverflow.com/questions/4126326/how-to-quickly-form-groups-quartiles-deciles-etc-by-ordering-columns-in-a
#' http://stackoverflow.com/questions/2375587/reorder-levels-of-a-factor-without-changing-order-of-values
#-----------------------------------------------------------
{
  function_name <- "t_calculate_RFM_model()"
  cat(paste(function_name, "...\n"))  # indicate start
  #---------------------------------------------------------

  library(Hmisc)

  #---------------------------------------------------------

  cat("Calculating 'Regency' ...\n")
  regency_classes <- Hmisc::cut2(x = basis_4_regency,
                               g = classes)
  # 1 is very recent, while 4 is least recent
  # (= best 1 to worst 4)
  # table(regency_class)

  # 4 shall be the best value in all measures
  # while 1 shall be the worst value.
  # Thus classification of "regency_class" has to be reworked,
  # i. e. reversed:
  # from 1 - 2 - 3 - 4  to
  #      4 - 3 - 2 - 1.
  regency_classes <- factor(regency_classes,
                          levels = rev(levels(regency_classes)))

  regency_boundaries <- as.character(regency_classes)

  regency_values <- as.numeric(regency_classes)

  cat("Done.\n")

  #---------------------------------------------------------

  cat("Calculating 'Frequency' ... \n")

  frequency_classes <- Hmisc::cut2(x = basis_4_frequency,
                                   g = classes)
  # 1 is least frequent, while 4 is most frequent
  # (= low 1 to high 4)

  frequency_boundaries <- as.character(frequency_classes)

  frequency_values <- as.numeric(frequency_classes)

  cat("Done.\n")

  #---------------------------------------------------------

  cat("Calculate 'Monetary' ... \n")

  monetary_classes <- Hmisc::cut2(x = basis_4_monetary,
                                g = classes)
  # 1 is lowest sales, while 4 is highest sales
  # (= low 1 to high 4)

  monetary_boundaries <- as.character(monetary_classes)

  monetary_values <- as.numeric(monetary_classes)

  cat("Done.\n")

  #---------------------------------------------------------

  cat("Calculate RFM Score ...\n")

  RFM_Score <-
    paste0(
      as.character(regency_weight * as.numeric(regency_classes)),
      as.character(frequency_weight * as.numeric(frequency_classes)),
      as.character(monetary_weight * as.numeric(monetary_classes))
  )
  RFM_Score <- as.numeric(RFM_Score)
  cat("Done.\n")

  #---------------------------------------------------------

  cat("Calculate RFM Score rescaled ...\n")

  RFM_Score_rescaled <- (RFM_Score - min(RFM_Score)) /
    (max(RFM_Score) - min(RFM_Score))
  # Tsipsis: Segmentation for Retailers,
  # Chapter 8: Data Mining Techniques for Retailers
  # p. 337f
  # min(RFM_Score_rescaled)
  # max(RFM_Score_rescaled)

  cat("Done.\n")

  #---------------------------------------------------------

  RFM_Model <- list(
    classes = list(
      regency = regency_classes,
      frequency = frequency_classes,
      monetary = monetary_classes),
    boundaries = list(
      regency = regency_boundaries,
      frequency = frequency_boundaries,
      monetary = monetary_boundaries),
    values = list(
      regency = regency_values,
      frequency = frequency_values,
      monetary = monetary_values),
    scores = list(
      value = RFM_Score,
      rescaled = RFM_Score_rescaled
    )
  )

  #---------------------------------------------------------
  cat(paste("...", function_name, "\n"))  # indicate end

  return(RFM_Model)
}

# [ Test Defintion ]----------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    # Example dataset
    # To be done
    ds_test <- data.frame()

    # Call function
    # To be done

    # Dataset after function call
    invisible(ds_test)
  }
}

# [ Test Run ]----------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]----------------------------------------------
rm("t_module_name",
   "t_version",
   "t_status",
   "t_do_test",
   "t_test")

# EOF .





