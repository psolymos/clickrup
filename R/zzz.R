.onAttach <- function(libname, pkgname) {
    ver <- read.dcf(file=system.file("DESCRIPTION", package=pkgname),
                    fields=c("Version", "Date"))
    packageStartupMessage(paste(pkgname, ver[1], "\t", ver[2]))
    invisible(NULL)
}

.onLoad <- function(libname, pkgname) {
    if (is.null(getOption("cu_options")))
        options("cu_options" = list(
            baseurl = "https://api.clickup.com", # API url
            version = "v2",                      # API version
            tz = "",                             # time zone for unix dates
            useragent = "http://github.com/psolymos/clickrup"
        ))
    invisible(NULL)
}

.onUnload <- function(libpath) {
    options("cu_options" = NULL)
    invisible(NULL)
}
