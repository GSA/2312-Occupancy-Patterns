#' Make employee clusters of a variety of sizes and different specifications
#'
#' @param in_data Data to use
#' @param in_scale_or_rank Option for which scaling procedure: "scale" (normalization) or "rank" (rank order)
#' @param in_working_or_observation_window Option for proportion denominator: "observation" (proportion of entire observation window) or "working" (proportion of period employ was working onsite or via telework)
#' @param in_weekday_correlation Option for inter weekday relationship: "correlation telework" (telework correlation between days of the week), "correlation status" (work status correlation based on ordered work status by days of the week), or "proportion pairs" (proportion of telework in pairs)
#' @param in_number_of_clusters_start Minimum number of clusters to test
#' @param in_number_of_clusters_end Maximum number of clusters to test
#'
#' @return Dataframe of clusters and associatied statistics
#' @export
#'
#' @examples
make_clusters <-
  function(in_data,
           in_scale_or_rank,
           in_working_or_observation_window,
           in_weekday_correlation,
           in_number_of_clusters_start,
           in_number_of_clusters_end)
  {
    stopifnot(in_scale_or_rank %in% c("scale", "rank"))
    stopifnot(in_working_or_observation_window %in% c("observation", "working"))
    stopifnot(
      in_weekday_correlation %in% c(
        "correlation telework",
        "correlation status",
        "proportion pairs"
      )
    )
    stopifnot(in_number_of_clusters_start >= 1)
    stopifnot(in_number_of_clusters_start <= in_number_of_clusters_end)
    
    step_01 <-
      in_data %>%
      select_cluster_cols(
        in_scale_or_rank = in_scale_or_rank,
        in_working_or_observation_window = in_working_or_observation_window,
        in_weekday_correlation = in_weekday_correlation
      )
    
    print(glue::glue("Review data for step 1. {Sys.time()}"))
    
    step_01 %>%
      skim() %>%
      print()
    
    print(glue::glue("Remove person_id. {Sys.time()}"))
    
    step_02 <-
      step_01 %>%
      select(-person_id)
    
    print(glue::glue("Review data for step 2. {Sys.time()}"))
    
    step_02 %>%
      skim() %>%
      print()
    
    print(
      glue::glue(
        "Create clusters of the data from {in_number_of_clusters_start} to {in_number_of_clusters_end}. {Sys.time()}"
      )
    )
    
    out <-
      tibble(k = in_number_of_clusters_start:in_number_of_clusters_end) %>%
      mutate(
        kclust = map(k, ~ kmeans(step_02, .x)),
        tidied = map(kclust, tidy),
        glanced = map(kclust, glance),
        augmented = map(kclust, augment, step_01)
      )
    
    return(out)
  }