# sysdata is for usage by the package only.
# sysdata is not exported.
rToolbox_init <- sample(1000)
rToolbox_config <- sample(1000)
devtools::use_data(rToolbox_init,
                   rToolbox_config,
                   internal = TRUE)  # saving to ./R
