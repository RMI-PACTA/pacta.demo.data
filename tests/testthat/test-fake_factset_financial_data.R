test_that("default output is 1-row tibble", {
  out <- fake_factset_financial_data()
  expect_equal(nrow(out), 1L)
  expect_true(inherits(out, "tbl_df") || inherits(out, "tbl"))

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
