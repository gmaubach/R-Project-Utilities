t_clear_warnings <- function()
{
  # Credits: http://stackoverflow.com/questions/5725106/r-how-to-clear-all-warnings
  assign("last.warning", NULL, envir = baseenv())
}
