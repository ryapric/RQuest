context("R6 Actor Class instantiates correctly")

test_that("roll_actor() populates expected params for each class", {
  warrior <- roll_actor("warrior")
  expect_equal(warrior, list(hp = 100, mp = 10, str = 10, skl = 3, mgk = 2))

  mage <- roll_actor("mage")
  expect_equal(mage, list(hp = 50, mp = 100, str = 1, skl = 3, mgk = 10))

  rogue <- roll_actor("rogue")
  expect_equal(rogue, list(hp = 60, mp = 40, str = 4, skl = 10, mgk = 4))
})

test_that("Warrior instantiates correctly", {
  warrior <- Actor$new("Wardog", "warrior")
  expect_equal(warrior$name, "Wardog")
  expect_equal(warrior$actor_job, "warrior")
  expect_equal(warrior$level, 1L)
  expect_equal(warrior$params, roll_actor("warrior"))
})

test_that("Mage instantiates correctly", {
  mage <- Actor$new("Luke", "mage")
  expect_equal(mage$name, "Luke")
  expect_equal(mage$actor_job, "mage")
  expect_equal(mage$level, 1L)
  expect_equal(mage$params, roll_actor("mage"))
})

test_that("Rogue instantiates correctly", {
  rogue <- Actor$new("Shade", "rogue")
  expect_equal(rogue$name, "Shade")
  expect_equal(rogue$actor_job, "rogue")
  expect_equal(rogue$level, 1L)
  expect_equal(rogue$params, roll_actor("rogue"))
})



context("R6 Player Class instantiates correctly")

test_that("Warrior instantiates correctly", {
  warrior <- Player$new("Wardog", "warrior")
  warrior_roll <- lapply(roll_actor("warrior"), `*`, 2)
  warrior_roll$hp_max <- warrior_roll$hp
  warrior_roll$mp_max <- warrior_roll$mp
  expect_equal(warrior$params, warrior_roll)
})

test_that("Mage instantiates correctly", {
  mage <- Player$new("Luke", "mage")
  mage_roll <- lapply(roll_actor("mage"), `*`, 2)
  mage_roll$hp_max <- mage_roll$hp
  mage_roll$mp_max <- mage_roll$mp
  expect_equal(mage$params, mage_roll)
})

test_that("Rogue instantiates correctly", {
  rogue <- Player$new("Shade", "rogue")
  rogue_roll <- lapply(roll_actor("rogue"), `*`, 2)
  rogue_roll$hp_max <- rogue_roll$hp
  rogue_roll$mp_max <- rogue_roll$mp
  expect_equal(rogue$params, rogue_roll)
})
