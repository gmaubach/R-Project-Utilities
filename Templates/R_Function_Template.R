#-----------------------------------------------------------
# Organisation: Wein Wolf Import GmbH & Co. Verwaltungs KG
# Department  : Sales
# Author      : Georg Maubach
#
# Copyright (C) 2016,
#     Wein Wolf Import GmbH & Co. Verwaltngs KG
# All rights reserved.
#-----------------------------------------------------------

cat("\nDefining function_name here ...\n")

#-----------------------------------------------------------
my_function <- function
(
  argument_1 = "some_value",
  argument_2 = "another_value"
)
#-----------------------------------------------------------
#' @title
#'
#' @description
#' \code{function_name} describe what the function does
#'
#' @usage
#'   describe how the function should be called
#'
#' @details
#'   provide important information of how the function
#'   operates
#'   @section Section title is only on line long:
#'   Put the paragraph of the details in this section.
#'   The section title must be followed by a ":" (colon).
#'   @section Warning:
#'   When calling this function make sure that ...
#'
#' @param param_name (type of the parameter)
#'   Describe what the parameter does,
#'   start with capital letter and end with fullstop,
#'   all parameters must be documented.
#'
#' @return describes the output of a function
#'
#' @examples
#'   provide executable R code showing how to use the
#'   function in practice
#'
#' @include filename.R to be loaded before this function
#'
#' @family  add appropriate lists/interlinks to seealso
#' @seealso point to other useful resources
#' @aliases add additional aliases through which the user
#'   can find the documentation with "?"
#' @concept add extra keywords that will be found with
#'   help.search()
#' @keywords keyword1 keyword2 ...
#'   to add standardised optional keywords which must be
#'   taken from the predefined list replicated in the
#'   keywords vignette
#'
#' @author Georg Maubach
#'
#' @source give credits to those you provided code
#-----------------------------------------------------------
{
  function_name <- "function_name_here"
  cat(paste(function_name, "...\n"))  # indicate start
  #---------------------------------------------------------

  # Function body

  #---------------------------------------------------------
  cat(paste("...", function_name, "\n"))  # indicate end
}
#-----------------------------------------------------------
cat("Done!\n")
# EOF .
