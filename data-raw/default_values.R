# These values are manually defined, and set the default values used by any
# fake dataset. This is useful to co-ordinate defaults across a variety of
# datasets (e.g. to ensure that the `ISIN` always matches).

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

usethis::use_data(default_values, overwrite = TRUE, internal = TRUE)
