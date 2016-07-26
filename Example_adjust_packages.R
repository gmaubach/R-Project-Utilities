source(file = "C:/Users/Georg Maubach/Downloads/t_adjust_packages.R")

package_list <- file.path("C:/Users/Georg Maubach/Downloads/",
                          "miniCRAN_packages.txt")

# Determine which mirror to use before running this script:
# https://cran.r-project.org/mirrors.html

t_adjust_packages(package_list = package_list,
                  what_to_do = "upgrade",
                  type = "source",
                  path_backup = "C:/temp"
                  mirror = "http://cran.uni-muenster.de/")

# Run it with, e. g.
# C:\Program Files\R\R-3.2.5\bin>R < "C:\Users\Georg Maubach\Downloads\Example_adjust_packages.R" --no-save
