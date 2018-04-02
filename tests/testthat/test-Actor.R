context("R6 Actor Class instantiates correctly")

test_that("Warrior class instantiates correctly", {
  warrior <- Actor$new("Wardog", "warrior")
  expect_equal(warrior$name, "Wardog")
  expect_equal(warrior$params, list(hp = 100, mp = 10, str = 10, skl = 3))
})

test_that("Mage class instantiates correctly", {
  mage <- Actor$new("Luke", "mage")
  expect_equal(mage$name, "Luke")
  expect_equal(mage$params, list(hp = 50, mp = 100, str = 1, skl = 3))
})

test_that("Rogue class instantiates correctly", {
  rogue <- Actor$new("Shade", "rogue")
  expect_equal(rogue$name, "Shade")
  expect_equal(rogue$params, list(hp = 60, mp = 40, str = 4, skl = 10))
})
