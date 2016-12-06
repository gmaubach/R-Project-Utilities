#-----------------------------------------------------------
# Organisation: Wein Wolf Import GmbH & Co. Verwaltungs KG
# Department  : Sales
# Author      : Georg Maubach
# Contributors: n/a
#
# Copyright (C) 2016,
#     Wein Wolf Import GmbH & Co. Verwaltngs KG
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
#' @title t_select_chunks()
#'
#' @description
#' \code{t_select_chunks} selects elements from a
#' sequence of elements of a character vector.
#'
#' @usage
#'   t_select_chunks(
#'     vector,
#'     first_elements,
#'     last_elements)
#'
#' @details
#'   The function can be used to select chunks of elements
#'   from a given vector.
#'   The function selects all elements which are placed
#'   between the first_elements and the last_elements.
#'   The first_elements and the last_elements are included in
#'   the element list.
#'   It is possible - but maybe not intended - to select
#'   chunks which element sequence overlap. The user has to
#'   take care which elements are selected from the sequence
#'   of elements in the vector.
#'   The sequence of elements is not touched but taken as
#'   is from the order in the vector argument.
#'   @section ** ATTENTION **
#'   If you want your program to operate properly under
#'   different circumstances, e. g. have changing
#'   vector element positions, you should sort the elements
#'   in your vector ** BEFORE ** calling this function.
#'   @section ** ATTENTION **
#'   The first_elements have to appear ** BEFORE ** the
#'   last_elements in the given vector. An operation giving
#'   the last_elements as first_elements and first_elements
#'   as last_elements is neither defined nor tested.
#'   @section Remark
#'   If you encounter the error message "Error in
#'   start_position:end_position : argument of length 0"
#'   don't worry. Most of the time the error results from a
#'   variables given as an argument taht does ot exist in
#'   given vector.
#'
#' @param vector         (character vector)
#' @param first_elements (character vector)
#' @param last_elements  (character vector)
#'
#' @return The funtions returns a list of elements between
#' first_elements and last_elements.
#'
#' @examples
#' names(mtcars)
#'
#' t_select_chunks(
#'   vector = names(mtcars),
#'   first_elements = c("hp"),
#'   last_elements = c("vs")
#'   )
#'
#' t_select_chunks(
#'   vector = names(mtcars),
#'   first_elements = c("hp", "cyl"),
#'   last_elements = c("vs", "gear")  # overlapping sequence
#'   )
#'
#' @include No library required, no dependencies.
#'
#' @seealso \code{\link[base]{subset}}.
#' @aliases select variables
#'
#' @author Georg Maubach
#'
#' @export
#-----------------------------------------------------------
t_select_chunks <- function(
  vector,
  first_elements,
  last_elements)
{
  function_name <- "t_select_chunks()"
  cat(paste(function_name, "...\n"))
  #---------------------------------------------------------

  # Pre-Condition
  stopifnot(identical(length(first_elements),
                      length(last_elements)))

  selected_elements <- c()

  for (element in seq_along(1:length(first_elements)))
  {
    start_position <- which(vector == first_elements[element])
    end_position   <- which(vector == last_elements[element])
    temp <- vector[start_position:end_position]
    selected_elements <- c(selected_elements, temp)
  }

  #---------------------------------------------------------
  cat(paste("...", function_name, "\n"))

  invisible(selected_elements)
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

