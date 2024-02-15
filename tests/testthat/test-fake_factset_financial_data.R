test_that("default output is 1-row 7-col tibble", {
  out <- fake_factset_financial_data()
  expect_equal(nrow(out), 1L)
  expect_equal(ncol(out), 7L)
  expect_true(inherits(out, "tbl_out") || inherits(out, "tbl"))
})

test_that("handles input args as expected", {
  out <- fake_factset_financial_data(
    fsym_id = "AAPL",
    isin = "US0378331005",
    factset_entity_id = "111111",
    adj_price = 150.25,
    adj_shares_outstanding = 1000000,
    issue_type = "EQ",
    one_adr_eq = 1
  )

  expect_equal(ncol(out), 7)
  expect_equal(nrow(out), 1)
  expect_equal(out$fsym_id, "AAPL")
  expect_equal(out$isin, "US0378331005")
  expect_equal(out$factset_entity_id, "111111")
  expect_equal(out$adj_price, 150.25)
  expect_equal(out$adj_shares_outstanding, 1000000)
  expect_equal(out$issue_type, "EQ")
  expect_equal(out$one_adr_eq, 1)
})

test_that("handles input args as expected when not all args set", {

  # Test case 3: Test with missing values
  out <- fake_factset_financial_data(
    fsym_id = "AAPL",
    adj_price = 150.25,
    adj_shares_outstanding = 1000000
  )

  expect_equal(ncol(out), 7)
  expect_equal(nrow(out), 1)
  expect_equal(out$fsym_id, "AAPL")
  expect_equal(out$adj_price, 150.25)
  expect_equal(out$adj_shares_outstanding, 1000000)
  # Expecting default values for missing arguments
  expect_equal(out$isin, default_values$isin)
  expect_equal(out$factset_entity_id, default_values$factset_entity_id)
  expect_equal(out$issue_type, default_values$issue_type)
  expect_equal(out$one_adr_eq, default_values$one_adr_eq)
})

test_that("default output has expected names", {
  out <- fake_factset_financial_data()

  names <- names(out)
  expected_names <- c(
    "fsym_id",
    "isin",
    "factset_entity_id",
    "adj_price",
    "adj_shares_outstanding",
    "issue_type",
    "one_adr_eq"
  )

  expect_identical(sort(names), sort(expected_names))

})

test_that("default output has expected values", {
  out <- fake_factset_financial_data()

  for (name in names(out)) {
    expect_equal(out[[!!name]], default_values[[!!name]])
  }
})

test_that("with bad data, errors informatively", {

  args <- c(
    "fsym_id",
    "isin",
    "factset_entity_id",
    "adj_price",
    "adj_shares_outstanding",
    "issue_type",
    "one_adr_eq"
  )

  expect_error(fake_factset_financial_data(fsym_id = FALSE))
  expect_error(fake_factset_financial_data(isin = FALSE))
  expect_error(fake_factset_financial_data(factset_entity_id = FALSE))
  expect_error(fake_factset_financial_data(adj_price = "not a price"))
  expect_error(fake_factset_financial_data(adj_shares_outstanding = "not a share"))
  expect_error(fake_factset_financial_data(issue_type = FALSE))
  expect_error(fake_factset_financial_data(one_adr_eq = "not a number"))

})
