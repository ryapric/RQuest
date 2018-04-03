library(RQuest)

# INSTANTIATE ALL OF THE THINGS
player$heal(player)

villain$attack(player)

while (TRUE) {

  res <- readline("What will you do? ")
  if (res == "attack") {
    attack(player, villain)
  } else if (res == "heal") {
    heal(player, player)
  }
  attack(villain, player)

}
