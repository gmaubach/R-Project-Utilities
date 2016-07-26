#-------------------------------------------------------------------------------
# Module        : t_adjust_packages.R
# Author        : Georg Maubach
# Date          : 2016-07-21
# Update        : 2016-07-26
# Description   : Adjust installed packages according to a given list
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-07-26"
t_module_name = "t_adjust_packages.R"
t_status = "released"

cat(
  paste0("\n",
         t_module_name, " (Version: ", t_version, ", Status: ", t_status, ")", "\n", "\n",
         "Copyright (C) Georg Maubach 2016
         
         This software comes with ABSOLUTELY NO WARRANTY.", "\n", "\n"))

# If do_test is not defined globally define it here locally by un-commenting it
t_do_test <- FALSE

# [ Function Defintion ]--------------------------------------------------------
t_adjust_packages <- function(package_list,
                              what_to_do = "upgrade",
                              type = "source") {
  #-----------------------------------------------------------------------------
  # Adjust installed packages according to a given list
  #
  # Args:
  #   package_list (file name):
  #     Name of a file in csv format containing a list of package names
  #     with no header. Package names must be the same as needed for
  #     install.packages.
  #   what_to_do (string):
  #     Can take one of three values:
  #      "upgrade":   install packages that are named in the list of package
  #                   names but not installed currently
  #      "downgrade": un-install packages that are NOT named in the list of
  #                   packages
  #      "adjust"   : install packages that are named in the list of package
  #                   names but not installed currently AND un-install packages
  #                   that are NOT named in the list of packages
  #   from_source (string):
  #     Type of installation according to install.packages().
  #
  # Operation:
  #   The function reads in a list of packages and creates a list of already
  #   installed packages. If compared both and creates a vector for upgrading
  #   and downgrading.
  #   According to the desired operation in "what_to_do" the package
  #   installation is extended (upgrade), reduced (downgrade) or adjusted.
  #   If packages are installed dependencies are obeyed. If packages are removed
  #   dependencies are disregarded, i. e. depending packages are not removed.
  #   The dependencies concerning the operating system are not obeyed. The
  #   function reports the warning messages of install.packages(). Packages not
  #   available for a specific platform are therefore not installed.
  #   If packages shall be removed base packages are always kept.
  #   The list of installed packages is saved in the current working directory
  #   with file name "installed_packages_backup.csv".
  #
  # Returns:
  #   Nothing.
  #
  # Error handling:
  #   None.
  #-----------------------------------------------------------------------------
  
  # Read installed packages
  packages <- installed.packages()
  packages <- as.character(packages[, 1])
  # Write list of installed packages to disk
  message <- paste0("A backup of the list of currently installed packages ",
                    "is written to the current working dirctory.\n",
                    "The file name is 'installed_packages_backup.csv")
  warning(message)
  write.csv(x = packages,
            file = "installed_packages_backup.csv",
            col.names = FALSE,
            row.names = FALSE)
  ds_avail <- data.frame(packages, stringsAsFactors = FALSE)
  ds_avail$available <- TRUE
  
  # Read needed packages from list
  # List is a simple csv file with one column containing the package names
  # as needed by install.packages without version number or file extensions.
  # The file has no header.
  packages <-
    read.csv(file = package_list,
             header = FALSE)
  names(packages)[1] <- "packages"
  ds_needed <- packages
  ds_needed$needed <- TRUE
  
  # Compare installed and needed packages
  ds_package_comparison <- merge(x = ds_avail,
                                 y = ds_needed,
                                 by = "packages",
                                 all = TRUE)
  
  # Mark base packages as needed although they might not exist in the list of
  # needed packages
  base_packages <- sessionInfo()$basePkgs
  base_packages <- c(base_packages, "tools")
  
  #ds_package_comparison$needed[ds_package_comparison$packages %in% base_packages] <- TRUE
  ds_package_comparison[["needed"]][ds_package_comparison[["packages"]] %in% base_packages] <-
    TRUE
  
  # Replace NA with FALSE
  ds_package_comparison$available <-
    ifelse(is.na(ds_package_comparison$available),
           FALSE,
           ds_package_comparison$available)
  ds_package_comparison$needed <-
    ifelse(is.na(ds_package_comparison$needed),
           FALSE,
           ds_package_comparison$needed)
  
  # Determine upgrade
  ds_package_comparison$upgrade <- NA
  ds_package_comparison$upgrade <- with(ds_package_comparison,
                                        ifelse(needed == TRUE & available == FALSE,
                                               TRUE,
                                               FALSE))
  
  # Determine downgrade
  ds_package_comparison$downgrade <- with(ds_package_comparison,
                                          ifelse(available == TRUE &
                                                   needed == FALSE,
                                                 TRUE,
                                                 FALSE))
  
  # Determine what needs to be installed
  to_install <-
    ds_package_comparison[["packages"]][ds_package_comparison[["upgrade"]] == TRUE]
  
  # Determine what needs to be deleted
  to_delete <-
    ds_package_comparison[["packages"]][ds_package_comparison[["downgrade"]] == TRUE]

  # Install packages
  if (what_to_do == "upgrade") {
    install.packages(pkgs = to_install,
                     dependencies = TRUE,
                     type = type)
  } 
  # Delete packages
  else if (what_to_do == "downgrade") {
    remove.packages(pkgs = to_delete)
  }
  # Adjust
  else if (what_to_do == "adjust") {
    install.packages(pkgs = to_install,
                     dependencies = TRUE,
                     type = type)
    remove.packages(pkgs = to_delete)
  }  # end if
}  # end function

# [ Test Defintion ]------------------------------------------------------------
t_test <- function(do_test = FALSE) {
  if (do_test == TRUE) {
    # Test: upgrade
    file_name <-  "https://raw.githubusercontent.com/gmaubach/R-Project-Utilities/master/miniCRAN_packages.txt"
    t_adjust_packages(package_list = file_name,
                      what_to_do = "upgrade",
                      type = "source")
    
    # Test: downgrade
    warning("Option 'downgrade' not tested.")
    
    # Test: adjust
    warning("Option 'adjust' not tested.")
    }  # end if
}  # end function

# [ Test Run ]------------------------------------------------------------------
t_test(do_test = t_do_test)

# [ Clean up ]------------------------------------------------------------------
rm("t_module_name", "t_version", "t_status", "t_do_test", "t_test")

# EOF .
