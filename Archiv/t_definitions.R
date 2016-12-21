#-------------------------------------------------------------------------------
# Program       : R Definitions
# Author        : Georg Maubach
# Date          : 2016-03-03
# Update        : 2016-07-25
# Description   : Definitions to be used with all R programs
# Source System : R 3.2.2 (64-Bit)
# Target System : R 3.2.2 (64-Bit)
#--------1---------2---------3---------4---------5---------6---------7---------8

t_row <- 1
t_col <- 2

# Operators --------------------------------------------------------------------
# NOT IN Operator
# Credits: Bill Venables
#          (http://r.789695.n4.nabble.com/what-is-the-NOT-IN-operator-tp2966028p2966210.html)
`%ni%` <- Negate(`%in%`)  ## not in operator

# EOF
