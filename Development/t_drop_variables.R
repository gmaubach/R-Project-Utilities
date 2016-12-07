t_drop_variables <- function(dataset, variable_list)
# Credits: Vincent, http://stackoverflow.com/questions/4605206/drop-data-frame-columns-by-name
{
  return(dataset[, variable_list]) <- list(NULL)
}

