<<<<<<< HEAD
#-----------------------------------------------------------------------
# Module        : t_setup_project.R
# Author        : Georg Maubach
# Date          : 2016-10-19
# Update        : 2016-10-19
# Description   : Setup a directory structure for a new analytics
#                 project
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7--

t_version = "2016-10-19"
t_module_name = "t_setup_project.R"
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
        "\n",
        "\n",
        "Copyright (C) Georg Maubach 2016

        This software comes with ABSOLUTELY NO WARRANTY.",
        "\n",
        "\n"
    )
)

library(svDialogs)

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- TRUE

# [ Function Defintion ]--------------------------------------------------------
t_setup_project <- function() {
  #-----------------------------------------------------------------------------
  # Setup a directory structure for a new analytics
  #
  # Args:
  #   None.
  #
  # Operation:
  #   The user can create or select a directory for the projects files.
  #   The function then places all sub directories in this project
  #   folder.
  #   The function saves a RData file with objects containing the path
  #   to project directory and its sub folders.
  #
  # Returns:
  #   Nothing.
  #
  # Error handling:
  #   None.
  #
  # See also:
  #   ./.
  #-----------------------------------------------------------------------------

  # Get and/or create project directory
  v_paths_relative <- list()
  v_paths_relative$project <- "C:/temp/MyProject"  # default before user input
  v_paths_relative$project <- svDialogs::dlgDir()$res

  # Define names for sub directories
  data          <- "data"             # data to be loaded into or
                                      # saved from R
  documentation <- "documentation"    # explanatory material for results
                                      # (e. g. knitR documents)
  fundamentals  <- "fundamentals"     # background knowledge
  input         <- "data/input"       # input data eventually manually
                                      # revised for import
  master        <- "data/master"      # master data (e. g. lookup tables)
  output        <- "data/output"
  raw           <- "data/raw"         # a copy of all input data never
                                      # touched for safety reasons and
                                      # not read by R
  program       <- "program"          # all scripts and runnable files
  gather        <- "program/gather"   # scripts to gather data
  import        <- "program/import"   # scripts for data import
  clean         <- "program/clean"    # scripts for data cleaning
  prepare       <- "program/prepare"  # scripts for data prep
  merge         <- "program/merge"    # scripts for data merging
  analyse       <- "program/analyse"  # scripts for data analysis
  present       <- "program/present"  # scripts for data presentation
  modules       <- "program/modules"  # project specific packages, files
                                      # or functions in separate files as
                                      # well as all other sub routines to
                                      # be sourced or loaded
  results       <- "results"          # container for all resulting data
                                      # in an aggregated form
  graphics      <- "results/graphics"
  tables        <- "results/tables"
  presentations <- "results/presentations"
  temp          <- "temp"

  v_project_dir <- v_paths_relative$project

  v_paths_relative <- list(
    project       = v_project_dir,
    documentation = documentation,
    fundamentals  = fundamentals,
    data          = data,
    input         = input,
    master        = master,
    output        = output,
    raw           = raw,
    program       = program,
    gather        = gather,
    import        = import,
    clean         = clean,
    prepare       = prepare,
    merge         = merge,
    analyse       = analyse,
    present       = present,
    modules       = modules,
    results       = results,
    graphics      = graphics,
    tables        = tables,
    presentations = presentations,
    temp          = temp
  )

  v_paths_full      <- list(
    project       = v_project_dir,
    documentation = file.path(v_project_dir, documentation),
    fundamentals  = file.path(v_project_dir, fundamentals),
    data          = file.path(v_project_dir, data),
    input         = file.path(v_project_dir, input),
    master        = file.path(v_project_dir, master),
    output        = file.path(v_project_dir, output),
    raw           = file.path(v_project_dir, raw),
    program       = file.path(v_project_dir, program),
    gather        = file.path(v_project_dir, gather),
    import        = file.path(v_project_dir, import),
    clean         = file.path(v_project_dir, clean),
    prepare       = file.path(v_project_dir, prepare),
    merge         = file.path(v_project_dir, merge),
    analyse       = file.path(v_project_dir, analyse),
    present       = file.path(v_project_dir, present),
    modules       = file.path(v_project_dir, modules),
    results       = file.path(v_project_dir, results),
    graphic       = file.path(v_project_dir, graphics),
    tables        = file.path(v_project_dir, tables),
    presentations = file.path(v_project_dir, presentations),
    temp          = file.path(v_project_dir, temp)
    )

  # Create sub directories if they are not there
  cat("-------------------------------------------------------------\n")
  cat("Creating directories ...\n")
  for (entry in v_paths_full) {
    if (file.exists(entry)) {
      cat("Directory ", entry, " NOT created. Exists already!\n")
    } else {
      dir.create(path = entry, recursive = TRUE)
      cat("Directory ", entry, " created!\n")
    }  # end if
  }  # end for
  cat("... Done! (Creating directories)\n")
  cat("-------------------------------------------------------------\n")

  # Save config file
  cat("-------------------------------------------------------------\n")
  cat("Saving project config file ...\n")
  v_file_config <- file.path(v_paths_full$program,
                             "project_config.RData")
  save(list = c("v_paths_full", "v_paths_relative"),
       file = v_file_config
  )
  cat("File ", v_file_config, " created!\n")
  cat("... Done! (Saving path names)\n")
  cat("-------------------------------------------------------------\n")

  # Save README file
  cat("-------------------------------------------------------------\n")
  cat("Saving README.md file ...\n")
readme <- "
---
title: 'Your project title here
author: 'Author(s) name(s) here'
date: 'Current date here'
output: html_document
---

  ```{r setup, include=FALSE}
  knitr::opts_chunk$set(echo = TRUE, cache = FALSE)
  ```
  # Project Context

  # Goals

  # Approach
  ## Exploring the problem
  ## Exploring the solution
  ## Defining data usage

  # Data Mining
  ## Data import
  ## Data preparation
  ## Data surveying
  ## Data modeling

  # Deployment

  # Programs
  ´´´{r}
  source('main.R')
  ´´´

  # Information on used system and configuration
  ```{r}
  cat('Gathering system information after running main_program.R ...\n')
  sessionInfo()
  cat('... Done! (Gathering system information)\n')
  ```
  # EOF .
"
cat(readme, file = file.path(v_project_dir,
                             "README.md"))

rm("v_project_dir")

}  # end function

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    t_setup_project()
    }  # end if
}  # end function

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF .
=======
#-----------------------------------------------------------------------
# Module        : t_setup_project.R
# Author        : Georg Maubach
# Date          : 2016-10-19
# Update        : 2016-10-19
# Description   : Setup a directory structure for a new analytics
#                 project
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7--

t_version = "2016-10-19"
t_module_name = "t_setup_project.R"
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
        "\n",
        "\n",
        "Copyright (C) Georg Maubach 2016

        This software comes with ABSOLUTELY NO WARRANTY.",
        "\n",
        "\n"
    )
)

library(svDialogs)

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- TRUE

# [ Function Defintion ]--------------------------------------------------------
t_setup_project <- function() {
  #-----------------------------------------------------------------------------
  # Setup a directory structure for a new analytics
  #
  # Args:
  #   None.
  #
  # Operation:
  #   The user can create or select a directory for the projects files.
  #   The function then places all sub directories in this project
  #   folder.
  #   The function saves a RData file with objects containing the path
  #   to project directory and its sub folders.
  #
  # Returns:
  #   Nothing.
  #
  # Error handling:
  #   None.
  #
  # See also:
  #   ./.
  #-----------------------------------------------------------------------------

  # Get and/or create project directory
  v_paths_relative <- list()
  v_paths_relative$project <- "C:/temp/MyProject"  # default before user input
  v_paths_relative$project <- svDialogs::dlgDir()$res

  # Define names for sub directories
  data          <- "data"             # data to be loaded into or
                                      # saved from R
  documentation <- "documentation"    # explanatory material for results
                                      # (e. g. knitR documents)
  fundamentals  <- "fundamentals"     # background knowledge
  input         <- "data/input"       # input data eventually manually
                                      # revised for import
  master        <- "data/master"      # master data (e. g. lookup tables)
  output        <- "data/output"
  raw           <- "data/raw"         # a copy of all input data never
                                      # touched for safety reasons and
                                      # not read by R
  program       <- "program"          # all scripts and runnable files
  gather        <- "program/gather"   # scripts to gather data
  import        <- "program/import"   # scripts for data import
  clean         <- "program/clean"    # scripts for data cleaning
  prepare       <- "program/prepare"  # scripts for data prep
  merge         <- "program/merge"    # scripts for data merging
  analyse       <- "program/analyse"  # scripts for data analysis
  present       <- "program/present"  # scripts for data presentation
  modules       <- "program/modules"  # project specific packages, files
                                      # or functions in separate files as
                                      # well as all other sub routines to
                                      # be sourced or loaded
  results       <- "results"          # container for all resulting data
                                      # in an aggregated form
  graphics      <- "results/graphics"
  tables        <- "results/tables"
  presentations <- "results/presentations"
  temp          <- "temp"

  v_project_dir <- v_paths_relative$project

  v_paths_relative <- list(
    project       = v_project_dir,
    documentation = documentation,
    fundamentals  = fundamentals,
    data          = data,
    input         = input,
    master        = master,
    output        = output,
    raw           = raw,
    program       = program,
    gather        = gather,
    import        = import,
    clean         = clean,
    prepare       = prepare,
    merge         = merge,
    analyse       = analyse,
    present       = present,
    modules       = modules,
    results       = results,
    graphics      = graphics,
    tables        = tables,
    presentations = presentations,
    temp          = temp
  )

  v_paths_full      <- list(
    project       = v_project_dir,
    documentation = file.path(v_project_dir, documentation),
    fundamentals  = file.path(v_project_dir, fundamentals),
    data          = file.path(v_project_dir, data),
    input         = file.path(v_project_dir, input),
    master        = file.path(v_project_dir, master),
    output        = file.path(v_project_dir, output),
    raw           = file.path(v_project_dir, raw),
    program       = file.path(v_project_dir, program),
    gather        = file.path(v_project_dir, gather),
    import        = file.path(v_project_dir, import),
    clean         = file.path(v_project_dir, clean),
    prepare       = file.path(v_project_dir, prepare),
    merge         = file.path(v_project_dir, merge),
    analyse       = file.path(v_project_dir, analyse),
    present       = file.path(v_project_dir, present),
    modules       = file.path(v_project_dir, modules),
    results       = file.path(v_project_dir, results),
    graphic       = file.path(v_project_dir, graphics),
    tables        = file.path(v_project_dir, tables),
    presentations = file.path(v_project_dir, presentations),
    temp          = file.path(v_project_dir, temp)
    )

  # Create sub directories if they are not there
  cat("-------------------------------------------------------------\n")
  cat("Creating directories ...\n")
  for (entry in v_paths_full) {
    if (file.exists(entry)) {
      cat("Directory ", entry, " NOT created. Exists already!\n")
    } else {
      dir.create(path = entry, recursive = TRUE)
      cat("Directory ", entry, " created!\n")
    }  # end if
  }  # end for
  cat("... Done! (Creating directories)\n")
  cat("-------------------------------------------------------------\n")

  # Save config file
  cat("-------------------------------------------------------------\n")
  cat("Saving project config file ...\n")
  v_file_config <- file.path(v_paths_full$program,
                             "project_config.RData")
  save(list = c("v_paths_full", "v_paths_relative"),
       file = v_file_config
  )
  cat("File ", v_file_config, " created!\n")
  cat("... Done! (Saving path names)\n")
  cat("-------------------------------------------------------------\n")

  # Save README file
  cat("-------------------------------------------------------------\n")
  cat("Saving README.md file ...\n")
readme <- "
---
title: 'Your project title here
author: 'Author(s) name(s) here'
date: 'Current date here'
output: html_document
---

  ```{r setup, include=FALSE}
  knitr::opts_chunk$set(echo = TRUE, cache = FALSE)
  ```
  # Project Context

  # Goals

  # Approach
  ## Exploring the problem
  ## Exploring the solution
  ## Defining data usage

  # Data Mining
  ## Data import
  ## Data preparation
  ## Data surveying
  ## Data modeling

  # Deployment

  # Programs
  ´´´{r}
  source('main.R')
  ´´´

  # Information on used system and configuration
  ```{r}
  cat('Gathering system information after running main_program.R ...\n')
  sessionInfo()
  cat('... Done! (Gathering system information)\n')
  ```
  # EOF .
"
cat(readme, file = file.path(v_project_dir,
                             "README.md"))

rm("v_project_dir")

}  # end function

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    t_setup_project()
    }  # end if
}  # end function

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF .
>>>>>>> 6a1559803cc7dce762db711211b01d8702585ae9
