
# Leeren Datensatz anlegen
ds_info <- data.frame(
  path = character(),
  filename = character(),
  date = character(),
  stringsAsFactors = FALSE
)

# Zeile im Datensatz ergaenzen
# und Format der Variablen erhalten
# Credits: https://de.wikibooks.org/wiki/GNU_R:_Umgang_mit_Datens%C3%A4tzen_(Erstellen,_Ausw%C3%A4hlen_und_Filtern)

ds_info <- rbind(ds_info, list("path", "filename", "Date"))

t_load_rdata <- function(ds_info = FALSE, path, filename) {
  # Check if object ds_info already exists
  if(exists(ds_info) == FALSE) {
    # Create an empty dataset
    ds_info <- data.frame(
      path = character(),
      filename = character(),
      date = character(),
      stringsAsFactors = FALSE
    )
  }
  
  ds <- load(file.path(path, filename))
}
