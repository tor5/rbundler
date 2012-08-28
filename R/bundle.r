#' Bundles a package's dependencies for development workflows.
#'
#' Dependencies are installed into the package's bundle library. 
#' @param pkg package description, can be path or package name.
#' @param lib library in which to install the package and it's dependencies.
#' @param repos character vector, the base URLs of the repositories to use,
#'        e.g., the URL of a CRAN mirror such as
#'        '"http://cran.us.r-project.org"'.
#'
#'        Can be 'NULL' to install from local files (with extension
#'        '.tar.gz' for source packages).
#' @importFrom devtools install
#' @export
#' @examples
#' 
#' # From within the package root, run 'bundle' to instll the package, along with it's dependencies:
#' bundle(system.file(package='rbundler', 'tests', 'no-dependencies'))
#' bundle(system.file(package='rbundler', 'tests', 'simple-dependencies'))
bundle <- function(pkg='.', lib=file.path(pkg, '.Rbundle'), repos = getOption("repos")) {

  dir.create(lib, recursive=TRUE, showWarnings = FALSE)
  .libPaths(lib)

  message("Bundling package ", pkg, " dependencies into library ", lib)
  install(pkg)

  invisible()

}
