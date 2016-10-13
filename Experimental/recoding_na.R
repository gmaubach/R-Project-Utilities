

var1 <- c(1:3, NA, 5:7, NA, 9:10)
var2 <- c(1:3, NA, 5:7, NA, 9:10)
ds_test <-
  data.frame(var1, var2)

test <- var1
test[is.na(test)] <- 0
test  # NA recoded OK

# First try
ds_test[is.na(ds_test$var1)] <- 0  # duplicate subscripts WRONG

# Second try
ds_test[is.na("var1")] <- 0  
ds_test$var1  # not recoded WRONG

# Third try: to me the most intuitive approach
is.na(ds_test["var1"]) <- 0  # attempt to select less than one element in integerOneIndex WRONG

# Fourth try
ds_test[is.na(var1)] <- 0  # duplicate subscripts for columns WRONG



