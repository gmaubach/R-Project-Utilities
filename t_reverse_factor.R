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

t_module_name = "t_reverse_factor.R"
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

# If do_test is not defined globally define it here locally
# by un-commenting it. Switch t_do_test to TRUE to run test.
t_do_test <- FALSE

#-----------------------------------------------------------
t_reverse_factor <- function
(
  factor_variable
)
#-----------------------------------------------------------
#' @title t_reverse_factor()
#'
#' @description
#' \code{function_name} Reverse the values and labels of a
#' factor variable.
#'
#' @usage
#'   v_factor <- t_reverse_factor(factor_variable = v_factor)
#'
#' @details
#'   The function reverses the original values within the
#'   factor as well as the labels.
#'
#' @param factor_variable (factor)
#'
#' @return Returns a factor variable with reversed values
#' and factor labels.
#'
#' @examples
#' v_test_1 <- factor(x = c(1, 2, 4, 4, 3, 1, 2, 4, 4, 3,
#'                          3, 3, 3, 3, 1, 1, 1, 1, 1, 1),
#'                    levels = 1:4,
#'                    labels = c("eins", "zwei",
#'                               "drei", "vier"))
#' print(v_test_1)
#' table(v_test_1)
#' print(as.numeric(v_test_1))
#'
#' v_test_2 <- t_reverse_factor(factor_var = v_test_1)
#' print(v_test_2)
#' table(v_test_2)
#' print(as.numeric(v_test_2))
#'
#' v_test_3 <- cbind(v_test_1, v_test_2)
#' head(v_test_3)
#'
#' @author Georg Maubach
#'
#' @source
#' Credits: http://www.cookbook-r.com/Manipulating_data/Changing_the_order_of_levels_of_a_factor/
#' Credits: http://stackoverflow.com/questions/2375587/reorder-levels-of-a-factor-without-changing-order-of-values
#'
#-----------------------------------------------------------
{
  function_name <- "t_reverse_factor() ..."
  cat(paste(function_name, "...\n"))  # indicate start
  #---------------------------------------------------------

  return(
    factor(factor_var,
           levels = rev(levels(factor_var)))
  )

  #---------------------------------------------------------
  cat(paste("...", function_name, "\n"))  # indicate end
}
#-----------------------------------------------------------

# [ Test Defintion ]----------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    v_test_1 <- factor(x = c(1, 2, 4, 4, 3, 1, 2, 4, 4, 3,
                             3, 3, 3, 3, 1, 1, 1, 1, 1, 1),
                       levels = 1:4,
                       labels = c("eins", "zwei",
                                  "drei", "vier"))
    print(v_test_1)
    table(v_test_1)
    print(as.numeric(v_test_1))

    v_test_2 <- t_reverse_factor(factor_var = v_test_1)

    print(v_test_2)
    table(v_test_2)
    print(as.numeric(v_test_2))

    v_test_3 <- cbind(v_test_1, v_test_2)
    head(v_test_3)
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








