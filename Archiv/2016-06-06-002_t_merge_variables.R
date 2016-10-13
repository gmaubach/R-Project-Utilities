
customer.x <- c("Miller", "Smith", NA,    "Bird", NA)
customer.y <- c("Miller",  NA,     "Doe", "Fish", NA)
ds_test <- data.frame(customer.x, customer.y, stringsAsFactors = FALSE)

t_merge_variables <-
  function(dataset,
           var1,
           var2,
           merged_var) {
    
    # Initialize
    dataset[[merged_var]] = rep(NA, nrow(dataset))
    dataset[["mismatch"]] = rep(NA, nrow(dataset))
    
    for (i in 1:nrow(dataset)) {
      
      # Check 1: var1 missing, var2 missing
      if (is.na(dataset[[i, var1]]) &
          is.na(dataset[[i, var2]])) {
        dataset[["mismatch"]] <- 1  # var1 & var2 are missing
      
      # Check 2: var1 filled, var2 missing
      } else if (!is.na(dataset[[i, var1]]) &
                 is.na(dataset[[i, var2]])) {
        dataset[[i, merged_var]] <- dataset[[i, var1]]
        dataset[["mismatch"]] <- 0
      
      # Check 3: var1 missing, var2 filled
      } else if (is.na(dataset[[i, var1]]) &
                 !is.na(dataset[i, var2])) {
        dataset[[i, merged_var]] <- dataset[[i, var2]]
        dataset[["mismatch"]] <-  0
        
      # Check 4: var1 == var2
      } else if (dataset[[i, var1]] == dataset[[i, var2]]) {
      dataset[[i, merged_var]] <- dataset[[i, var1]]
      dataset[["mismatch"]] <- 0

      # Leftover: var1 != var2
      } else {
        dataset[[i, merged_var]] <- NA
        dataset[["mismatch"]] <- 2  # var1 != var2
      }  # end if
    }  # end for
    return(dataset)
}

ds_var_merge1 <- t_merge_variables(dataset = ds_test,
  var1 = "customer.x",
  var2 = "customer.y",
  merged_var = "customer")

ds_var_merge1



