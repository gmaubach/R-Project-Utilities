t_plot_dataset <- function(dataset,
                         max_num_values  = 15,
                         max_char_values = 15) {

  number_of_variables = length(dataset)

  for (i in 1:number_of_variables) {
    if(inherits(dataset[ , i], what = "factor")   |
       inherits(dataset[ , i], what = "ordered")  |
       inherits(dataset[ , i], what = "integer")) {
         if (length(levels((factor(dataset[ , i])))) <= max_num_values) {
           barplot(height = table(dataset[ , i]),
                   beside = TRUE,
                   xlab = names(dataset)[i],
                   main = names(dataset)[i])
          } else {
            plot(x = dataset[ , i],
                 xlab = names(dataset)[i],
                 main = names(dataset)[i])
           }
      } else if(inherits(dataset[ , i], what = "numeric")) {
        if(length(levels(factor(dataset[ , i]))) <= max_num_values) {
          barplot(height = table(dataset[ , i]),
                  beside = TRUE,
                  xlab = names(dataset)[i],
                  main = names(dataset)[i])
        } else {
          plot(x = dataset[ , i],
               xlab = names(dataset)[i],
               main = names(dataset)[i])
        }
      } else if(inherits(x = dataset[ , i], what = "character")) {
          if(length(levels(factor(dataset[ , i]))) <= max_char_values) {
             barplot(height = table(factor(dataset[ , i])),
                     main = names(dataset)[i])
           } else {
             warning(paste0("Number of values exceeds given ",
                            "limit in max_char_values.\n",
                            "No plot printed for variable ",
                            names(dataset)[i],
                            ".\n"))
           }
      } else if(inherits(x = dataset[ , i], what = "logical")) {
        barplot(height = factor(dataset[ , i]),
                main = names(dataset)[i])
      } else {
        warning(paste0("No plot printed for variable ",
                       names(dataset)[i]),
                       ".\n")
      }
  }
}



