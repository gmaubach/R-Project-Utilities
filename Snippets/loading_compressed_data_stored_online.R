# Download compressed data stored online
# Source: Gandrud, Christopher: Reproducible Research with
# R and RStudio, 2015, p.122

# Store URL in object
URL <- "http://..."

# Create temporary file to put zipfile in
temp <- tempfile()

# Download compressed file into a the temporary file
download.file(URL, temp)

# Decompress the temporary file and convert to data frame
dataset <- read.csv(
  gzfile(
    temp,
    "filename-for-decompressed-file.csv"))

# Delete temporary file
unlink(temp)

# EOF .

