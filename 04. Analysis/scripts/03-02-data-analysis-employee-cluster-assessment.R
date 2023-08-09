
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
data_folder_1 <- "prepared-data"
data_file_1 <- "prep_employees_2023-08-09.rdata"
in_number_of_clusters_start <- 1
in_number_of_clusters_end <- 20
in_seed <- 27

# Determine file name -----------------------------------------------------

file_name <- glue::glue("03-02-data-analysis-employee-cluster-assessing-clusters-{project_number}-{str_replace_all(str_to_lower(project_name),' ','-')}-{today()}.html")

file_name

# Render data extraction --------------------------------------------------

rmarkdown::render(input = here::here("04. Analysis",
                                     "scripts",
                                     "03-02-data-analysis-employee-cluster-assessing-clusters.Rmd"),
                  params = list(
                    author = author,
                    project_number = project_number,
                    project_name = project_name,
                    google_drive_home = google_drive_home,
                    data_folder_1 = data_folder_1,
                    data_file_1 = data_file_1,
                    in_number_of_clusters_start = in_number_of_clusters_start,
                    in_number_of_clusters_end = in_number_of_clusters_end,
                    in_seed = in_seed
                  ),
                  output_file =
                    here::here("04. Analysis",
                               "output",
                               'html',
                               file_name))


# End timer ---------------------------------------------------------------

tictoc::toc()

