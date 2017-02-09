# Credits: https://csgillespie.github.io/efficientR/set-up.html#r-startup

# Create a hidden environment with "." notation
.aux_func = new.env()

# ht == headtail
.aux_func$ht = function(d, ...)
{
  rbind(head(d, ...), tail(d, ...))
}

# Show the first 5 rows & first 5 columns of a data frame
.aux_func$hh = function(d) d[1:5, 1:5]

# Set nice plotting window
.aux_func$nice_par = function(
  mar = c(3, 3, 2, 1),
  mgp = c(2, 0.4, 0),
  tck = -0.01,
  cex.axis = 0.9,
  las = 1,
  mfrow = c(1, 1),
  ...) {
  par(mar = mar, mgp = mgp, tck = tck,
      cex.axis = cex.axis, las = las,
      mfrow = mfrow, ...)}

# Abbreviate View()
.aux_func$v = utils::View

# Bring hidden environment into the global environment
attach(.aux_func)

# EOF .

