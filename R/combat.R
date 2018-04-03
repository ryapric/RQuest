#' Attack
#'
#' This function causes damage to another [Actor]-class instance. The damage
#' dealt is relative to the attacker's Strength parameter, `str`.
#'
#' @param attacker [Actor]-class or subclass instance that is attacking
#' @param target [Actor]-class or subclass that is the target of the attack
attack <- function(attacker, target) {
  while (target$params$hp > 0) {
    dmg <- (attacker$params$str * 5)
    target$params$hp <- (target$params$hp - dmg)
    cat(sprintf("%s dealt %d damage to %s!\n", attacker$name, dmg, target$name))
    Sys.sleep(1)
    if (target$params$hp > 0) {
      cat(sprintf("%s has %d HP remaining\n", target$name, target$params$hp))
      Sys.sleep(1)
    } else {
      cat(sprintf("%s was defeated!\n", target$name))
      Sys.sleep(1)
      break
    }
  }
}

#' Heal
#'
#' This function restores HP to another [Actor]-class instance (or to self). The
#' HP restored is relative to the attacker's Magicka parameter, `mgk`.
#'
#' @param caster [Actor]-class or subclass instance that is casting
#' @param target [Actor]-class or subclass that is the target of the cast
heal <- function(caster, target) {
  hp_healed <- (caster$params$mgk * 5)
  target$params$hp <- (target$params$hp + hp_healed)
  cat(sprintf("%s healed %s for %d!\n", caster$name, target$name, hp_healed))
  Sys.sleep(1)
  cat(sprintf("%s has %d HP left\n", target$name, target$params$hp))
  Sys.sleep(1)
}
