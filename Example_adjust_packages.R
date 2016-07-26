source(file = "C:/Users/Georg Maubach/Downloads/t_adjust_packages.R")

package_list <- file.path("C:/Users/Georg Maubach/Downloads/",
                          "miniCRAN_packages.txt")

t_adjust_packages(package_list = package_list, what_to_do = "upgrade", type = "source")
