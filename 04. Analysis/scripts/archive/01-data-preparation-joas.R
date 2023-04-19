
# Start timer -------------------------------------------------------------

tictoc::tic()

# Libraries ---------------------------------------------------------------

library(tidyverse)
library(lubridate)
library(purrr)

# Parameters --------------------------------------------------------------

author <- "Sam Kim and Ben Jaques-Leslie"
project_number <- "001"
project_name <- "Remote Work"
data_folder_1 <- "03. Data Collection/Original data files from Melissa/JOAs"
unique_identifier_1 <- c("usajobs_control_number")
date_earliest_open <- '2022-01-01'
data_latest_close <- '2022-12-01'

# Determine file name -----------------------------------------------------

file_name <- 
  glue::glue("01-data-preparation-joas-{project_number}-{str_replace_all(str_to_lower(project_name),' ','-')}-{today()}.html")

file_name

# Render data extraction --------------------------------------------------

rmarkdown::render(input = here::here("scripts",
                                     "01-data-preparation-joas.Rmd"),
                  params = list(
                    author = author,
                    project_number = project_number,
                    project_name = project_name,
                    data_folder_1 = data_folder_1,
                    unique_identifier_1 = unique_identifier_1,
                    date_earliest_open = date_earliest_open,
                    data_latest_close = data_latest_close
                  ),
                  output_file =
                    here::here("output",
                               'html',
                               file_name))


# End timer ---------------------------------------------------------------

tictoc::toc()

