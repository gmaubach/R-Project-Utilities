# Loading data from secure URLs using source_data and
# checking SHA-1 hash
# Source: Gandrud, Christopher: Reproducible Research with
# R and RStudio, 2015, p. 119

library(repmis)

dataset <- repmis::source_data(UrlAddress,
                               sha1 = "hash value")

# EOF .

