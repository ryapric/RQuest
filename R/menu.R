#' Menu Functions
#'
#' These functions are available to the player before beginning the game itself.
#'
#' @name main_menu

#' @rdname main_menu
#' @export
help <- function() {
  print("Do you need help?")
}

#' @rdname main_menu
#' @export
start_quest <- function() {
  source(system.file("quest.R", package = "RQuest", mustWork = TRUE))
}
