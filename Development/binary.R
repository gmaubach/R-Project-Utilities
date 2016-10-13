
# Crawley: The R Book
# http://stackoverflow.com/questions/12088080/how-to-convert-number-into-binary-vector

# Convert an integer to a binary
binary <- function(x) {
  i <- 0
  string <- numeric(32)
  while(x > 0) {
    string[32 - i] <- x %% 2
    x <- x %/% 2
    i <- i + 1 
  }
  first <- match(1, string)
  string[first:32] 
}
