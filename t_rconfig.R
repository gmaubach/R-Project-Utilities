# R Configuration
# References:
# - http://www.statmethods.net/interface/customizing.html
# - http://www.gettinggeneticsdone.com/2013/07/customize-rprofile.html
# - https://www.r-bloggers.com/fun-with-rprofile-and-customizing-r-startup/

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
  width = 60,
  digits = 2,
  # switch off scientific notation
  scipen = 999,
  # rows of datasets
  max.print = 100,
  verbose = FALSE,
  warnPartialMatchArgs = TRUE,
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  # Automatically convert strings to factor variables
  stringsAsFactors = FALSE,
  # Eradict '+' from multi-line functions output
  continue = "  ",
  # Show or do not show those silly significanct stars
  show.signif.stars = TRUE,
  papersize="a4"
  )

# tibble Options
options(tibble.print_min = 10, tibble.print_max = 50)

# Reproducible Research
set.seed(123456789)

# First
## History file time stamp
# These lines instruct R to, before anything else,
# echo a timestamp to the console and to my R history file.
# The timestamp greatly improves my ability to search
# through my history for relevant commands.
.First <- function(){
  if (interactive()) {
    library(utils)
    timestamp(,
              prefix = paste(
                "##------ [",
                getwd(),
                "] ",
                sep = ""))}}

# Last
## Save history file
# These lines instruct R, right before exiting, to write all
# commands I used in that session to my R command history
# file. I usually have this set in an environment variable
# called “R_HISTFILE” on most of my systems, but in case I
# don’t have this defined, I write it to a file in my home
# directory called .Rhistory.
.Last <- function()
{
  if (interactive())
  {
    hist_file <- Sys.getenv("R_HISTFILE")
    if (hist_file == "")
    {
      hist_file <- "~/.RHistory"
    }
    savehistory(hist_file)
  }
}
