#' draw popularity
#'
#' @param data dataset
#' @param nom first name to plot
#' @param color color to use
#'
#' @export
#'
draw_a_name <- function(data,nom,color) {
  data %>%
    ggplot() +
    aes(x = year, y = total) +
    geom_line(color=color)
}

#' count number of birth
#'
#' @param data dataset to use
#'
#' @export
#'
count_a_name <- function(data){
  data %>%
    summarise(total = sum(total)) %>%
    pull(total)
}
