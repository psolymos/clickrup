tib_custom <- function(key, transform, required = TRUE) {
    # https://github.com/mgirlich/tibblify/issues/183

    transform <- rlang::as_function(transform)
    ptype <- transform(character())

    tib_scalar(
      key,
      ptype,
      ptype_inner = character(),
      transform = transform,
      required = required
    )
}
