f_add_table_2_result_df <- function
(
  group,  # (string), e. g. Population, Interviewee
  variable_name,  # analysed variable
  codes = "none",  # value encoding
  values, # value vector
  labels, # label vector for given values in same order
  # as values, e.g. names(values)
  measure,  # analysis result value, e. g. n, freq, etc.
  unit  # n = number, % = percent
)
{
  stopifnot(length(values) == length(labels))

  if (length(codes) == 1)
  {
    if (inherits(codes, "character") &
        codes == "none")
    {
      codes <- rep(codes, length(values))
    } else
    {
      # leave codes as is
    }
  }

  d_result <- data.frame(
    group = rep(group, length(values)),
    variable = rep(variable_name, length(values)),
    code = codes,
    value = values,
    label = labels,
    measure = rep(measure, length(values)),
    unit = rep(unit, length(values)),
    stringsAsFactors = FALSE)

  invisible(d_result)
}
