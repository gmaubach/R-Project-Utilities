# Snippet to change a value based on condition directly without ifelse

#ds_package_comparison$needed[ds_package_comparison$packages %in% base_packages] <- TRUE
ds_package_comparison[["needed"]][ds_package_comparison[["packages"]] %in% base_packages] <- TRUE
