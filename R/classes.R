#' Base R6 Actor Class
#'
#' This [R6 class][R6::R6Class()] is a constructor for all Actor subclasses. Also
#' documented here are various related R objects, like a list of possible
#' starting classes (Which means you need to document better!)
#'
#' @export
Actor <- R6::R6Class(
  "Actor",
  public = list(
    name = NULL,
    actor_class = NULL,
    params = list(hp = NULL, mp = NULL, str = NULL, skl = NULL),
    initialize = function(name, actor_class) {
      self$name <- name
      actor_class <- tolower(actor_class)
      self$actor_class <- actor_class
      self$params <- case_when(
        actor_class == "warrior" ~ list(hp = 100, mp = 10, str = 10, skl = 3),
        actor_class == "mage" ~ list(hp = 50, mp = 100, str = 1, skl = 3),
        actor_class == "rogue" ~ list(hp = 60, mp = 40, str = 4, skl = 10))
      # The lists stored above aren't keeping their name attributes
      # Seems to be a `case_when` issue, so reassign here
      names(self$params) <- c("hp", "mp", "str", "skl")
    }
  )
)



#' Player Classes
#'
#' A list of possible player starting classes.
#'
#' @export
player_classes <- list("warrior", "mage", "rogue")
