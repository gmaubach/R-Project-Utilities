#-------------------------------------------------------------------------------
# Module        : t_setup_minicran.R
# Author        : Georg Maubach
# Date          : 2016-06-01
# Update        : 2016-06-01
# Description   : Setup MiniCRAN
# Source System : R 3.3.0 (64 Bit)
# Target System : R 3.3.0 (64 Bit)
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#--------1---------2---------3---------4---------5---------6---------7---------8

t_version = "2016-06-01"
t_module_name = "t_setup_minicran.R"

print("Installed packages")
installed.packages()[, 1]

available.packages()

# Desired packages
my_packages <- read.table(file.path("C:", "data", 2016","Software","R-Project",
                                    "2016-06-01_miniCRAN_package_list.csv")
  
# Install
## EITHER: Install from CRAN
## install.packages(pkgs = my_packages, dependencies = TRUE)

## OR: Build local CRAN repository
### EITHER: Install miniCRAN from CRAN
install.packages(pkgs = "miniCRAN", dependencies = TRUE)
### OR: Install miniCRAN from localhost
# install.packages(pkgs = "C:/Software/R-Project/CRAN/bin/windows/contrib/3.2/xml2_0.1.2.zip",
#                  dependencies = TRUE,
#                  repos = NULL)
# install.packages(pkgs = "C:/Software/R-Project/CRAN/bin/windows/contrib/3.2/miniCRAN_0.2.5.zip",
#                  dependencies = TRUE,
#                  repos = NULL)

library(miniCRAN)

### Determine the dependencies for desired packages
pkg_list <- pkgDep(pkg = my_packages, suggest = TRUE)

### Define a path to local repository
repo <- file.path("C:", "data", 2016","Software","R-Project", "gmaCRAN")

# Create repository
# Internet connection required
# If no internet connection available download at machine with internet
# connection and transfer the downloaded repository manually to the target
# machine.
makeRepos(pkgs = pkg_list, path = repo, type = "source")     # for Linux
# makeRepos(pkgs = pkg_list, path = repo, type = "win.binary") # for Windows

repo_path = paste0("file:", repo)

install.packages(pkgs = pkg_list,
                 dependencies = TRUE,
                 repos = repo_path)

# Install packages bases on themes
# see (*6) p. 26
install.packages("ctv")
library(ctv)
install.views("SocialSciences")

# update.packages(ask = FALSE)     # Update (if necessary)

# vignette(all = TRUE)             # Show vignettes of all installed packages

