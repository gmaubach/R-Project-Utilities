t_duplicates <- function(dataset)
# Calculates the duplicates of each variable as well as
# in variable combinations.
{
  # for each variable
  v_total <- nrow(d_temp1)
  v_unique <- length(unique(c(d_temp1$Debitor,
                              d_temp1$Verkaufsorganisation)))
  v_duplicates <- v_total - v_unique
  print(paste("total: ", v_total,
              "|",
              "Unique: ", v_unique,
              "|",
              "Duplicates: ", v_duplicates))

  # Variable combinations
  # if v1, v2, v3 and v7 have each duplicates
  # pairwise
  # v1 x v2
  # v1 x v3
  # v1 x v7
  # v2 x v3
  # v2 x v7

  # triples
  # v1 x v2 x v3
  # v1 x v2 x v7

  # 4th combinations and so forth

  # Output shall be a dataset with the following columns
  # duplicates level1 level2 level3 level4 ...
  # 5          var1
  # 0          var2
  # 7          var3
  # 3          var1   var2
}
