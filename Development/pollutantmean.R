# datasciencecoursera
# Course: Programming with R
# Week 2: Programming Assignemnt
# Part 1
# Write a function named 'pollutantmean' that calculates
# the mean of a pollutant (sulfate or nitrate) across a
# specified list of monitors. The function 'pollutantmean'
# takes three arguments:'directory', 'pollutant', and 'id'.
# Given a vector monitor ID numbers, 'pollutantmean' reads
# that monitors' particulate matter data from the directory
# specified in the 'directory' argument and returns the mean
# of the pollutant across all of the monitors, ignoring any
# missing values coded as NA. A prototype of the function is
# as follows:
#
# pollutantmean <- function(directory,
#                           pollutant,
#                           id = 1:332) {
#   # 'directory' is a character vector of length 1 indicating
#   # the location of the csv files.
#
#   # 'pollutant' is a character vector of length 1 indicating
#   # the name of the pollutant for which we will calculate
#   # the mean; either 'sulfate' or 'nitrate'.
#
#   # 'id' is an integer vector indicating the monitor ID
#   # numbers to be used.
#
#   # Return the mean of the pollutant across all monitors
#   # list in the 'ID' vector (ignoring NA values).
#   # Note: Do not round the result!
#
#
# }

work_dir <- "C:/Users/maubach.WEIN_WOLF/Desktop/temp/Documents/datasciencecoursera/Data/specdata"

t_create_file_list <- function(directory,
                               pattern = ".csv") {

  saved_workdir <- getwd()
  setwd(directory)

  file_list <- list.files(pattern = pattern)
  file_list <- file.path(directory,
                         file_list)

  setwd(saved_workdir)

  invisible(file_list)
}

t_get_textfile_header_list <- function(file_list,
                                       header_row = 1,
                                       ...) {

  # If you do not get the expected results, check your
  # input data and hand-over more parameters to the
  # read.table() function using the "..." operator to handle
  # the data properly, e. g. sep = ",".

  # Create header list from text files
  header_list <- lapply(
    file_list,
    read.table,
    header = FALSE,
    skip = header_row - 1,
    nrows = 1,
    stringsAsFactors = FALSE,
    ...
  )

  # Create empty dataset with
  # nrows = length of file list
  # ncols = length of all found headers in each file
  temp <- matrix(nrow = length(file_list),
                 ncol = length(unique(unlist(header_list))))
  rownames(temp) <- basename(file_list)
  colnames(temp) <- unique(unlist(header_list))
  header_dataset <- as.data.frame(temp)

  # Flag the headers found in each file with TRUE.
  # Keep NA if a header was not found in the file.
  for (row in 1:length(header_list)) {
    for (header in as.character(header_list[[row]])) {
      header_dataset[row, header] <- TRUE
    }
  }

  invisible(header_dataset)
}

t_read_textfiles <- function(
  file_list,
  begin = NA,  # name of file to start with
  end = NA) {  # name of file to end with

  # ATTENTION
  # The filenames given in 'begin' and 'end' enclose all
  # filenames of the ascending sorted file_list.

  file_list <- sort(file_list,
                    decreasing = FALSE,
                    na.last = NA)
  if (!is.na(begin) & !is.na(end)) {
    begin <- which(basename(file_list) == begin)
    end <- which(basename(file_list) == end)
    file_list <- file_list[begin:end]
  }

  for (file in file_list) {
    # If the dataset does not exist create it
    if (!exists("dataset")) {
      dataset <- read.table(
        file,
        header = TRUE,
        sep = ",",
        col.names = c("Date",
                      "Sulfate",
                      "Nitrate",
                      "ID"),
        stringsAsFactors = FALSE
      )
      # If the dataset exists append to it
    } else {
      temp <- read.table(
        file,
        header = FALSE,
        sep = ",",
        col.names = c("Date",
                      "Sulfate",
                      "Nitrate",
                      "ID"),
        stringsAsFactors = FALSE
      )
      dataset <- rbind(dataset, temp)
      rm(temp)
    }
  }

  dataset[ , "Sulfate"] <- as.numeric(dataset[ , "Sulfate"])
  dataset[ , "Nitrate"] <- as.numeric(dataset[ , "Nitrate"])
  dataset[ , "ID"] <- as.numeric(dataset[ , "ID"])

  invisible(dataset)
}

pollutantmean <- function(directory,
                          pollutant,
                          begin,
                          end) {

  file_list <- t_create_file_list(directory = directory)

  dataset <- t_read_textfiles(file_list = file_list,
                              begin = begin,
                              end = end)

  result <- mean(dataset[ , pollutant], na.rm = TRUE)

  invisible(result)
}

# EOF .
