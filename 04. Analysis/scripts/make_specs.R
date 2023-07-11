specs <- 
  tibble(
  in_scale_or_rank = c(rep("scale", 6), rep("rank", 6)),
  in_working_or_observation_window = rep(c(rep("observation", 3), rep("working", 3)), 2),
  in_weekday_correlation = rep(
    c(
      "correlation telework",
      "correlation status",
      "proportion pairs"
    ),
    4
  ),
  in_number_of_clusters_start = rep(params$in_number_of_clusters_start, 12),
  in_number_of_clusters_end = rep(params$in_number_of_clusters_end, 12)
) %>% 
  unite(col = "in_specification",everything(),remove = FALSE) %>% 
  mutate(
    in_specification = str_replace_all(in_specification," ","_")
  )