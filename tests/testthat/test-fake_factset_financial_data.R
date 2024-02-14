test_that("by default, has expected names", {
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

test_that("by default, has expected values", {
  out <- fake_factset_financial_data()

  for (name in names(out)) {
    expect_equal(out[[!!name]], default_values[[!!name]])
  }
})
