#-----------------------------------------------------------
# Project     : t_definitions.R
# Organisation: Wein Wolf Import GmbH & Co. Verwaltungs KG
# Department  : Sales
# Author      : Georg Maubach
# Contributors: n/a
# Date        : 2016-12-21
# Update      : 2016-12-21
#
# Copyright (C) 2016,
#     Wein Wolf Import GmbH & Co. Verwaltngs KG
# All rights reserved.
#-----------------------------------------------------------
cat("===================================================\n")
cat("#= [ Module ]: t_definitions.R\n")
cat("===================================================\n")

cat("#= [ Configuration ] ==============================\n")
cat("#= [ Libraries ] ==================================\n")

cat("#= [ Declarations ] ===============================\n")
cat("#- [ Constants ] ----------------------------------\n")
c_row <- 1
c_col <- 2

c_cm_in_inches <- 0.393701  # 1 cm = 0.393701 inches
c_inches_in_cm <- 2.54      # 1 inch = 2.54 cm

c_DIN_A4_in_cm <- list(height = 29.7, # in cm
                       width  = 21)   # in cm

c_DIN_A4_in_inches <-
  list(
    height = c_DIN_A4_in_cm$height / c_inches_in_cm,
    width  = c_DIN_A4_in_cm$width / c_inches_in_cm)

cat("#- [ Operators ] ----------------------------------\n")
# NOT IN Operator
# Credits: Bill Venables
# (http://r.789695.n4.nabble.com/what-is-the-NOT-IN-operator-tp2966028p2966210.html)
`%ni%`  <- Negate(`%in%`)  ## not in operator
`%!in%` <- Negate(`%in%`)  ## not in operator

cat("#- [ Variables ] ----------------------------------\n")
cat("#- [ Functions ] ----------------------------------\n")
cat("#- [ Modules ] ------------------------------------\n")

cat("#= [ BEGIN ] ======================================\n")
cat("#  [ At First ] -----------------------------------\n")
cat("#  [ Input ] --------------------------------------\n")
cat('#  [ Processing ] ---------------------------------\n')
cat("#  [ Inspect ] ....................................\n")
cat("#  [ Clean ] ......................................\n")
cat("#  [ Prepare ] ....................................\n")
cat("#  [ Analyse ] ....................................\n")
cat("#  [ Present ] ....................................\n")
cat("#  [ Output ] -------------------------------------\n")
cat("#  [ Export ] .....................................\n")
cat("#  [ Save ] .......................................\n")
cat("#  [ Cleanup ] ------------------------------------\n")
cat("#  [ At End ] -------------------------------------\n")
cat("#= [ END ] ========================================\n")

cat("#                   [ End Module ]                 \n")

# EOF .
