#' Player Classes
#'
#' A list of possible Actor starting jobs.
#'
#' @export
actor_jobs <- list("warrior", "mage", "rogue")



#' Roll Actor
roll_actor <- function(actor_job) {
  stopifnot(actor_job %in% actor_jobs)
  roll <- case_when(
    actor_job == "warrior" ~ list(hp = 100, mp = 10, str = 10, skl = 3, mgk = 2),
    actor_job == "mage" ~ list(hp = 50, mp = 100, str = 1, skl = 3, mgk = 10),
    actor_job == "rogue" ~ list(hp = 60, mp = 40, str = 4, skl = 10, mgk = 4))
  # The lists stored above aren't keeping their name attributes
  # Seems to be a `case_when` issue, so reassign here
  names(roll) <- c("hp", "mp", "str", "skl", "mgk")

  roll
}



#' Base R6 Actor Class
#'
#' This [R6 class][R6::R6Class()] is a constructor for all Actor subclasses.
#' Objects are instantiated with the following methods:
#' - A list of *character parameters* (`params`)
#' - A method for [attacking][attack_()] another object
#' - A method for [healing][heal_()] another object
Actor <- R6::R6Class(
  "Actor",
  public = list(
    name = NULL,
    actor_job = NULL,
    level = NULL,
    params = list(hp = NULL, mp = NULL, str = NULL, skl = NULL, mgk = NULL),
    initialize = function(name, actor_job) {
      self$name <- name
      actor_job <- tolower(actor_job)
      self$level <- 1L
      self$actor_job <- actor_job
      self$params <- roll_actor(actor_job)
    },
    attack = function(target) {
      attack_(self, target)
    },
    heal = function(target) {
      heal_(self, target)
    },
    restore_mp = function(target) {
      restore_mp_(self, target)
    }
  )
)



#' Player Class
#'
#' R6 class generator for Player Classes. Serves to instantiate a Player object.
#' Inherits from [Actor]. Add params to initialize() that re-set ceiling for HP
#' and MP restoration.
#'
#' @export
Player <- R6::R6Class(
  "Player",
  inherit = Actor,
  public = list(
    initialize = function(name, actor_job) {
      super$initialize(name, actor_job)
      self$params <- lapply(roll_actor(actor_job), `*`, 2)
      self$params$hp_max <- self$params$hp
      self$params$mp_max <- self$params$mp
    }
  )
)



#' Villain Class
#'
#' R6 class generator for Villain Classes. Serves to instantiate a Villain object.
#' Inherits from [Actor]. Add params to initialize() that set ceiling for HP and
#' MP restoration.
#'
#' @export
Villain <- R6::R6Class(
  "Villain",
  inherit = Actor,
  public = list(
    initialize = function(name, actor_job) {
      super$initialize(name, actor_job)
    }
  )
)
