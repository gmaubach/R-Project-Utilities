#-----------------------------------------------------------------------
# Module        : t_setup_project.R
# Author        : Georg Maubach
# Date          : 2016-10-19
# Update        : 2017-02-13
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
  c_path_relative <- list()
  c_path_relative$project <- "C:/temp/MyProject"  # default before user input
  c_path_relative$project <- svDialogs::dlgDir()$res

  # Define names for sub directories
  data          <- "data"             # data to be loaded into or
                                      # saved from R
  documentation <- "documentation"    # explanatory material for results
                                      # (e. g. knitR documents)
  fundamentals  <- "fundamentals"     # background knowledge
  input         <- "data/20_input"    # input data eventually manually
                                      # revised for import
  master        <- "data/90_master"   # master data (e. g. lookup tables)
  output        <- "data/30_output"   # RData files
  export        <- "data/40_export"   # Data files to external programs
  raw           <- "data/10_raw"      # a copy of all input data never
                                      # touched for safety reasons and
                                      # not read by R
  program       <- "program"          # all scripts and runnable files
  gather     <- "program/10_gather"   # scripts to gather data
  import     <- "program/20_import"   # scripts for data import
  clean      <- "program/30_clean"    # scripts for data cleaning
  prepare    <- "program/40_prepare"  # scripts for data prep
  merge      <- "program/50_merge"    # scripts for data merging
  analyse    <- "program/60_analyse"  # scripts for data analysis
  present    <- "program/70_present"  # scripts for data presentation
  modules    <- "program/90_modules"  # project specific packages, files
                                      # or functions in separate files as
                                      # well as all other sub routines to
                                      # be sourced or loaded
  results       <- "results"          # container for all resulting data
                                      # in an aggregated form
  plots      <- "results/plots"
  paper         <- "results/paper"
  slides        <- "results/slides"   # slideshows = presentations
  tables        <- "results/tables"
  web           <- "results/web"      # web site pages
  temp          <- "temp"
  templates     <- "templates"

  c_project_dir <- c_path_relative$project

  c_path_relative <- list(
    project       = c_project_dir,
    documentation = documentation,
    fundamentals  = fundamentals,
    data          = data,
    input         = input,
    master        = master,
    output        = output,
    export        = export,
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
    plots         = plots,
    paper         = paper,
    slides        = slides,
    tables        = tables,
    web           = web,
    temp          = temp,
    templates     = templates
  )

  c_path_full     <- list(
    project       = c_project_dir,
    documentation = file.path(c_project_dir, documentation),
    fundamentals  = file.path(c_project_dir, fundamentals),
    data          = file.path(c_project_dir, data),
    input         = file.path(c_project_dir, input),
    master        = file.path(c_project_dir, master),
    output        = file.path(c_project_dir, output),
    export        = file.path(c_project_dir, export),
    raw           = file.path(c_project_dir, raw),
    program       = file.path(c_project_dir, program),
    gather        = file.path(c_project_dir, gather),
    import        = file.path(c_project_dir, import),
    clean         = file.path(c_project_dir, clean),
    prepare       = file.path(c_project_dir, prepare),
    merge         = file.path(c_project_dir, merge),
    analyse       = file.path(c_project_dir, analyse),
    present       = file.path(c_project_dir, present),
    modules       = file.path(c_project_dir, modules),
    results       = file.path(c_project_dir, results),
    plots         = file.path(c_project_dir, plots),
    tables        = file.path(c_project_dir, tables),
    paper         = file.path(c_project_dir, paper),
    slides        = file.path(c_project_dir, slides),
    web           = file.path(c_project_dir, web),
    temp          = file.path(c_project_dir, temp),
    templates     = file.path(c_project_dir, templates)
    )

  # Create sub directories if they are not there
  cat("-------------------------------------------------------------\n")
  cat("Creating directories ...\n")
  for (entry in c_path_full) {
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
  # The project config file contains 2 lists:
  # 1. c_path_full
  # 2. c_path_relative
  # Each list contains the path names for each directory of the project.
  cat("-------------------------------------------------------------\n")
  cat("Saving project config file ...\n")
  v_file_config <- file.path(c_path_full$program,
                             "project_config.RData")
  save(list = c("c_path_full", "c_path_relative"),
       file = v_file_config
  )
  cat("File ", v_file_config, " created!\n")
  cat("... Done! (Saving path names)\n")
  cat("-------------------------------------------------------------\n")

rm("c_project_dir")

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

