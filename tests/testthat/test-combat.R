context("Combat functions work as intended")

test_that("attack_() deals damage as a function", {
  player <- Actor$new("Steve", "warrior")
  villain <- Actor$new("Grunt", "rogue")
  hp_0 <- villain$params$hp
  attack_(player, villain)
  expect_equal(villain$params$hp,
               hp_0 - (player$params$str * 5))
})

test_that("attack() deals damage as a method", {
  player <- Actor$new("Steve", "warrior")
  villain <- Actor$new("Grunt", "rogue")
  hp_0 <- villain$params$hp
  player$attack(villain)
  expect_equal(villain$params$hp,
               hp_0 - (player$params$str * 5))
})



test_that("heal_() restores HP as a function", {

  warrior <- Actor$new("Steve", "warrior")
  mage <- Actor$new("Ix", "mage")
  hp_warrior_0 <- warrior$params$hp
  hp_mage_0 <- mage$params$hp

  heal_(warrior, warrior)
  heal_(mage, mage)

  expect_equal(warrior$params$hp,
               hp_warrior_0 + (warrior$params$mgk * 5))
  expect_equal(mage$params$hp,
               hp_mage_0 + (mage$params$mgk * 5))
})

test_that("heal() restores HP as a method", {

  warrior <- Actor$new("Steve", "warrior")
  mage <- Actor$new("Ix", "mage")
  hp_warrior_0 <- warrior$params$hp
  hp_mage_0 <- mage$params$hp

  warrior$heal(warrior)
  mage$heal(mage)

  expect_equal(warrior$params$hp,
               hp_warrior_0 + (warrior$params$mgk * 5))
  expect_equal(mage$params$hp,
               hp_mage_0 + (mage$params$mgk * 5))
})



test_that("restore_mp_() restores MP/drains HP as a function", {

  warrior <- Actor$new("Steve", "warrior")
  mage <- Actor$new("Ix", "mage")

  mp_warrior_0 <- warrior$params$mp
  mp_mage_0 <- mage$params$mp

  restore_mp_(warrior, warrior)
  restore_mp_(mage, mage)

  expect_equal(warrior$params$hp, floor(warrior$params$hp * 0.95))
  expect_equal(warrior$params$mp, mp_warrior_0 + (warrior$params$mgk * 2))
  expect_equal(mage$params$hp, floor(mage$params$hp * 0.95))
  expect_equal(mage$params$mp, mp_mage_0 + (mage$params$mgk * 2))
})

test_that("restore_mp() restores MP/drains HP as a method", {

  warrior <- Actor$new("Steve", "warrior")
  mage <- Actor$new("Ix", "mage")

  mp_warrior_0 <- warrior$params$mp
  mp_mage_0 <- mage$params$mp

  warrior$restore_mp(warrior)
  mage$restore_mp(mage)

  expect_equal(warrior$params$hp, floor(warrior$params$hp * 0.95))
  expect_equal(warrior$params$mp, mp_warrior_0 + (warrior$params$mgk * 2))
  expect_equal(mage$params$hp, floor(mage$params$hp * 0.95))
  expect_equal(mage$params$mp, mp_mage_0 + (mage$params$mgk * 2))
})
