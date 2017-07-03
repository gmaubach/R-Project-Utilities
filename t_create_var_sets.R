
cat("Calling t_create_var_sets.R\n")

t_create_var_sets <- function(
  dataset,
  var_base_length = 3
) {

  # %SOURCE%
  # http://stackoverflow.com/questions/9425194/what-is-the-most-efficient-way-to-select-a-set-of-variable-names-from-an-r-data

  # Create a list of variable base names, e. g. "v01" and
  # assign all corresponding items to the list name, e.g.
  # v01 = c("v01_01", "v01_02", "v01_01)
  #
  # Cutting of variable names is done based on variable base
  # name length, e. g. 3 for "v01".
  #
  # The list items can be used for dataset subsetting,
  # e. g. dateset[var_batteries$v01].

  sapply(
    unique(substring(names(dataset), 1, var_base_length)),
    function(x){
      dput(
        grep(
          paste0("^", x),
          names(dataset),
          value = TRUE),
        file = tempfile())  # workaround no output to console
    })
}

