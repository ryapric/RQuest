context("Combat functions work as intended")

test_that("attack() deals damage as a function", {
  player <- Actor$new("Steve", "warrior")
  villain <- Actor$new("Grunt", "rogue")
  hp_0 <- villain$params$hp
  attack(player, villain)
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

test_that("heal() restores HP as a function", {

  warrior <- Actor$new("Steve", "warrior")
  mage <- Actor$new("Ix", "mage")
  hp_warrior_0 <- warrior$params$hp
  hp_mage_0 <- mage$params$hp

  heal(warrior, warrior)
  heal(mage, mage)

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
