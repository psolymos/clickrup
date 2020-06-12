.onAttach <- function(libname, pkgname){
    ver <- read.dcf(file=system.file("DESCRIPTION", package=pkgname),
                    fields=c("Version", "Date"))
    packageStartupMessage(paste(pkgname, ver[1], "\t", ver[2]))
    if (is.null(getOption("cu_options")))
        options("cu_options" = list(
            baseurl = "https://api.clickup.com",
            version = "v2"))
    invisible(NULL)
}

.onUnload <- function(libpath){
    options("cu_options" = NULL)
    invisible(NULL)
}
