#----------------------------------------------------------------
context("Test that ... give a brief description of the contents")
#----------------------------------------------------------------
library("name of library to test")
library("depends of library to test")
#----------------------------------------------------------------
test_that("name of test 1", {
  # expect_*(function(arg1, arg2), expection)
  skip_on_cran()  # run only locally and skip on cran
  expect_equal()  # prefer over using expect_identical()
  expect_identical()  # use with care!!!
  expect_match()
  expect_output()
  expect_message()
  expect_warning()
  expect_error()
  expect_is()  # to test inheritance
  expect_true()
  expect_false()
  expect_equal_to_reference()
})
#----------------------------------------------------------------
# Clean up after test if used:
# creating/deleting files
# changing the working directory
# changing the R environment using
# - library()
# - require()
# - attach()
# - options()
# - par()
# etc.
#----------------------------------------------------------------
# EOF .

