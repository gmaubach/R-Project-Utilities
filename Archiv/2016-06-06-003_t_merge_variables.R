
customer.x <- c("Miller", "Smith", NA,    "Bird", NA)
customer.y <- c("Miller",  NA,     "Doe", "Fish", NA)
ds_test <- data.frame(customer.x, customer.y, stringsAsFactors = FALSE)

t_merge_variables <-
  function(dataset,
           var1,
           var2,
           merged_var) {
    
    get_identity <- (dataset[[, var1]] %in% dataset[[, var2]]) + 
      (dataset[[, var2]] %in% dataset[[, var1]])
    get_missing <- (is.na(dataset[[, var1]]) + 2 * (dataset[[, var2]]))
    dataset[[merged_var]] <- ifelse()
    return(dataset)
}

ds_var_merge1 <- t_merge_variables(dataset = ds_test,
  var1 = "customer.x",
  var2 = "customer.y",
  merged_var = "customer")

ds_var_merge1



