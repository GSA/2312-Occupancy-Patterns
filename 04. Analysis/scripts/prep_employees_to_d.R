d <- 
  prep_employees %>% 
  mutate(
    across(
      .cols = c(daily_status_reporting_to_job_site_working_prop,
                daily_status_teleworking_working_prop,
                daily_status_reporting_to_job_site_observation_prop,
                daily_status_teleworking_observation_prop,
                starts_with("mon_"),
                starts_with("tue_"),
                starts_with("wed_"),
                starts_with("thu_"),
                starts_with("fri_"),
                working_days,
                team_size_mode,
                starts_with("days_colocated_"),
                starts_with("days_telework_"),
                -days_colocated_1,
                -days_colocated_supervisor,
                -days_colocated_team,
                -days_telework_team
                ),
      .fns = list(scale = scale,rank = rank),
      .names = "{.col}_{.fn}"
    )
  )