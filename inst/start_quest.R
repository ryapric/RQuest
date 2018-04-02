library(RQuest)

while (TRUE) {

  res <- tolower(readline("Choose a starting class: "))
  if (res %in% starting_classes) {
    print(paste0("You chose: ", res))
    player <- Actor$new("Steve", res)
    print(player)
  }

}
