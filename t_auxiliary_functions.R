# Credits:
# - https://csgillespie.github.io/efficientR/set-up.html#r-startup
# - http://www.gettinggeneticsdone.com/2013/07/customize-rprofile.html
# - http://www.gettinggeneticsdone.com/2013/07/customize-rprofile.html

# Changes to default R behaviour
q <- function (save="no", ...) {
  quit(save=save, ...)}

# Create a hidden environment with "." notation
.t_aux = new.env()

# Abbreviations
## Single character shortcuts
.t_aux$s <- base::summary
.t_aux$h <- utils::head
#.t_aux$t <- utils::tail  # base::t = transpose matrix
.t_aux$v = utils::View

## ht == headtail
.t_aux$ht = function(d, ...)
{
  rbind(head(d, ...), tail(d, ...))
}

## Show the first 5 rows & first 5 columns of a data frame
.t_aux$hh = function(d) d[1:5, 1:5]

# Set nice plotting window
.t_aux$nice_par = function(
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

# Extensions
## Read data on clipboard.
.t_aux$read_cb <- function(...) {
  ismac <- Sys.info()[1] == "Darwin"
  if (!ismac) read.table(file = "clipboard", ...)
  else read.table(pipe("pbpaste"), ...)}

## Returns a logical vector TRUE for elements of X not in Y
.t_aux$"%nin%" <- function(x, y) !(x %in% y)

## Returns names(df) in single column, numbered matrix format.
.t_aux$dfn <- function(df) matrix(names(df))

## Strip row names from a data frame (stolen from plyr)
.t_aux$unrowname <- function(df) {
  rownames(df) <- NULL
  x }

## Unfactor
# This defines a function to sanely undo a “factor()” call.
# Credits: Dason Kurkiewicz
# (https://github.com/Dasonk/Dmisc/blob/master/R/unfactor.R)
.t_aux$unfactor <- function(df){
  id <- sapply(df, is.factor)
  df[id] <- lapply(df[id], as.character)
  df}

## List objects and classes
# Credits: @_inundata, ateucher
.t_aux$lsoc <- function()
{
    obj_type <- function(x)
    {
      class(get(x, envir = .GlobalEnv)) # define environment
    }
    foo = data.frame(sapply(ls(envir = .GlobalEnv), obj_type))
    foo$object_name = rownames(foo)
    names(foo)[1] = "class"
    names(foo)[2] = "object"
    return(unrowname(foo))
}

## List all functions in a package
# Credits: @_inundata
.t_aux$lsfp <- function(package, all.names = FALSE, pattern) {
    package <- deparse(substitute(package))
    ls(
      pos = paste("package", package, sep = ":"),
      all.names = all.names,
      pattern = pattern
    )
}

## Load packages silently (lps)
# Function that loads a libary into the namespace without
# any warning or startup messages clobbering my console.
.t_aux$lps <- function(package)
{
  suppressWarnings(
    suppressPackageStartupMessages(
      library(
        package,
        character.only = TRUE)))
}

# Miscellaneous
## Tab-complete package names for use in “library()” or
# “require()” calls.
# Credits: @mikelove (https://twitter.com/mikelove)
utils::rc.settings(ipck = TRUE)

## Colorized output on consoles
# (provided by the colorout package)
# on appropriate consoles
if (Sys.getenv("TERM") == "xterm-256color")
{
  library("colorout")
}

# Automatic loading
## Batch mode
auto.loads <- c("dplyr", "ggplot2")

## Interactive mode
# This loads the packages in my “auto.loads” vector
# if the R session is interactive.
if (interactive())
{
  invisible(sapply(auto.loads, .t_aux$lps))
}

# Bring hidden environment into the global environment
attach(.t_aux)

# EOF .

