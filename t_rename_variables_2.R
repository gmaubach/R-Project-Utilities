#-----------------------------------------------------------
# Module        : t_rename_variables_2.R
# Author        : Georg Maubach
# Date          : 2016-05-25
# Update        : 2017-02-21
# Description   : Rename variable lists
# Source System : R 3.2.2 (64 Bit)
# Target System : R 3.2.2 (64 Bit)
#
# This program is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
# PURPOSE.
#--------1---------2---------3---------4---------5---------6

t_version = "2017-02-21"
t_module_name = "t_rename_variables_2.R"
t_status = "released"

cat(
  paste0("\n",
         t_module_name,
         " (Version: ", t_version,
         ", Status: ", t_status, ")", "\n", "\n",
         "Copyright (C) Georg Maubach 2017", "\n", "\n",
         "This software comes with ABSOLUTELY NO WARRANTY.",
         "\n", "\n"))

# If do_test is not defined globally define it here locally
# by un-commenting it.
t_do_test <- FALSE

# [ Function Defintion ]------------------------------------
t_rename_variables_2 <- function
(
  var_names,  # complete variable name list of data set
  old_names,  # list of variable name to be changed
  new_names   # list of new variable names
)
  #-----------------------------------------------------------
#' @title
#'
#' @description
#' \code{function_name} Renames variables in a list of
#' variables
#'
#' @usage
#'   t_rename_variable_2(
#'     var_names = names(data.frame),
#'     old_names = list(old_variable_names),
#'     new_names = list(new_variable_names))
#'
#' @param var_names (list)
#'   Contains a list of all variable names of the data set.
#'
#' @param old_names (list)
#'   Contains a list of variable names subject to be
#'   changed.
#'
#' @param new_names (list)
#'   Contains a list of variable names that subsitute the
#'   old variable names in old_names.
#'
#' @details
#'   @section Operation:
#'   The variable list is intended to be a super set of the
#'   variable list in old_names.
#'
#'   All variables in var_names having a corresponding
#'   old variable name in old_names will be replaced with
#'   the corresponding variable name in new_names.
#'
#'   If the variable list in var_names is a super set of the
#'   variable list in old_names the variables of old_names
#'   not included in old_names will be kept as they are.
#'
#'   If the variable list in old_names is a super set of
#'   var_names the superfluous variables are ignored.
#'
#'   If the values to old_names and new_names are character
#'   vectors they are coerced to list.
#'
#'   @section Error Handling:
#'   It is checked that the length of the argument old_names
#'   is identical to the length of new_names.
#'
#'   @section Side Effects:
#'   None.
#'
#'   @section Warning:
#'   When calling this function make sure that the list in
#'   old_names is as long as the list in new_names.
#'   Also make sure that the correct variable names in
#'   old_names correspond in position with the variable
#'   names in new_names.
#'
#' @return Returns a variable list where the old variable
#' names are replaced by the new variable names.
#'
#' @examples
#'   Please see test in source code.
#'
#' @author Georg Maubach
#'
#' @credits Zumel: Practical Data Science with R,
#'          Shelter Island (NY): Manning, 2014, p. 23
#-----------------------------------------------------------
{
  function_name <- "t_rename_variables_2()"
  cat(paste(function_name, " ...\n"))  # indicate start
  #---------------------------------------------------------

  stopifnot(identical(length(old_names), length(new_names)))

  if (inherits(old_names, "list"))
  {
    # skip
  } else if (inherits(old_names, "character"))
  {
    old_names <- as.list(old_names)
  } else
  {
    stop("Argument 'old_names' must be of class ",
         "'character' or 'list'!")
  }

  if (inherits(new_names, "list"))
  {
    # skip
  } else if (inherits(new_names, "character"))
  {
    new_names <- as.list(new_names)
  } else
  {
    stop("Argument 'new_names' must be of class ",
         "'character' or 'list'!")
  }

  # Create a mapping containing old_names as keys
  # and new_names as values
  mapping <- setNames(
    new_names,
    old_names)

  # Replace the old_names with new_names where ever
  # old_names and new_names are available.
  # The operator [] is vectorised. This way all entries in
  # mapping matching the old_names are replaced with the
  # corresponding new names.
  # Credits: Zumel: Practical Data Science with R,
  #          Shelter Island (NY): Manning, 2014, p. 23
  result <- mapping[var_names]

  # Transform the result list into a character vector.
  result <- as.character(result)

  # If the list of old_names and new_names is a sub set of
  # var_names, i. e. some variables in var_names are missing
  # in old_names, variables in result will be "NULL".
  # Therefore replace any element "NULL" with the
  # corresponding variable name from var_names.
  result[result == "NULL"] <- var_names[result == "NULL"]

  #---------------------------------------------------------
  cat(paste("...", function_name, "\n"))  # indicate end

  return(result)
}

#-----------------------------------------------------------

# [ Test Defintion ]----------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    cat("\n", "\n", "Test function ",
        t_module_name, "\n", "\n")

    # Example dataset
    var1 <- 1:3
    var2 <- 1:3
    var3 <- 1:3

    ds <- data.frame(var1, var2, var3)
    print(ds)

    print("Change one existing variable ...")
    ds1 <- ds
    names(ds1) <- t_rename_variables_2(
      names(ds),
      c("var1"),
      c("changed1"))
    print(ds1)

    print("Change two existing variables ...")
    names(ds1) <- t_rename_variables_2(
      names(ds),
      c("var2", "var3"),
      c("changed2", "changed3"))
    print(ds1)

    print("Change one existing and one non-existing variable ...")
    names(ds1) <- t_rename_variables_2(
      names(ds),
      c("var2", "var4"),
      c("changed2", "changed4"))
    print(ds1)
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

