default_values <- list(
  fsym_id = "A12345-B",
  isin = "AB123CD4E567",
  factset_entity_id = "1234A5-B",
  adj_price = 12.34567,
  adj_shares_outstanding = 1234567890,
  issue_type = "EQ",
  # one_adr_eq typically has values of 1, 0.25, 0.33, and other perfect fractions
  one_adr_eq = 1/4
)

`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}
