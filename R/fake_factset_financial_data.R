#' Minimal fake `factset_financial_data` dataset that allow overwriting values
#'
#' @template fake_data
#'
#' @return A data.frame
#' @export
#'
#' @examples
#' fake_factset_financial_data()
#'
#' fake_factset_financial_data(isin = "US0123456789")
fake_factset_financial_data <- function(fsym_id = NULL,
                                        isin = NULL,
                                        factset_entity_id = NULL,
                                        adj_price = NULL,
                                        adj_shares_outstanding = NULL,
                                        issue_type = NULL,
                                        one_adr_eq = NULL,
                                        ...) {
  stopifnot(
    if_arg_exists_check_valid_type(fsym_id, is.character),
    if_arg_exists_check_valid_type(isin, is.character),
    if_arg_exists_check_valid_type(factset_entity_id, is.character),
    if_arg_exists_check_valid_type(adj_price, is.numeric),
    if_arg_exists_check_valid_type(adj_shares_outstanding, is.numeric),
    if_arg_exists_check_valid_type(issue_type, is.character),
    if_arg_exists_check_valid_type(one_adr_eq, is.numeric)
  )

    tibble::tibble(
    fsym_id = fsym_id %||% default_values[["fsym_id"]],
    isin = isin %||% default_values[["isin"]],
    factset_entity_id =
      factset_entity_id %||% default_values[["factset_entity_id"]],
    adj_price = adj_price %||% default_values[["adj_price"]],
    adj_shares_outstanding =
      adj_shares_outstanding %||% default_values[["adj_shares_outstanding"]],
    issue_type = issue_type %||% default_values[["issue_type"]],
    one_adr_eq = one_adr_eq %||% default_values[["one_adr_eq"]],
    ...
  )
}

if_arg_exists_check_valid_type <- function(arg, fun) {
  if (!is.null(arg)) fun(arg) else TRUE
}
