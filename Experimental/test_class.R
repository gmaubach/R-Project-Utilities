test_class <- function(dataset, variable) {
  if(inherits(dataset[[variable]], "factor") == TRUE) {
    return(c(class(dataset[variable]), TRUE))
  } else {
    return(c(class(dataset[variable]), FALSE))
  }
}

ds_test <- data.frame(a=c(1,NA,2), b = rep(NA,3), c = c("A","b",NA))
print(sapply(ds_test, class))

# -- Test a --
class(ds_test[, "a"])
if(inherits(ds_test[, "a"], "factor")) {
  print(c(class(ds_test[, "a"]), "TRUE"))
} else {
  print(c(class(ds_test[, "a"]), "FALSE"))
}
test_class(ds_test, "a")
warning("'a' should be numeric NOT data.frame!")

# -- Test b --
if(inherits(ds_test[["b"]], "factor")) {
  print(c(class(ds_test[, "b"]), "TRUE"))
} else {
  print(c(class(ds_test[, "b"]), "FALSE"))
}
class(ds_test[, "b"])
test_class(ds_test, "b")
warning("'b' should be logical NOT data.frame!")

# -- Test c --
if(inherits(ds_test[, "c"], "factor")) {
  print(c(class(ds_test[, "c"]), "TRUE"))
} else {
  print(c(class(ds_test[, "c"]), "FALSE"))
}
class(ds_test[, "c"])
test_class(ds_test, "c")
warning("'c' should be factor NOT data.frame.
In addition data.frame != factor")


