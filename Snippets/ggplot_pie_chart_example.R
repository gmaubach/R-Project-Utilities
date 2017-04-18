library(ggplot2)
library(scales)

df <-
  data.frame(group = c("Male", "Female", "Child"),
             value = c(25, 25, 50))

blank_theme <- theme_minimal() + theme(
  axis.title.x = element_blank(),
  axis.title.y = element_blank(),
  axis.text.x = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.ticks = element_blank(),
  plot.title = element_text(size = 4, face = "bold"))

ggplot(df, aes(x = "", y = value, fill = group)) +
  geom_bar(
    width = 1,
    stat = "identity") +
  coord_polar("y", start = 0) +
  scale_fill_brewer(
    name = "Gruppe",
    palette = "Blues") +
  blank_theme +
  geom_text(
    aes(
      y = c(10, 40, 75),
      label = scales::percent(value/100)),
    size = 5) +
  labs(title = "Pie Title")



