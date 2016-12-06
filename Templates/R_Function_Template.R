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

t_module_name = "t_select_chunks.R"
t_version = "2016-11-30"
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

# If do_test is not defined globally define it here locally
# by un-commenting it. Switch t_do_test to TRUE to run test.
t_do_test <- FALSE

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

