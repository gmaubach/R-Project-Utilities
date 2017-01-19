# Snippet: Loading datasets
# Credits: Chapman, Chris: R for Marketing Research and Analytics,
#          Heidelberg: Springer, 2015, p. 59
#          (3.3.3 Recommended approach to inspecting data)

cat('Load --------------------------------------------------------------------')
v_file_name <- "dataset.XLSX"
v_file_path <- v_path_import
v_file_location <- file.path(v_file_path, v_file_name)

cat(paste0('Loading ', v_file_location))
dataset <- openxlsx::read.xlsx(xlsxFile = v_file_location)
cat("Done.")
cat(paste("A total of ", nrow(dataset), " cases in ", ncol(dataset), " variables loaded."))

cat('Make proper variable names ----------------------------------------------')
names(dataset)[names(kino == "old variable name"] <- "new variable name"
print(names(x = dataset))
cat('Done.')

cat('Data Checks -------------------------------------------------------------')
cat('Check if superfluous header lines were loaded')
head(dataset)

cat('Check if additional blank lines at the end were loaded')
tail(dataset)  

cat('Check a set of randomly selected rows')
car::some(dataset)

cat('First glance of the data')
summary(dataset)

cat('Data Overview')
Hmisc::describe(dataset)

cat('Done.')

# EOF .
