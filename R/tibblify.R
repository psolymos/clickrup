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

    out <- gsub('lcol_int("id")', 'lcol_chr("id", .parser = as.character)', out, fixed = TRUE)
    out <- gsub('lcol_int("id", .default = NA_integer_', 'lcol_chr("id", .parser = as.character, .default = NA_character_', out, fixed = TRUE)

    out <- gsub('lcol_chr("orderindex")', 'lcol_int("orderindex", .parser = as.integer)', out, fixed = TRUE)

    date_cols <- "last_active|date_joined|date_invited|start_date|end_date|due_date|start|end|date_created|date_updated|date_closed|at"
    out <- gsub(paste0('lcol_chr[(]"(', date_cols, ')", .default = NA_character_'), 'lcol_dtt("\\1", .parser = cu_date_from, .default = dttr2::NA_POSIXct_', out)
    out <- gsub(paste0('lcol_chr[(]"(', date_cols, ')"'), 'lcol_dtt("\\1", .parser = cu_date_from', out)

    out <- gsub('lcol_chr("duration", .default = NA_character_)', 'lcol_vec("duration", hms::new_hms(), .default = dttr2::NA_hms_, .parser = ~ hms::as_hms(as.numeric(.x) / 1000))', out, fixed = TRUE)

    # Dogfood first
    eval(parse(text = out))

    writeLines(out, file.path("R", paste0("spec-", base_name, ".R")))
}
