paths <- dir("script", pattern = "^tibblify-[0-9]", full.names = TRUE)

purrr::walk(paths, source, echo = TRUE)
