# Difference of years

bdage<-function(dob,now) {
  dobbits<-as.numeric(unlist(strsplit(dob,"/")))
  nowbits<-as.numeric(unlist(strsplit(now,"/")))
  return(nowbits[3]-dobbits[3]-
           (nowbits[2]<dobbits[2] || (nowbits[2]==dobbits[2] && nowbits[1]<dobbits[1])))
}
bdage("20/09/1945","5/8/2016")

age_days <- difftime(Sys.Date(), as.Date("1970-01-25"))

diff_years <- as.numeric(age_days, units="days") / 365.242

