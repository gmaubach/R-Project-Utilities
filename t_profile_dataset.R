#-----------------------------------------------------------------------
# Module        : t_profile_dataset.R
# Author        : Georg Maubach
# Date          : 2016-10-12
# Update        : 2016-10-12
# Description   : Load dataset and print information on contents
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7--

# -- A T T E N T I O N --
# -- module under construction --

t_module_name = "t_profile_data.R"

cat(
    paste0(
        "\n",
        t_module_name,
        ")",
        "\n\n",
        "Copyright (C) Georg Maubach 2016

         This software comes with ABSOLUTELY NO WARRANTY.",
        "\n\n"
    )
)

# If do_test is not defined globally define it here locally by
# un-commenting it.
# Switch t_do_test to TRUE to run test
t_do_test <- FALSE


t_profile_dataset <- function(dataset) {
    #' @title Generate a profile of all variables in the dataset.
    #'
    #' @description t_profile_dataset generates a table containing a
    #' profile of all variables in the dataset.
    #'
    #'
    #' @param dataset (data.frame or data.frame like object):
    #' variable the table is created for.
    #'
    #' @operation
    #' Generates a table containing variables that gives an overview
    #' of what is in all variables in the dataset.
    #'
    #' @rational
    #' The profile of all variables shall help to determine which of the
    #' variables need care when preparing the data and which might be
    #' usefull for further analysis or for modeling.
    #'
    #' @return Returns a table with the following statistics:
    #' max = maximum, min = minimum, rng = range of values,
    #' distinct = amount of different
    #' values, missing = amount of missing values, conf = confidence
    #' level, req = minimum number of records required to establish the
    #' confidence level, lin = interstitial linearity as a measure to
    #' indicate problems with a variable (e. g. monotonicity), vartype =
    #' type of variable (N = numeric and all variables that can be
    #' regarded as such, e. g. factor, C = character, O = other (matrix,
    #' data.frame, data.table, complex))
    #'
    #' The "distinct" value does not count NA, NaN and Inf as values.
    #'
    #' @errorhandling None
    #'
    #' @version "0.1.0"
    #'
    #' @created "2016-10-12"
    #' @updated "2016-10-12"
    #'
    #' @status development
    #'
    #' @see Pyle, Dorian: Data Preparation for Data Mining, London:
    #' Academic Press, 1999, p. 141ff
    #'
    #' @author Georg Maubach
    #'
    #' @license GPL-2
    #'

    # Function to compute the descriptive version of the variance
    f_desc_variance <- function(x) {
        # @see https://de.wikibooks.org/wiki/GNU_R:_Deskriptive_Statistik
        n = length(x)
        return(sum((x - mean(x)) ^ 2)) / (length(x))
    }

    # Function to compute the descriptive version of the standard
    # deviation
    f_desc_std_deviation <- function(x) {
        # @see https://de.wikibooks.org/wiki/GNU_R:_Deskriptive_Statistik
        return(sqrt(f_desc_variance))
    }

    f_distinct <- function(x) {
        not_NA_nor_NaN <- x[!is.na(x)]
        not_NA_nor_NaN_nor_Inf <-
            not_NA_nor_NaN[!is.infinite(not_NA_nor_NaN)]
        return(unique(not_NA_nor_NaN_nor_Inf))
    }

    variables <- names(dataset)

    profile <- data.frame(
        Variable = c(),
        Max = c(),
        Min = c(),
        Distinct = c(),
        hasNA = c(),
        hasNaN = c(),
        hasInf = c(),
        Conf = c(),
        Req = c(),
        Var = c(),
        Lin = c(),
        Vartype = c()
    )

    for (variable in variables) {
        profile["VARIABLE"] <- variable
        if (inherits(variable, "character")) {
            profile["Max"]      <- NA
            profile["Min"]      <- NA
            profile["Rng"]      <- NA
            profile["Distinct"] <- f_distinct(variable)
            profile["hasNA"]    <- sum(is.na(variable))
            profile["hasNaN"]   <- NA
            profile["hasInf"]   <- NA
            profile["Conf"]     <- NA
            profile["Req"]      <- NA
            profile["Var"]      <- NA
            profile["Lin"]      <- NA
            profile["Vartype"]  <- "T"
            profile["Class"]    <- class(variable)[1]
        } else if (inherits(variable, "matrix") |
                   inherits(variable, "data.frame") |
                   inherits(variable, "data.table") |
                   inherits(variable, "complex")) {
            profile["Max"]      <- NA
            profile["Min"]      <- NA
            profile["Rng"]      <- NA
            profile["Distinct"] <- NA
            profile["hasNA"]    <- sum(is.na(variable))
            profile["hasNaN"]   <- sum(is.nan(variable))
            profile["hasInf"]   <- sum(is.infinite(variable))
            profile["Conf"]     <- NA
            profile["Req"]      <- NA
            profile["Var"]      <- NA
            profile["Lin"]      <- NA
            profile["Vartype"]  <- "O"
            profile["Class"]    <- class(variable)[1]
        } else if (inherits(variable, "numeric")) {
            profile["Max"]      <- max(variable, na.rm = TRUE)
            profile["Min"]      <- min(variable, na.rm = TRUE)
            profile["Rng"]      <- diff(profile["MIN"], profile["MAX"])
            profile["Distinct"] <- f_distinct(variable)
            profile["hasNA"]    <- sum(is.na(variable))
            profile["hasNaN"]   <- sum(is.nan(variable))
            profile["hasInf"]   <- sum(is.infinite(variable))
            profile["Conf"]     <- NA
            profile["Req"]      <- NA
            profile["Var"]      <- f_desc_variance(variable)
            profile["Lin"]      <- NA
            profile["Vartype"]  <- "N"
        }
    }
}

# [ Function Defintion ]--------------------------------------------------------
t_inspect_dataset <- function(dataset) {
  # Inspects a dataset and gives basic information about its contents.
  #
  # Args:
  #  dataset
  #    Data frame object.
  #
  # Operation:
  #   Performs checks on datasets.
  #
  # Returns:
  #   Nothing.
  #
  # Error handling:
  #   None.
  #
  # Credits:
  #   Chapman, Chris: R for Marketing Research and Analytics,
  #   Heidelberg: Springer, 2015, p. 59
  #   (3.3.3 Recommended approach to inspecting data)
  #-----------------------------------------------------------------------------

  cat("--------------------- [ t_inspect_dataset() ] ---------------------\n\n")

  library(car)
  library(Hmisc)

  cat('Check if superfluous header lines were loaded ---------------------\n\n')
  print(head(dataset))

  cat('\n\nCheck if additional blank lines at the end were loaded --------\n\n')
  print(tail(dataset))

  cat('\n\nCheck a set of randomly selected rows -------------------------\n\n')
  print(car::some(dataset))

  cat('\n\nFirst glance of the data --------------------------------------\n\n')
  print(summary(dataset))

  cat('\n\nData Overview -------------------------------------------------\n\n')
  print(Hmisc::describe(dataset))

  cat("------------------------------ [ Done ] ---------------------------\n\n")
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {

    # Example dataset
    var1 <- c(1, 2, 3)
    var2 <- c(4, 5, 6)
    d_data1 <- data.frame(var1, var2)

    var3 <- c(7, 8, 9)
    var4 <- c(10, 11, 12)
    d_data2 <- data.frame(var3, var4)

    # Call function
    t_inspect_dataset(dataset = d_data1)
    t_inspect_dataset(dataset = d_data2)
  }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF

