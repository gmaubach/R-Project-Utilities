
t_merge_variables <- function(dataset, source_var1, source_var2, target_var) {
  mismatch = NA
  ifelse(source_var1 == source_var2, target_var = source_var1, mismatch = 1)
  return(data.frame(source_var1, source_var2, target_var, mismatch))
}

t_merge_variables <- function(dataset, source_var1, source_var2, target_var) {
  mismatch = NA
  if(source_var1 == source_var2) {
    target_var = source_var1
  } else {
    mismatch = 1
  }
  return(data.frame(source_var1, source_var2, target_var, mismatch))
}

t_merge_variables <- function(dataset, source_var1, source_var2, target_var) {
  mismatch = rep(NA, nrow(dataset))
  for(i in 1:nrow(dataset)) {
    # var1 filled, var2 missing
    if(!is.na(dataset[[i, source_var1]]) & is.na(dataset[i, source_var2])) {
      dataset[[i, target_var]] <- dataset(i, source_var1)
      mismatch <- 0
      # var1 missing, var2 filled
    } else if(is.na(dataset[[i, source_var1]]) & !is.na(dataset[i, source_var2])) {
      dataset[[i, target_var]] <- dataset(i, source_var1)
      mismatch <- 0
      # var1 == var2
    } else if(dataset[[i, source_var1]] == dataset[[i, source_var2]]) {
      dataset[[i, target_var]] <- dataset[[i, source_var1]]
      mismatch <- 0
      # var1 != var2
    } else {
      dataset[[i, target_var]] <- NA
      mismatch <- 1
    }
  }
  # return(data.frame(source_var1, source_var2, target_var, mismatch))
}

t_merge_variables <- function(dataset, source_var1, source_var2, target_var) {
  mismatch <- ifelse(source_var1 == source_var2, TRUE, FALSE)
  table(source_var1)
  #, source_var2, target_var, mismatch)
}

ds_var_merge1 <- t_merge_variables(dataset = ds_merge1,
  source_var1 = "Auftraggeber.x",
  source_var2 = "Auftraggeber.y",
  target_var = "Auftraggeber")

