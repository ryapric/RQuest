context("R6 Actor Class instantiates correctly")

test_that("Warrior instantiates correctly", {
  warrior <- Actor$new("Wardog", "warrior")
  expect_equal(warrior$name, "Wardog")
  expect_equal(warrior$params, list(hp = 100, mp = 10, str = 10, skl = 3, mgk = 2))
})

test_that("Mage instantiates correctly", {
  mage <- Actor$new("Luke", "mage")
  expect_equal(mage$name, "Luke")
  expect_equal(mage$params, list(hp = 50, mp = 100, str = 1, skl = 3, mgk = 10))
})

test_that("Rogue instantiates correctly", {
  rogue <- Actor$new("Shade", "rogue")
  expect_equal(rogue$name, "Shade")
  expect_equal(rogue$params, list(hp = 60, mp = 40, str = 4, skl = 10, mgk = 4))
})
