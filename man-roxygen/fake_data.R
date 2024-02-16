#' @section Fake data:
#' These funtions are developer-oriented. They all call [tibble()] so
#' you can expect all the goodies that come with that.
#' * `fake_foo` fakes a dataset with the name `foo`
#'
#' @section Params:
#' The arguments are the column names of the datasets being faked. They all have
#' a default and it can be overwritten.
#'
#' @section Pros and cons:
#' By default, these functions output a 1-row data-frame, which can be useful
#' for CI/CD. They also help you to avoid duplicating test code, and help
#' the reader of your code to focus on the one thing you want to test, instead
#' of burring that thing in the much longer code you need to create a fake
#' object from scratch. Since the default parameters are abstracted into
#' `utils.R`, it makes it easier to maintain coordination of values across a
#' variety of datasets.
#'
#' But `fake_*()` functions hide the explicit content. If the reader of your
#' code wants to inspect the data being tested, they need to jump to the
#' function definition or call them interactively.
