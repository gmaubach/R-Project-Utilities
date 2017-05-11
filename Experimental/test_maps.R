
val_labs <- list(
  "1" = "1 = sehr gut",
  "2" = "2",
  "3" = "3",
  "4" = "4",
  "5" = "5",
  "6" = "6 = sehr schlecht"
)

set.seed(12345)
answers = c(sample(1:5, 10, replace = TRUE))

test <- factor(unlist(var_labs[answers]))

# ---

val_labs <- c(
  "1 = sehr gut",
  "2",
  "3",
  "4",
  "5",
  "6 = sehr schlecht"
)

test <- val_labs[answers]
