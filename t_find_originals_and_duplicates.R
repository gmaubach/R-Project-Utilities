#-------------------------------------------------------------------------------
# Module        : t_find_orignals_and_duplicates.R
# Author        : Georg Maubach
# Date          : 2016-05-30
# Update        : 2016-06-07
# Description   : Find original values and their duplicates
# Source System : R 3.2.2 (64 Bit)
# Target System : R 3.2.2 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-06-07"
t_module_name = "t_find_originals_and_duplicates.R"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ")", "\n", "\n",
         "This software comes with ABSOLUTELY NO WARRANTY.",
         "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- TRUE

# [ Function Defintion ]--------------------------------------------------------
t_find_originals_and_duplicates <- function(dataset,
                                            key_variable) {
  # Find the originals and their corresponding duplicates
  #
  # Args:
  #   dataset (data frame, data table):
  #     Object with dimnames, e.g. data frame, data table.
  #   key_variable (string):
  #     Variable name as string that shall be used to
  #     identify duplicates. Only one key variable is
  #     allowed.
  #
  # Operation:
  #   Finds the duplicates in the key_variable. These values
  #   are used to filter the dataset to get the originals
  #   and the corresponding duplicates.
  #
  # Returns:
  #   A logical vector with as many rows as the original
  #   dataset. Each value indicates if the cases is an
  #   original which has duplicates or is a duplicate of an
  #   original case. This way the originals and the
  #   corresponding duplicates are returned.
  #
  # Error handling:
  #   None.
  #
  # Rational:
  #   R function duplicated() delivers a list of duplicates
  #   and leaves the original values out. To determine what
  #   has to be done with the duplicate cases, it is
  #   sometimes necessary to compare the duplicates with
  #   their corresponding originals. Duplicate cases might
  #   have different values in variables other than key
  #   variables. These differences can be used to make
  #   decisions of what to do with the duplicate cases.
  #
  # Change log:
  #   The function does not return the complete dataset with
  #   the variable "originals_and_duplicates" any more due
  #   to performance reasons with big datasets. Instead only
  #   a vector is return. This vector can be added to the
  #   dataset after running this function as needed.

  duplicates <- duplicated(dataset[key_variable])

  unique_duplicates <- unique(dataset[duplicates , key_variable])

  originals_and_duplicates <- FALSE

  for (item in unique_duplicates) {
    originals_and_duplicates_per_item <- dataset[[key_variable]] == item
    originals_and_duplicates <-
      originals_and_duplicates | originals_and_duplicates_per_item
  }

  return(originals_and_duplicates)
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    id <- c(1000, 1001, 1001, 1002, 1003, 1003, 1003, 1004)
    customer <-
      c(
        "Customer A",
        "Customer B",
        "Customer B",
        "Customer C",
        "Customer D",
        "Customer D",
        "Customer D",
        "Customer E"
      )
    sales <- c(100, 40, 80, 70, 100, 50, 80, 65)
    purchases <- c(5, 2, 3, 7, 9, 8, 1, 6)

    ds_example <- data.frame(id, customer, sales, purchases)

    cat("\n",
        "\n",
        "Test #1: Check function result",
        "\n",
        "\n")

    cat("\n", "\n", "-- Input --", "\n", "\n")
    print(ds_example)

    cat("\n", "\n", "-- Processing --", "\n", "\n")
    cat(
      "ds_example <- t_find_originals_and_duplicates(ds_example,
                                                     key_variable = 'id')\n")
    print(names(ds_example))
    print("")

    ds_example["originals_and_duplicates"] <-
        t_find_originals_and_duplicates(
          ds_example,
          key_variable = "id")
    print(names(ds_example))
    print("")

    cat("\n", "\n", "--Output--", "\n", "\n")
    print(ds_example)
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_do_test", "t_test")

# EOF .

