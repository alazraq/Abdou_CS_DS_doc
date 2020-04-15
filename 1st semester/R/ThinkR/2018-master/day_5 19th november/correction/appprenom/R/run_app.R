#' run the app
#'
#' @export
#'
run_app <- function() {
  appDir <- system.file("my_app", package = "appprenom")
  if (appDir == "") {
    stop("Could not find . Try re-installing `appprenom`.", call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = "normal")
}
