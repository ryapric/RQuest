#' Attack
#'
#' This function causes HP damage to another [Actor]-class instance. The damage
#' dealt is relative to the attacker's Strength parameter, `str` (specifically:
#' Damage = (5 * str)).
#'
#' @param attacker [Actor]-class or subclass instance that is attacking
#' @param target [Actor]-class or subclass that is the target of the attack
attack_ <- function(attacker, target) {
  dmg <- (attacker$params$str * 5)
  target$params$hp <- (target$params$hp - dmg)
  if (!testthat::is_testing()) {
    cat(sprintf("%s dealt %d damage to %s!\n", attacker$name, dmg, target$name))
    Sys.sleep(1)
    if (target$params$hp > 0) {
      cat(sprintf("%s has %d HP remaining\n", target$name, target$params$hp))
      Sys.sleep(1)
    } else {
      cat(sprintf("%s was defeated!\n", target$name))
      Sys.sleep(1)
    }
    update_hud(attacker)
  }
}

#' Heal
#'
#' This function restores HP to another [Actor]-class instance (or to self). The
#' HP restored is relative to the attacker's Magicka parameter, `mgk`
#' (specifically: HP restored = (5 * mgk)).
#'
#' @param caster [Actor]-class or subclass instance that is casting
#' @param target [Actor]-class or subclass that is the target of the cast
heal_ <- function(caster, target) {
  hp_healed <- (caster$params$mgk * 5)
  target$params$hp <- (target$params$hp + hp_healed)
  if (!testthat::is_testing()) {
    cat(sprintf("%s healed %s for %d!\n", caster$name, target$name, hp_healed))
    Sys.sleep(1)
    cat(sprintf("%s has %d HP left\n", target$name, target$params$hp))
    Sys.sleep(1)
    update_hud(caster)
  }
}

#' Restore MP to Target
#'
#' Restore MP to target through concentration. Costs no MP to use, but drains 5%
#' of max health from caster. The MP restored is relative to the attacker's
#' Magicka parameter, `mgk` (specifically: MP restored = (2 * mgk)).
restore_mp_ <- function(caster, target) {
  mp_restored <- (caster$params$mgk * 2)
  hp_cost <- floor(caster$params$hp_max * 0.05)
  target$params$mp <- (target$params$mp + mp_restored)
  caster$params$hp <- (target$params$hp - hp_cost)
  if (!testthat::is_testing()) {
    cat(sprintf("%s spent %d HP, and restored %d MP to %s!\n",
                caster$name, hp_cost, mp_restored, target$name))
    Sys.sleep(1)
    cat(sprintf("%s has %d MP left\n", target$name, target$params$mp))
    cat(sprintf("%s has %d HP left\n", caster$name, caster$params$hp))
    Sys.sleep(1)
    update_hud(caster)
  }
}



#' Update HUD
#'
#' @param actor R6 [Actor] subclass.
update_hud <- function(actor) {
  barplot(
    unlist(actor$params[c("hp", "mp")]),
    main = sprintf("%s, %s", actor$name, actor$actor_job),
    ylim = c(0, max(actor$params$hp_max, actor$params$mp_max)),
    names.arg = c("HP", "MP"),
    col = c("lightgreen", "cyan")
  )
}
