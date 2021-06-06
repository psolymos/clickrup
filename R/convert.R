deep_as_tibble <- function(df) {
    if (is.data.frame(df)) return(cu_as_tibble(df))
    if (!is.list(df)) return(df)

    lapply(df, deep_as_tibble_cols)
}

deep_as_tibble_cols <- function(df) {
    if (!is.data.frame(df)) return(df)

    is_list <- vapply(df, is.list, logical(1))
    df[is_list] <- lapply(df[is_list], deep_as_tibble)

    cu_as_tibble(df)
}

cu_as_tibble <- function(df) {
    is_df <- vapply(df, is.data.frame, logical(1))
    df[is_df] <- lapply(df[is_df], deep_as_tibble)

    if ("id" %in% names(df)) {
        df$id <- pillar::char(as.character(df$id), min_chars = Inf)
    }

    tibble::as_tibble(df)
}
