
# Start timer -------------------------------------------------------------

tictoc::tic()

# Libraries ---------------------------------------------------------------

library(tidyverse)
library(lubridate)
library(purrr)

# Parameters --------------------------------------------------------------

author <-  "Ben Jaques-Leslie"
project_number <-  2312
project_name <-  "Occupancy Patterns"
google_drive_home <-  "G:/Shared drives/MSG Projects/1.0 Real Estate Solutions (LQ1)/2312 Work Patterns"
data_folder_1 <-  "prepared-data"
data_file_1 <-  "check_in_panel_2023-04-12.rdata"
unique_identifier_1 <- c("date","person_id")
date_cohort_month <-  "2022-03-01"
observation_window_length_months <-  6

# Determine file name -----------------------------------------------------

file_name <- glue::glue("02_data_preparation_clusters_employee-{project_number}-{str_replace_all(str_to_lower(project_name),' ','-')}-{today()}.html")

file_name

# Render data extraction --------------------------------------------------

rmarkdown::render(input = here::here("04. Analysis",
                                     "scripts",
                                     "02_data_preparation_clusters_employee.Rmd"),
                  params = list(
                    author = author,
                    project_number = project_number,
                    project_name = project_name,
                    google_drive_home = google_drive_home,
                    data_folder_1 = data_folder_1,
                    data_file_1 = data_file_1,
                    unique_identifier_1 = unique_identifier_1,
                    date_cohort_month = date_cohort_month,
                    observation_window_length_months = observation_window_length_months
                  ),
                  output_file =
                    here::here("04. Analysis",
                               "output",
                               'html',
                               file_name))


# End timer ---------------------------------------------------------------

tictoc::toc()

