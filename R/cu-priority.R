#' Turn ClickUp API priority scores to labels
#'
#' The ClickUp API returns priority values as integer scores.
#' The `cu_priority` function maps these scores to the priority labels
#' Urgent (1), High (2), Normal (3), Low (4).

#' @param score Character or numeric values between 1 and 4.
#'
#' @examples
#' cu_priority(c(1, 2, 3, 4))
#'
#' @return
#'
#' Returns a character vector with the labels.
#'
#' @export
#' @name cu-priority
cu_priority <- function(score) {
    p <- factor(as.character(score), c("1", "2", "3", "4"))
    levels(p) <- c("Urgent", "High", "Normal", "Low")
    as.character(p)
}
