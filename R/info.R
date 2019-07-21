info <- function() {
    query_strings <- purrr::map_chr(
        c('data_vrs', 'api_vrs', 'api_defs',
          'study_structure', 'study_fields_list',
          'study_statistics', 'search_areas'),
        ~ paste0('ClinicalTrials.gov/api/info/', .)
    )

    results <- purrr::map(
        query_strings,
        function(x) {
            r <- httr::GET(x)
            httr::stop_for_status(r)
            r_xml <- xml2::read_xml(httr::content(r))
            xml2::as_list(r_xml)
        }
    )

    # TODO: tidy up 'results' object to be more useful


    # purrr::map(results, str, max.level = 2)
    #
    # results[[7]][[1]]$DocList[[1]][[1]][1:5]
    #
    # str(xml2::as_list(xml2::read_xml(x = results[[1]])))

}