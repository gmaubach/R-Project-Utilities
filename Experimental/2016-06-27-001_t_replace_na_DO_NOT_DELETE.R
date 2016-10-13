

# old stuff
t_replace_na <- function(dataset, variable, value) {
 if(inherits(dataset[[variable]], "factor") == TRUE) {
   dataset[variable] <- as.character(dataset[variable])
   print(class(dataset[variable]))
   dataset[, variable][is.na(dataset[, variable])] <- value
   dataset[variable] <- as.factor(dataset[variable])
   print(class(dataset[variable]))
 } else {
   dataset[, variable][is.na(dataset[, variable])] <- value
 }
 return(dataset)
}

ds_test <- data.frame(a=c(1,NA,2), b = rep(NA,3), c = c("A","b",NA))
print(sapply(ds_test, class))

t_replace_na(ds_test, "a", value = -1)
t_replace_na(ds_test, "b", value = -2)
t_replace_na(ds_test, "c", value = -3)

# version by Petr Pikal

ds_test <- data.frame(a=c(1,NA,2), b = rep(NA,3), c = c("A","b",NA))
print(sapply(ds_test, class))

t_replace_na <- function(dataset, variables, value) {
  # Credits: https://www.mail-archive.com/r-help@r-project.org/msg236537.html
  for (variable in variables) {
    if(inherits(dataset[,variable], "factor") == TRUE) {
    dataset[,variable] <- as.character(dataset[,variable])
    print(class(dataset[,variable]))
    dataset[, variable][is.na(dataset[, variable])] <- value
    dataset[, variable] <- as.factor(dataset[, variable])
    print(class(dataset[, variable]))
  } else {
    dataset[, variable][is.na(dataset[, variable])] <- value
  }
  }
  return(dataset)
}

t_replace_na(ds_test, "a", value = -1)
t_replace_na(ds_test, "b", value = -2)
t_replace_na(ds_test, "c", value = -3)

t_replace_na(ds_test, c("b","c"), value = -99)
