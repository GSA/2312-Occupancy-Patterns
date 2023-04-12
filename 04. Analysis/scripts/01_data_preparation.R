
# Start timer -------------------------------------------------------------

tictoc::tic()

# Libraries ---------------------------------------------------------------

library(tidyverse)
library(lubridate)
library(purrr)

# Parameters --------------------------------------------------------------

author <- "Ben Jaques-Leslie"
project_number <- 2312
project_name <- "Occupancy Patterns"
google_drive_home <- "G:/Shared drives/MSG Projects/1.0 Real Estate Solutions (LQ1)/2312 Work Patterns"
data_folder_1 <- "Occupancy Data Pull"
unique_identifier_1 <- c("employee_name","date")
data_folder_2 <- "Rosters"
unique_identifier_2 <- c("snapshot_date","employee_e_mail_address")

# Determine file name -----------------------------------------------------

file_name <- glue::glue("01-data-preparation-{project_number}-{str_replace_all(str_to_lower(project_name),' ','-')}-{today()}.html")

file_name

# Render data extraction --------------------------------------------------

rmarkdown::render(input = here::here("04. Analysis",
                                     "scripts",
                                     "01_data_preparation.Rmd"),
                  params = list(
                    author = author,
                    project_number = project_number,
                    project_name = project_name,
                    google_drive_home = google_drive_home,
                    data_folder_1 = data_folder_1,
                    unique_identifier_1 = unique_identifier_1,
                    data_folder_2 = data_folder_2,
                    unique_identifier_2 = unique_identifier_2
                  ),
                  output_file =
                    here::here("04. Analysis",
                               "output",
                               'html',
                               file_name))


# End timer ---------------------------------------------------------------

tictoc::toc()

