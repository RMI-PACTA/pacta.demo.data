default_values <- list(
  adj_price = 12.34567,
  adj_shares_outstanding = 1234567890,
  factset_entity_id = "1234A5-B",
  fsym_id = "A12345-B",
  isin = "AB123CD4E567",
  issue_type = "EQ",
  # Note: `one_adr_eq` typically has values of 1, 0.25, 0.33, and other fractions
  one_adr_eq = 1/4
)

if_arg_exists_check_valid_type <- function(arg, fun) {
  if (!is.null(arg)) fun(arg) else TRUE
}

`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}
