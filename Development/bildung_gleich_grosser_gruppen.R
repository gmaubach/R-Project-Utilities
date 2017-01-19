# Credits: http://statmath.wu.ac.at/courses/MgtSci-LineareAlgebra/NotizenZuR.pdf

# Kodierung einer quantitativen Datenliste in gleich groﬂe
# Gruppen.
my.codes <- function(x,br)
{
  if (length(br)>1)
  {
    y <- (x>br[1])
    for (i in 2:(length(br)-1)) y <- y+(x>br[i])
  }
  else
  {
    i <- sort.list(x+runif(length(x))*0.000001)
    y <- numeric(0)
    y[i] <- ceiling((1:length(x))/(length(x)+1)*br)
  }
  return(as.factor(y))
}
