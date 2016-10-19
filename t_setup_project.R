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
t_do_test <- FALSE

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
  v_project_dir <- svDialogs::dlgDir()$res

  # Define names for sub directories
  data          <- "data"             # data to be loaded into or
                                      # saved from R
  documentation <- "documentation"    # explanatory material for results
                                      # (e. g. knitR documents)
  fundamentals  <- "fundamentals"     # background knowledge
  input         <- "data/input"       # input data eventually manually
                                      # revised for import
  meta          <- "data/meta"        # meta data (e. g. lookup tables)
  output        <- "data/output"
  raw           <- "data/raw"         # a copy of all input data never
                                      # touched for safety reasons and
                                      # not read by R
  program       <- "program"          # all scripts and runnable files
  modules       <- "program/modules"  # project specific packages, files
                                      # or functions in separate files as
                                      # well as all other sub routines to
                                      # be sourced or loaded
  results       <- "results"          # container for all resulring data
                                      # in an aggregated form
  graphics      <- "results/graphics"
  tables        <- "results/tables"
  presentations <- "results/presentations"
  temp          <- "temp"

  v_paths_relative <- list(
    project       = v_project_dir,
    documentation = documentation,
    fundamentals  = fundamentals,
    input         = input,
    meta          = meta,
    output        = output,
    raw           = raw,
    program       = program,
    modules       = modules,
    graphic       = graphics,
    table         = tables,
    presentation  = presentations,
    temp          = temp
  )
  v_paths_full      <- list(
    documentation = file.path(v_project_dir, documentation),
    fundamentals  = file.path(v_project_dir, fundamentals),
    input         = file.path(v_project_dir, input),
    meta          = file.path(v_project_dir, meta),
    output        = file.path(v_project_dir, output),
    raw           = file.path(v_project_dir, raw),
    program       = file.path(v_project_dir, program),
    modules       = file.path(v_project_dir, modules),
    graphic       = file.path(v_project_dir, graphics),
    table         = file.path(v_project_dir, tables),
    presentation  = file.path(v_project_dir, presentations),
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

  cat("Don't forget to create a README.md file to document your project\n")
  cat("A template for that README.md file can be found in the root\n")
  cat("directory of the project directory!\n")
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
