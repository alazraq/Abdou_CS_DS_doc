# Define couples distances - years to buffer by @statnmap
#' @param dists  c(10000, 25000, 50000, 75000)
#' @param ans  unique(maternites_pt$an)

dist_circles <- function(x,
                         dists = units::set_units(c(10, 25, 50), km),
                         ans,
                         x.limits) {
  # browser()
  if (!missing(ans)) {
    dists_ans <- data.frame(
      dists = rep(dists, length(ans)),
      ans = rep(ans, each = length(dists))
    )
    # Create buffer areas for each distances / year
    pts_buf <- purrr::map2(
      dists_ans$dists, dists_ans$ans,
      ~sf::st_buffer(
        filter(x, an == .y),
        .x) %>%
        dplyr::mutate(
          dist = .x,
        )
    ) %>%
      do.call("rbind", .) %>% 
      sf::st_cast() %>%
      mutate(dist.leg = glue::glue("<{dist/1000} km"))
    
    
    # Define triplet big/small-distance/year
    big_small <- data.frame(
      big_dist = dists[rep(2:length(dists), length(ans))],
      small_dist = dists[rep(1:(length(dists) - 1), length(ans))],
      an = ans[rep(1:length(ans), each = length(dists) - 1)]
    )
    # Remove part of polygons overlapping smaller buffer
    pts_holes <- big_small %>%
      split(1:nrow(big_small)) %>%
      purrr::map( 
        ~st_difference(
          filter(pts_buf, dist == .$big_dist, an == .$an),
          filter(pts_buf, dist == .$small_dist, an == .$an)
        )
      ) %>%
      do.call("rbind", .) %>% 
      dplyr::select(-contains(".1")) %>%
      st_cast()
    
    # Add smallest polygons and re-order distance names for legend
    pts_holes_tot <- pts_holes %>% 
      rbind(
        dplyr::filter(pts_buf, dist == min(dists))
      ) %>%
      arrange(an, dist) %>%
      mutate(dist = forcats::fct_reorder(dist.leg, dist))
    
  } else {
    pts_buf <- purrr::map(
      dists,
      ~st_buffer(x, .x) %>%
        mutate(dist = .x)
    ) %>%
      do.call("rbind", .) %>% 
      st_cast() %>%
      mutate(dist.leg = as.character(dist))
    
    
    # Define triplet big/small-distance/year
    dists_order_char <- sort(dists) %>% as.character()
    big_small <- data.frame(
      big_dist = tail(dists_order_char, -1),
      small_dist = head(dists_order_char, -1)
    )
    
    
    # Remove part of polygons overlapping smaller buffer
    pts_holes <- big_small %>%
      split(1:nrow(big_small)) %>%
      purrr::map( 
        ~st_difference(
          dplyr::filter(pts_buf, dist.leg == .$big_dist),
          dplyr::filter(pts_buf, dist.leg == .$small_dist) %>% 
          dplyr::select(geometry) %>% st_union()
        )
      ) %>%
      do.call("rbind", .) %>% 
      dplyr::select(-contains(".1")) %>%
      st_cast()
    
    # Add smallest polygons and re-order distance names for legend
    pts_holes_tot <- pts_holes %>% 
      rbind(
        filter(pts_buf, dist.leg == dists_order_char[1])
      ) %>%
      arrange(dist) %>%
      mutate(dist = forcats::fct_reorder(dist.leg, dist))
    
  }
  
  pts_holes_fr <- st_intersection(pts_holes_tot, 
                                  dplyr::select(x.limits, geometry))
  
  return(pts_holes_fr)
  
}
