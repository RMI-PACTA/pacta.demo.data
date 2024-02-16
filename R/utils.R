if_arg_exists_check_valid_type <- function(arg, fun) {
  if (!is.null(arg)) fun(arg) else TRUE
}

`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}
