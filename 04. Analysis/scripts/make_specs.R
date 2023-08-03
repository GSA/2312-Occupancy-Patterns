step_01 <- 
  tibble(
  in_scale_or_rank = c(rep("scale", 8), rep("rank", 8)),
  in_working_or_observation_window = rep(c(rep("observation", 4), rep("working", 4)), 2),
  in_weekday_correlation = rep(
    c(
      "correlation telework",
      "correlation status",
      "proportion pairs",
      "none"
    ),
    4
  ),
  in_number_of_clusters_start = rep(params$in_number_of_clusters_start, 16),
  in_number_of_clusters_end = rep(params$in_number_of_clusters_end, 16)
) 

step_02 <- 
  step_01 %>% 
  mutate(in_remove_other_statuses = TRUE) %>% 
  bind_rows(step_01 %>% 
              mutate(in_remove_other_statuses = FALSE)
            )

specs <- 
  step_02 %>% 
  unite(col = "in_specification",everything(),remove = FALSE) %>% 
  mutate(
    in_specification = str_replace_all(in_specification," ","_")
  )
