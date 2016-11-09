# File: t_read_spreadsheets

# Sources:
# - http://stackoverflow.com/questions/11433432/importing-multiple-csv-files-into-r
# - http://stackoverflow.com/questions/9564489/opening-all-files-in-a-folder-and-applying-a-function
# - http://stackoverflow.com/questions/12945687/how-to-read-all-worksheets-in-an-excel-workbook-into-an-r-list-with-data-frame-e
# - http://stackoverflow.com/questions/5595512/what-is-the-difference-between-require-and-library
# - http://stackoverflow.com/questions/4876813/using-r-to-list-all-files-with-a-specified-extension
# - http://stackoverflow.com/questions/15073753/regex-return-file-name-remove-path-and-file-extension


v_needed_packages <- c("openxlsx")
v_repository <- "http://cran.us.r-project.org"
v_type = "source"

for (v_package in v_needed_packages) {
  print(v_package)
  if(!require(package = v_package,
              character.only = TRUE,
              quietly = TRUE)) {
    cat(paste("Trying to install", v_package, "... \n"))
    install.packages(pkgs = v_package,
                     repos = v_repository,
                     dependencies = TRUE,
                     type = v_type)
    library(package = v_package, character.only = TRUE)
  }
}

v_file_path <- "H:/2016/Analysen/Neukunden/Input"
v_file_prefix <- "2016-"
v_file_suffix <- ".xlsx"
v_file_pattern <- "*.xlsx"

v_files <- list.files(path = v_file_path,
                      pattern = v_file_pattern,
                      ignore.case = TRUE)
print(v_files)

v_list_of_files <- list()

for (v_file in v_files) {
  v_list_of_files[v_file] <- openxlsx::read.xlsx(
    file.path(v_file_path,
              v_file))
}

