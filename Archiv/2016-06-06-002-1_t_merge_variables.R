
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

    # Check 1: var1 missing, var2 missing
    dataset[[merged_var]] <-
      # var1 missing, var2 missing
      ifelse(is.na(dataset[[ , var1]]) & is.na(dataset[[ , var2]]), 
        # then
        dataset[[merged_var]] <- 0,
        # else: var1 filled, var2 missing
        ifelse(!is.na(dataset[[, var1]]) & is.na(dataset[[, var2]]),
          # then
          dataset[[merged_var]] <- dataset[[, var1]],
          # else: var1 missing, var2 filled
          ifelse(is.na(dataset[[ , var1]]) & !is.na(dataset[[, var2]]),
            # then
            dataset[[merged_var]] <- dataset[[ , var2]],
            # else: var1 == var2
            ifelse(dataset[[, var1]] == dataset[[, var2]],
              # then: use var1
              dataset[[merged_var]] <- dataset[[, var1]],
              #else: var1 != var2
              dataset[[merged_var]] <- 1))))
      
    return(dataset)
}

ds_var_merge1 <- t_merge_variables(dataset = ds_test,
  var1 = "customer.x",
  var2 = "customer.y",
  merged_var = "customer")

ds_var_merge1



