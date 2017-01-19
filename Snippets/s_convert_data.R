# Snippet: Convert date

cat("# Convert 'Anlagedatum' and fix type conversion -----------------------\n")
## see http://r.789695.n4.nabble.com/Convert-number-to-Date-td1691251.html
## as.Date() operates also with numeric instead of character
ds_merge1["Anlagedatum"] <- as.Date(ds_merge1[["Anlagedatum"]],
                                    origin = "1899-12-30")
head(ds_merge1["Anlagedatum"])

