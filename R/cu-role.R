#' Turn ClickUp API role to meaningful label
#'
#' The ClickUp API returns role as integer.
#' The `cu_role` function maps these scores to the priority labels
#' Owner (1), Admin (2), Member (3), Guest (4).

#' @param role Character or numeric values between 1 and 4.
#'
#' @examples
#' cu_role(c(1, 2, 3, 4))
#'
#' @return
#'
#' Returns a character vector with the labels.
#'
#' @export
#' @name cu-role
cu_role <- function(role) {
    p <- factor(as.character(score), c("1", "2", "3", "4"))
    levels(p) <- c("Owner", "Admin", "Member", "Guest")
    as.character(p)
}
