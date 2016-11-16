t_create_dataset_label <- function(
  #---------------------------------------------------------
  project_ID,
  project_name,
  country_ID,
  country_name,
  year,
  organisation,
  author)
  #---------------------------------------------------------
{
  return(
    data.frame(
      list(
        Project_ID = project_ID,
        Project_Name = project_name,
        Pountry_ID = country_ID,
        Pountry_Name = country_name,
        Year = year,
        Organisation = organisation,
        Author = author
      ),
      stringsAsFactors = FALSE
    )
  )
}

ds_label <- t_create_dataset_label(
  project_ID = "001",
  project_name = "Test",
  country_ID = "DE",
  country_name = "Germany",
  year = 2016,
  organisation = "Wein Wolf Import GmbH & Co. Verwaltungs KG",
  author = "Georg Maubach"
  )



