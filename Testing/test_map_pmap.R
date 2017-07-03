
cat("# CSI Customer Satisfaction Index\n")

# -- Set ----------------------------------------------
options(digita = 2, scipen = 999)

# -- Libs ---------------------------------------------

library(corrplot)
library(tibble)


# -- Input --------------------------------------------


# -- Data ---------------------------------------------

v01_r01 <- tibble::as_tibble(as.numeric(d_kzb_prepared[["v01_r01"]]))
v01_r01 <- as.numeric(d_kzb_prepared[["v01_r01"]])
names(v01_r01) <- c("v01_r01")
v08_xx <- tibble::as_tibble(
  d_kzb_prepared[paste0(
    var_battery$v08,
    "_up11")])


# -- Explore ------------------------------------------

table(v01_r01, useNA = "always")
sum(
  apply(
    X = v08_xx,
    MARGIN = 1,
    FUN = function(x) {all(is.na(x))}))
sum(is.na(v08_xx_up11_mean))
# %ROTA%
# 3 cases with missing on all v08_xx variables.

dataset <- cbind(v01_r01, v08_xx)
gpairs::gpairs(dataset)

corrplot.mixed(cor(dataset), upper = "ellipse")

corrplot.mixed(
  cor(
    dataset[, 2:ncol(dataset)],  # without dependent var
    use = "pairwise.complete.obs"),
  upper = "ellipse")
# %ROTA%
# There is no group of items with r>0.8 and no single items
# with r > 0.9, thus correlation of items is not so strong
# that remediation is strictly required.

independent <- list(dataset$v01_r01)
# dependent <- paste0(
#   "v08_",
#   formatC(1:8, width = 2, format = "d", flag = "0"),
#   "_up11")
dependent <- as.list(dataset[paste0(var_battery$v08,"_up11")])

fargs <- list(
  x = independent,
  y = dependent,
  ylab = c_v08_var_labs)

fargs %>%
  purrr::map(-plot(data = dataset))


mu <- list(5, 10, -3)
sigma <- list(1, 5, 10)
n <- list(1, 3, 5)
fargs <- list(mean = mu, sd = sigma, n = n)
fargs %>%
  purrr::pmap(rnorm) %>%
  str()



# -- Transform ----------------------------------------



# -- Analyse ------------------------------------------

# Means
cat(paste(
  "Gesamtzufriedenheit (Mittelwert):",
  mean(v01_r01, na.rm = TRUE)))

cat(paste(
  "Gesamtzufriedenheit (Mittelwert):",
  mean(v08_mean_scale11, na.rm = TRUE)))

# Corr Matrix
corrplot::corrplot(
  cor(
    dataset,
    use = "pairwise.complete.obs"))


# -- Plot ---------------------------------------------


# -- Output -------------------------------------------


# -- Cleanup ------------------------------------------


# EOF .

