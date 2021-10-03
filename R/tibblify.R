#' @import tibble
#' @import tibblify
NULL

write_spec <- function(x) {
    name <- deparse(substitute(x))

    out <-
        x %>%
        get_spec() %>%
        format() %>%
        fansi::strip_sgr()

    base_name <- gsub("^df_", "", name)

    out <- paste0("spec_", base_name, " <- ", out)
    out <- gsub("  ", "    ", out)

    writeLines(out, file.path("R", paste0("spec-", base_name, ".R")))
}
