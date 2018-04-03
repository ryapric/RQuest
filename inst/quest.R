library(RQuest)

# INSTANTIATE ALL OF THE THINGS
player <- Actor$new("Steve", "warrior")
villain <- Actor$new("Grunt", "warrior")

while (TRUE) {

  res <- readline("What will you do? ")
  if (res == "attack") {
    player$attack(villain)
  } else if (res == "heal") {
    player$heal(player)
  }
  villain$attack(player)

}
