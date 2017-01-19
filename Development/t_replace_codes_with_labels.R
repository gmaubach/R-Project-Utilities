t_label_values <- function
(
  variable,
  values,
  labels,
  delimiter = ": "
)

{
  stopifnot(identical(length(values), length(labels)))

  values_and_labels <- list()
  for (i in length(values))
  {
   values_and_labels[[values[i]]] <-
      paste0(
        values[i],
        delimiter,
        labels[i])
  }
  print(values_and_labels)

  for (i in length(values))
  {
    mapping <- list(
      values[[i]] = values_and_labels[[i]])
  }

  return(mapping)
}

t_replace_codes_with_labels <- function(dataset,
                                        variables,
                                        codes,
                                        labels) {

  stopifnot(identical(length(codes), length(labels)))

  mapping <- list()
  for(i in length(codes)) {
  mapping[[codes[i]]] <- paste0(codes[i], ": ", labels[i])
  print(mapping)
  }

  for(variable in variables) {
    dataset[ , variable] <- as.factor((mapping[dataset[ , variable]])
  }

  return(dataset)
}

variable <- c(1, 2, 5, 3, 4, 5, 1, 3, 1, 4)
d_temp <- data.frame(variable)

values = c(1, 2, 3, 4, 5)
labels <- list("1" = "Strongly Agree",
               "2" = "Agree",
               "3" = "Neither agree/nor disagree",
               "4" = "Disagree",
               "5" = "Strongly Disagree")

mapping = list(
  "1" = "1: Strongly agree",
  "2" = "2: Agree",
  "3" = "3: Neither agree/nor disgree",
  "4" = "4: Disagree",
  "5" = "5: Strongly disagree")

d_data <- data.frame()
d_data$var1 <- mapping[as.character(d_temp$variable)]


