test_that("Output of Package functions are correct", {
  expect_is(eplR::eplData, "list")
  expect_is(eplR::getData(1213), "data.frame")
  expect_is(eplR::teamData(1213, "Man United"), "data.frame")
  expect_is(eplR::referee(1213), "data.frame")
  expect_is(eplR::teamPerformance(1213, "Man United"), "ggplot")
})

test_that("getData is extracting the correct data", {
  expect_equal(eplR::getData("0910"), eplData[[1]])
})

test_that("Check if Errors are working", {
  expect_error(eplR::getData(1214))
  expect_error(eplR::getData(1213, team = "Arsnl"))
  expect_error(eplR::teamData(1213, "Arsnl"))
  expect_error(eplR::teamPerformance(1213, "Arsnl"))
})
