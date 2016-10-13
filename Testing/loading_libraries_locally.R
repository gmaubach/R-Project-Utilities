f_test <- function() {

    print(search())
    test <- openxlsx::read.xlsx(xlsxFile = "c:/temp/test.xlsx",
                    sheet = 1)
    print(test)
}

cat("Loaded packages BEFORE function call ----------------------------")
search()

f_test()

cat("Loaded packages AFTER function call -----------------------------")
search()

stopifnot(requireNamespace("openxlsx"))
