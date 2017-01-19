# Loading data using RCurl
# Source: Gandrud, Christopher: Reproducible Research with
# R and RStudio, 2015, p. 121

library("RCurl")

# Put URL address into an object
UrlAddress <- paste0("https:// ...",
                     "path",
                     "file")

# Download data
DataUrl <- RCurl::getURL(UrlAddress)
# Use verifypeer = FALSE to skip certification verification
# if there is a SSL certificate problem.

# Convert data into a data frame
dataset <- read.table(textConnection(DataUrl),
                      sep = ",",
                      header = TRUE)

# EOF .
