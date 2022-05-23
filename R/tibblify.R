#' @import tibble
#' @import tibblify
NULL

write_spec <- function(x) {
    name <- deparse(substitute(x))

    out <-
        x %>%
        format() %>%
        fansi::strip_sgr()

    base_name <- gsub("^spec_", "", name)
    stopifnot(base_name != name)

    out <- paste0("spec_", base_name, " <- ", out)
    out <- gsub("  ", "    ", out, fixed = TRUE)

    out <- gsub('tib_int("id")', 'tib_chr("id", transform = as.character)', out, fixed = TRUE)
    out <- gsub('tib_int("id", default = NA_integer_', 'tib_chr("id", transform = as.character, default = NA_character_', out, fixed = TRUE)

    out <- gsub('tib_chr("orderindex")', 'tib_int("orderindex", transform = as.integer)', out, fixed = TRUE)

    date_cols <- "last_active|date_joined|date_invited|start_date|end_date|due_date|start|end|date_created|date_updated|date_closed|at"
    out <- gsub(paste0('tib_chr[(]"(', date_cols, ')", default = NA_character_'), 'tib_scalar("\\1", ptype = vctrs::new_datetime(), transform = cu_date_from, default = dttr2::NA_POSIXct_', out)
    out <- gsub(paste0('tib_chr[(]"(', date_cols, ')"'), 'tib_scalar("\\1", ptype = vctrs::new_datetime(), transform = cu_date_from', out)

    out <- gsub('tib_chr("duration", required = FALSE)', 'tib_scalar("duration", hms::new_hms(), default = dttr2::NA_hms_, transform = ~ hms::as_hms(as.numeric(.x) / 1000))', out, fixed = TRUE)

    # Dogfood first
    eval(parse(text = out))

    writeLines(out, file.path("R", paste0("spec-", base_name, ".R")))
}
