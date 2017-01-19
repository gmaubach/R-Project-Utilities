
# Create example dataset
var1 <- c(1, 2, 3)
var2 <- c(4, 5, 6)
data1 <- data.frame(var1, var2)

var3 <- c(7, 8, 9)
var4 <- c(10, 11, 12)
data2 <- data.frame(var3, var4)

save(file = "c:/temp/test.RData", list = c("data1", "data2"))

# Define function
t_load_dataset <- function(file_path,
                           file_name) {
  file_location <- file.path(file_path, file_name)
  
  print(paste0('Loading ', file_location, " ..."))
  cat("\n")
  
  object_list <- load(file = file_location,
                      envir = .GlobalEnv)
  
  print(paste0(
    length(object_list),
    " dataset(s) loaded from ",
    file_location,
    ":"
  ))
  print(object_list)
  cat("\n")
  
  # does not run
  for (i in object_list) {
    print(paste0("Object '", i, "' in '", file_name, "' contains:"))
    print(names(get(i, envir = .GlobalEnv)))
    cat("\n")
  }
}



