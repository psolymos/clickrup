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
    out <- gsub("  ", "    ", out, fixed = TRUE)
    out <- gsub('lcol_int("id")', 'lcol_chr("id")', out, fixed = TRUE)
    out <- gsub('lcol_int("id", .default = NA_integer_', 'lcol_chr("id", .default = NA_character_', out, fixed = TRUE)

    # Dogfood first
    eval(parse(text = out))

    writeLines(out, file.path("R", paste0("spec-", base_name, ".R")))
}
