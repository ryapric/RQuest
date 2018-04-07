library(RQuest)

# INSTANTIATE ALL OF THE THINGS
player <- Player$new("Steve", "warrior")
villain <- Villain$new("Grunt", "warrior")

player$attack(villain)

stage_1()

# while (TRUE) {
#
#   res <- readline("What will you do? ")
#   if (res == "attack") {
#     player$attack(villain)
#   } else if (res == "heal") {
#     player$heal(player)
#   }
#   villain$attack(player)
#
# }
