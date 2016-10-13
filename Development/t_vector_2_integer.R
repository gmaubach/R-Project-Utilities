

ds_example <-
  structure(
    list(
      year2013 = c(0, 0, 0, 1, 1, 1, 1, 0),
      year2014 = c(0,
                   0, 1, 1, 0, 0, 1, 1),
      year2015 = c(0, 1, 1, 1, 0, 1, 0, 0)
    ),
    .Names = c("year2013",
               "year2014", "year2015"),
    row.names = c(NA, 8L),
    class = "data.frame"
  )

attach(ds_example)
base <- 1000
binary_vector <- base + year2013 * 100 + year2014 * 10 + year2015
detach(ds_example)

binary_vector

ds_example <- cbind(ds_example, binary_vector)

varlist <- c("year2013", "year2014", "year2015")

base <- 10^length(varlist)

binary_vector <- NULL

for (i in 1:3) {
  binary_vector <- 
   base + 
   ds_example [[varlist[i]]] * base / (10 ^ i)
}

ds_example <- cbind(ds_example, binary_vector)

message("Wrong result!")
ds_example







