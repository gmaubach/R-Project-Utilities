cat("", file = "./inst/CITATION")

citHeader("To cite 'package name' in publications use:")

citEntry(
  entry = "Unpublished",
  title = "package description",
  author = personList(
    as.person("Author Name")),
  year = "2017",
  url = "http://github.com/username/projectname",
  testVersion = paste(
    "<Author Name>. ",
    "<package name>, ",
    "<URL>, ",
    "Version 0.0.0.9000, ",
    "<year>")
)

