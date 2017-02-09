# Repositories
# `local` creates a new, empty environment
# This avoids polluting .GlobalEnv with the object r
local({
  r = getOption("repos")
  r["CRAN"] = "https://cran.rstudio.com/"
  r["CRANextra"] <- "http://www.stats.ox.ac.uk/pub/RWin"
  r["CRAN_de"] <- "https://cran.uni-muenster.de/"
  options(repos = r)
})

# R configuration
options(
  prompt = "R> ",
  digits = 2,
  # switch off scientific notation
  scipen = 999,
  # rows of datasets
  max.print = 100,
  verbose = FALSE,
  warnPartialMatchArgs = TRUE,
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  stringsAsFactors = FALSE,
  # eradict '+' from multi-line functions output
  continue = "  ",
  show.signif.stars = FALSE)

