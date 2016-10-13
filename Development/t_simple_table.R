#-----------------------------------------------------------------------
# Module        : t_simple_table.R
# Author        : Georg Maubach
# Date          : 2016-10-11
# Update        : 2016-10-11
# Description   : Create simple SPSS like table
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7--

t_version = "2016-10-11"
t_module_name = "t_simple_table.R"

cat(
    paste0("\n",
           t_module_name,
           " (Version: ",
           t_version, ",
           Status: ",
           t_status, ")",
           "\n", "\n",
           "Copyright (C) Georg Maubach 2016

           This software comes with ABSOLUTELY NO WARRANTY.",
           "\n", "\n"))

# If do_test is not defined globally define it here locally by
# un-commenting it
t_do_test <- FALSE

# [ Function Defintion ]------------------------------------------------
t_simple_table <- function(variable,
                           useNA = FALSE,
                           na_value = -999,
                           print = FALSE,
                           sort = "values",
                           pct_decimals = 1,
                           pct_cum_decimals = 1) {
    #' @title Create a simple table for one variable.
    #'
    #' @description t_simple_table creates absolute and relative
    #' frequencies, cumulative sums and column sums for both as well as
    #' overall statistics about valid N and missing values.
    #'
    #'
    #' @param variable (vector, list, data.frame): variable the table is
    #' created for.
    #' @param useNA (logical): flag to include or exclude missing values
    #' from the computation.
    #' @param na_value (character): string for NA replacement.
    #' @param print (logical): flag to print/not print a table before
    #' returning it as an object.
    #' @param sort (character): sort = "categories" sorts according to
    #' the values within the variable, "values" sorts according to the
    #' frequencies the values within the variable have.
    #' @param pct_decimals (numeric): number of decimal values for
    #' frequencies.
    #' @param pct_cum_decimals (numeric): number of decimal values for
    #' percentages.
    #'
    #' @operation
    #' Coerces the given variable to a factor.
    #' If useNA = TRUE NA is also transformed to a valid value,
    #' if useNA = FALSE it is disregarded in all operations.
    #'
    #' @return Returns a list with two tables:
    #'
    #' Statistics
    #'           abs    pct
    #' valid_n     .      .
    #' missing     .      .
    #' total       .    100
    #'
    #' Table
    #'                 Frequencies   Percent   Cumulative    Cumulative
    #'                                         Frequency     Percent
    #' Valid                     .         .
    #' Missing                   .         .
    #' Total                     .       100
    #' Categories
    #'   Cat 1                   .         .            .             .
    #'   Cat 2                   .         .            .             .
    #'   Cat 3                   .         .            .             .
    #'   ...                     .         .        Total           100
    #'   Total                   .       100
    #'
    #' @errorhandling None
    #'
    #' @version "0.1"
    #'
    #' @created "2016-10-11"
    #' @updated "2016-10-11"
    #'
    #' @status development
    #'
    #' @see Manderscheid: Sozialwissenschaftliche Datenanalyse mit R,
    #' p. 79ff
    #'
    #' @author Georg Maubach
    #'
    #' @license GPL-2
    #'

    # Hier weiter
    # Verarbeitung von NA fortsetzen
    if (useNA = TRUE) {
        variable[is.na(variable)] == na_value
        to_analyse <- as.factor(unclass(variable))
    } else if (inherits(x = variable,
                 what = "factor")) {
        to_analyse <- variable
    } else {
        to_analyse <- as.factor(variable)
    }

    columns = 1

    # test <- c(1, 2, 3, NA)
    # to_analyse <- test
    # pct_decimals <- 1
    # pct_cum_decimals <- 1

    abs <- table(to_analyse, useNA = "no")

    if (sort == "categories") {
        # sort according to variable values
    } else if (sort == "values") {
        # sort accoding to value frequencies
    } else {
        # print error message due to false value for paramter "sort"
    }

    abs_cum <- cumsum(abs)

    relative <- prop.table(abs)
    # relative_cumsum <- cumsum(relative)

    pct <- relative * 100
    pct_cum <- cumsum(pct)

    table <- cbind(abs, pct,
                   abs_cum, pct_cum)
    # print(table)
    # str(table)

    table <- data.frame(addmargins(table, columns))

    # print(table)
    # str(table)

    table$pct <- round(table$pct, pct_decimals)
    table$pct_cum <- round(table$pct_cum, pct_cum_decimals)
    rownames(table)[ncol(table)] <- c("total")
    # print(table)
    # str(table)
    table["total","pct_cum"] <- NA

    statistics <- data.frame(valid_n = c(), abs = c())
    statistics["valid_n", "abs"] <- sum(!is.na(to_analyse))
    statistics["missing", "abs"] <- sum(is.na(to_analyse))
    temp <- prop.table(statistics$abs) * 100
    statistics$pct <- temp
    statistics["total", "abs"] <- sum(statistics$abs, na.rm = TRUE)
    statistics["total", "pct"] <- sum(statistics$pct, na.rm = TRUE)
    statistics$pct <- round(statistics$pct, pct_decimals)

    # print(statistics)

    if (print == TRUE) {
        cat("\n")
        cat("Statistics\n")
        print(statistics)

        cat("\n")

        cat("Table\n")
        print(table)
    }

    rm(columns,
       abs, abs_cum,
       relative, pct, pct_cum,
       table, statistics,
       temp)

    result <- c(statistics, table)
    invisible(result)
}

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
    if (do_test == TRUE) {
        cat("\n", "\n", "Test function ", t_module_name, "\n", "\n")

        # Example dataset
        gene <- c("ENSG00000208234","ENSG00000199674","ENSG00000221622","ENSG00000207604",
                  "ENSG00000207431","ENSG00000221312","ENSG00134940305","ENSG00394039490",
                  "ENSG09943004048")
        hsap <- c(0,0,0, 0, 0, 0, 1,1, 1)
        mmul <- c(NA,2 ,3, NA, 2, 1 , NA,2, NA)
        mmus <- c(NA,2 ,NA, NA, NA, 2 , NA,3, 1)
        rnor <- c(NA,2 ,NA, 1 , NA, 3 , NA,NA, 2)
        cfam <- c(NA,2,NA, 2, 1, 2, 2,NA, NA)
        ds_example <- data.frame(gene, hsap, mmul, mmus, rnor, cfam)
        ds_example$gene <- as.character(ds_example$gene)

        # Test 1
        print("Test 2: Rename all variables but providing to few names")

        cat("\n", "\n", "Example dataset before function call", "\n", "\n")
        print(ds_example)

        cat("\n", "\n", "Function call", "\n", "\n")

        # ds_example <- t_rename_variables(dataset = ds_example,
        #                                  old_varnames = NULL,
        #                                  new_varnames = c("var1", "var2"))

        cat("\n", "\n", "Example dataset after function call", "\n", "\n")
        print(ds_example)

        # Test 2
        print("Test 2: Rename all variables")

        cat("\n", "\n", "Example dataset before function call", "\n", "\n")
        print(ds_example)

        cat("\n", "\n", "Function call", "\n", "\n")

        ds_example <- t_rename_variables(dataset = ds_example,
                                         old_varnames = NULL,
                                         new_varnames = c("var1", "var2", "var3",
                                                          "var4", "var5", "var6"))

        cat("\n", "\n", "Example dataset after function call", "\n", "\n")
        print(ds_example)

        # Test 3
        print("Test 3: Rename selected variables")

        cat("\n", "\n", "Example dataset before function call", "\n", "\n")
        print(ds_example)

        cat("\n", "\n", "Function call", "\n", "\n")

        ds_example <- t_rename_variables(dataset = ds_example,
                                         old_varnames = c("mmul", "mmus"),
                                         new_varnames = c("var1", "var2"))

        cat("\n", "\n", "Example dataset after function call", "\n", "\n")
        print(ds_example)

        # Test 4
        print("Test 4: Rename selected variables but given wrong amount of variables")

        cat("\n", "\n", "Example dataset before function call", "\n", "\n")
        print(ds_example)

        cat("\n", "\n", "Function call", "\n", "\n")

        # ds_example <- t_rename_variables(dataset = ds_example,
        #                                  old_varnames = c("var1", "var2","var3"),
        #                                  new_varnames = c("mmul", "mmus"))

        cat("\n", "\n", "Example dataset after function call", "\n", "\n")
        print(ds_example)
    }
}

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF .

