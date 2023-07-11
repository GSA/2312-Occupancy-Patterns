#' Selects the correct columns for employee cluster analysis
#'
#' @param in_data Data to use
#' @param in_scale_or_rank Option for which scaling procedure: "scale" (normalization) or "rank" (rank order)
#' @param in_working_or_observation_window Option for proportion denominator: "observation" (proportion of entire observation window) or "working" (proportion of period employ was working onsite or via telework)
#' @param in_weekday_correlation Option for inter weekday relationship: "correlation telework" (telework correlation between days of the week), "correlation status" (work status correlation based on ordered work status by days of the week), or "proportion pairs" (proportion of telework in pairs)
#'
#' @return Dataframe with only selected columns and dropped null observations
#' @export
#'
#' @examples
select_cluster_cols <-
  function(in_data,
           in_scale_or_rank,
           in_working_or_observation_window,
           in_weekday_correlation)
  {
    stopifnot(in_scale_or_rank %in% c("scale", "rank"))
    stopifnot(in_working_or_observation_window %in% c("observation", "working"))
    stopifnot(in_weekday_correlation %in% c("correlation telework", "correlation status","proportion pairs"))
    
    if (in_scale_or_rank == "scale" &
        in_working_or_observation_window == "observation" &
        in_weekday_correlation == "correlation telework")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_scale"),
          -contains("_working_prop_"),
          -contains("_cor_status_"),
          -contains("_prop_pairs_"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "rank" &
        in_working_or_observation_window == "observation" &
        in_weekday_correlation == "correlation telework")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_rank"),
          -contains("_working_prop_"),
          -contains("_cor_status_"),
          -contains("_prop_pairs_"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "scale" &
        in_working_or_observation_window == "working" &
        in_weekday_correlation == "correlation telework")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_scale"),
          -contains("_observation_"),
          -contains("_cor_status_"),
          -contains("_prop_pairs_"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "rank" &
        in_working_or_observation_window == "working" &
        in_weekday_correlation == "correlation telework")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_rank"),
          -contains("_observation_"),
          -contains("_cor_status_"),
          -contains("_prop_pairs_"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "scale" &
        in_working_or_observation_window == "observation" &
        in_weekday_correlation == "correlation status")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_scale"),
          -contains("_working_prop_"),
          -contains("_cor_telework_"),
          -contains("_prop_pairs_"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "rank" &
        in_working_or_observation_window == "observation" &
        in_weekday_correlation == "correlation status")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_rank"),
          -contains("_working_prop_"),
          -contains("_cor_telework_"),
          -contains("_prop_pairs_"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "scale" &
        in_working_or_observation_window == "working" &
        in_weekday_correlation == "correlation status")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_scale"),
          -contains("_observation_"),
          -contains("_cor_telework_"),
          -contains("_prop_pairs_"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "rank" &
        in_working_or_observation_window == "working" &
        in_weekday_correlation == "correlation status")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_rank"),
          -contains("_observation_"),
          -contains("_cor_telework_"),
          -contains("_prop_pairs_"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "scale" &
        in_working_or_observation_window == "observation" &
        in_weekday_correlation == "proportion pairs")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_scale"),
          -contains("_working_prop_"),
          -contains("_cor_status_"),
          -contains("cor_telework"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "rank" &
        in_working_or_observation_window == "observation" &
        in_weekday_correlation == "proportion pairs")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_rank"),
          -contains("_working_prop_"),
          -contains("_cor_status_"),
          -contains("cor_telework"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "scale" &
        in_working_or_observation_window == "working" &
        in_weekday_correlation == "proportion pairs")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_scale"),
          -contains("_observation_"),
          -contains("_cor_status_"),
          -contains("cor_telework"),
        ) %>%
        drop_na()
    }
    
    if (in_scale_or_rank == "rank" &
        in_working_or_observation_window == "working" &
        in_weekday_correlation == "proportion pairs")
    {
      step_01 <-
        in_data %>%
        select(
          person_id,
          ends_with("_rank"),
          -contains("_observation_"),
          -contains("_cor_status_"),
          -contains("cor_telework"),
        ) %>%
        drop_na()
    }
    
    out <- 
      step_01 %>% 
      as_tibble()
    
    return(out)
  }