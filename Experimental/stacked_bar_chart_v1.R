
library(forcats)

d_result$variable <- stringr::str_replace(d_result$variable, "Sortiment", "Item 1")
d_result$variable <- stringr::str_replace(d_result$variable, "Qualität", "Item 2")
d_result$variable <- stringr::str_replace(d_result$variable, "Konditionen", "Item 3")
d_result$variable <- stringr::str_replace(d_result$variable, "Marke", "Item 4")
d_result$variable <- stringr::str_replace(d_result$variable, "Innovation", "Item 5")
d_result$variable <- stringr::str_replace(d_result$variable, "Service", "Item 6")
d_result$variable <- stringr::str_replace(d_result$variable, "Angebote/Aktionen", "Item 7")
d_result$variable <- stringr::str_replace(d_result$variable, "Design/Trends", "Item 8")

d_result$value <- forcats::fct_recode(
  d_result$value,
   "1 = very satisfied" = "1 = Sehr zufrieden",
  "6 = very dissatified" = "6 = Sehr unzufrieden")

dput(d_result)

# -- cut --

d_result <- structure(list("variable" = c("Item 1 (ø = 3.3) ", "Item 1 (ø = 3.3) ",
                                        "Item 1 (ø = 3.3) ", "Item 1 (ø = 3.3) ", "Item 1 (ø = 3.3) ",
                                        "Item 1 (ø = 3.3) ", "Item 2 (ø = 3.8) ", "Item 2 (ø = 3.8) ",
                                        "Item 2 (ø = 3.8) ", "Item 2 (ø = 3.8) ", "Item 2 (ø = 3.8) ",
                                        "Item 2 (ø = 3.8) ", "Item 3 (ø = 3.4) ", "Item 3 (ø = 3.4) ",
                                        "Item 3 (ø = 3.4) ", "Item 3 (ø = 3.4) ", "Item 3 (ø = 3.4) ",
                                        "Item 3 (ø = 3.4) ", "Item 4 (ø = 3.4) ", "Item 4 (ø = 3.4) ",
                                        "Item 4 (ø = 3.4) ", "Item 4 (ø = 3.4) ", "Item 4 (ø = 3.4) ",
                                        "Item 4 (ø = 3.4) ", "Item 5 (ø = 3.5) ", "Item 5 (ø = 3.5) ",
                                        "Item 5 (ø = 3.5) ", "Item 5 (ø = 3.5) ", "Item 5 (ø = 3.5) ",
                                        "Item 5 (ø = 3.5) ", "Item 6 (ø = 3.5) ", "Item 6 (ø = 3.5) ",
                                        "Item 6 (ø = 3.5) ", "Item 6 (ø = 3.5) ", "Item 6 (ø = 3.5) ",
                                        "Item 6 (ø = 3.5) ", "Item 7 (ø = 3.4) ", "Item 7 (ø = 3.4) ",
                                        "Item 7 (ø = 3.4) ", "Item 7 (ø = 3.4) ", "Item 7 (ø = 3.4) ",
                                        "Item 7 (ø = 3.4) ", "Item 8 (ø = 3.3) ", "Item 8 (ø = 3.3) ",
                                        "Item 8 (ø = 3.3) ", "Item 8 (ø = 3.3) ", "Item 8 (ø = 3.3) ",
                                        "Item 8 (ø = 3.3) "), value = structure(c(1L, 2L, 3L, 4L, 5L,
                                                                                  6L, 1L, 2L, 3L, 4L, 5L, 6L, 1L, 2L, 3L, 4L, 5L, 6L, 1L, 2L, 3L,
                                                                                  4L, 5L, 6L, 1L, 2L, 3L, 4L, 5L, 6L, 1L, 2L, 3L, 4L, 5L, 6L, 1L,
                                                                                  2L, 3L, 4L, 5L, 6L, 1L, 2L, 3L, 4L, 5L, 6L), .Label = c("1 = very satisfied",
                                                                                                                                          "2", "3", "4", "5", "6 = very dissatified"), class = "factor"),
                           n = c(14L, 20L, 24L, 14L, 16L, 14L, 9L, 15L, 21L, 20L, 14L,
                                 23L, 19L, 17L, 16L, 14L, 16L, 20L, 22L, 17L, 15L, 16L, 20L,
                                 12L, 19L, 15L, 16L, 15L, 18L, 19L, 18L, 15L, 18L, 18L, 16L,
                                 17L, 17L, 20L, 17L, 17L, 14L, 16L, 16L, 25L, 16L, 17L, 8L,
                                 20L)), .Names = c("variable", "value", "n"), row.names =
                        c(NA,
                          -48L), vars = list("variable"), drop = TRUE, indices =
                        list(0:5,
                             6:11, 12:17, 18:23, 24:29, 30:35, 36:41, 42:47),
                      group_sizes = c(6L,
                                      6L, 6L, 6L, 6L, 6L, 6L, 6L),
                      biggest_group_size = 6L,
                      labels = structure(list(
                        "variable" = structure(1:8, .Label = c("Item 1 (ø = 3.3) ",
                                                             "Item 2 (ø = 3.8) ", "Item 3 (ø = 3.4) ", "Item 4 (ø = 3.4) ",
                                                             "Item 5 (ø = 3.5) ", "Item 6 (ø = 3.5) ", "Item 7 (ø = 3.4) ",
                                                             "Item 8 (ø = 3.3) "), class = "factor")),
                        row.names = c(NA,
                                      -8L), class = "data.frame", vars = list("variable"),
                        drop = TRUE, .Names = "variable"),
                      class = c("grouped_df",
                                "tbl_df", "tbl", "data.frame"))

d_result$variable <-
  factor(
    d_result$variable,
    levels = rev(unique(d_result$variable)))
d_result$value <-
  factor(d_result$value,
         levels=rev(unique(d_result$value)))

library(ggplot2)
ggplot(
  d_result,
  aes(x = variable, y = n, fill = value)) +
  geom_bar(
    stat = "identity") +
  coord_cartesian(ylim = c(0,100)) +
  coord_flip() +
  scale_y_continuous(name = "Percent") +
  scale_fill_manual(
    values = rev(
      c(
        "forestgreen", "limegreen",
        "gold", "orange1",
        "tomato3", "darkred"))) +
  ggtitle(
    paste(
      "Question 8: Satisfaction?")) +
  labs(fill = "Rating") +
  scale_x_discrete(
    name = element_blank(),
    drop = FALSE) +  # keep factor levels if no value exists
  geom_text(
    aes(label = n),
    color = "white",
    position = position_stack(vjust = 0.5)) +
  theme_minimal() +
  theme(
    legend.position = "right") +
  guides(fill = guide_legend(reverse = TRUE))




