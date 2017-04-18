library(ggplot2)
library(gridExtra)

my3cols <- c("#6D9EC1","#646567", "#A29B32")

set.seed(1234)
x <- c(rnorm(350, mean = -1), rnorm(350, mean = 1.5),
       rnorm(350, mean = 4))
y <- c(rnorm(350, mean = -0.5), rnorm(350, mean = 1.7),
       rnorm(350, mean = 2.5))

group <- as.factor(rep(c(1, 2, 3), each = 350))

df2 <- data.frame(x, y, group)

head(df2)

scatterPlot <- ggplot(
  df2,
  aes(x, y)) +
  geom_point(aes(color = group)) +
  scale_color_manual(values = my3cols) +
  theme(
    legend.position = c(0, 1),
    legend.justification = c(0, 1))

xdensity <- ggplot(
  df2,
  aes(x)) +
  geom_density(
    aes(fill = group), alpha = 0.8) +
  scale_fill_manual(values = my3cols) +
  theme(legend.position = "none")

ydensity <- ggplot(
  df2,
  aes(y)) +
  geom_density(
    aes(fill = group), alpha = 0.8) +
  scale_fill_manual(values = my3cols) +
  theme(
    legend.position = "none") + coord_flip()

blankPlot <- ggplot() + geom_blank(aes(1, 1)) + theme_void()

grid.arrange(
  xdensity,
  blankPlot,
  scatterPlot,
  ydensity,
  ncol = 2,
  nrow = 2,
  widths = c(4, 1.4),
  heights = c(1.4, 4))

)
