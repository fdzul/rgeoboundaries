#' @importFrom sf st_read
#' @noRd
.read_gb <- function(path, quiet = TRUE, options) {
  if (length(path) >= 2) {
      l <- lapply(seq_along(path), function(i)
        st_read(path[i], quiet = quiet, options = options))
      res <- do.call(rbind, l)
  } else {
      res <- st_read(path, quiet = quiet, options = options)
  }
  res
}

#' @noRd
#' @importFrom memoise memoise
read_gb <- memoise(.read_gb)

#' Get the administrative boundaries of selected countries
#'
#' Access country boundaries at a specified administrative level
#'
#' @rdname geoboundaries
#' @param country characher; a vector of country names or country ISO3. If NULL all countries will be used
#'  for adm0, adm1, adm2 where the administrative level are available
#' @param adm_lvl characher; administrative level, adm0, adm1, adm2, adm3, adm4 or adm5. adm0 being the country boundary. 0, 1, 2, 3, 4 or 5 can also be used.
#' @param type character; defaults to HPSCU. One of HPSCU, HPSCGS, SSCGS, SSCU or CGAZ.
#'  Determines the type of boundary link you receive. More on details
#' @param version character; defaults to the most recent version of geoBoundaries available.
#'  The geoboundaries version requested, with underscores. For example, 3_0_0 would return data
#'  from version 3.0.0 of geoBoundaries.
#' @param quiet logical; if TRUE no message while downloading and reading the data. Default to FALSE
#'
#' @details
#' Different types to of boundaries available:
#'
#' * HPSCU - High Precision Single Country Unstadardized. The premier geoBoundaries release,
#'   representing the highest precision files available for every country in the world.
#'   No standardization is performed on these files, so (for example) two countries
#'   may overlap in the case of contested boundaries.
#'
#' * HPSCGS - High Precision Single Country Globally Standardized. A version of geoBoundaries
#'   high precision data that has been clipped to the U.S. Department of State boundary file,
#'   ensuring no contested boundaries or overlap in the dataset. This globally standardized
#'   product may have gaps between countries. If you need a product with no gaps,
#'   we recommend our simplified global product.
#'
#' * SSCU - Simplified Single Country Unstandardized. A simplified version of every file
#'   available for every country in the world. No standardization is performed on these files,
#'   so (for example) two countries may overlap in the case of contested boundaries.
#'
#' * SSCGS - Simplified Single Country Globally Standardized. A version of geoBoundaries
#'   simplified data that has been clipped to the U.S. Department of State boundary file,
#'   ensuring no contested boundaries or overlap in the dataset.
#'   This globally standardized product may have gaps between countries.
#'
#' The following wrappers are also available:
#'
#' * `gb_adm0` returns the country boundaries
#' * `gb_adm1` if available, returns the country first administrative level boundaries
#' * `gb_adm2` if available, returns the country second administrative level boundaries
#' * `gb_adm3` if available, returns the country third administrative level boundaries
#' * `gb_adm4` if available, returns the country fourth administrative level boundaries
#' * `gb_adm5` if available, returns the country first administrative level boundaries
#'
#' @references
#' Runfola D, Anderson A, Baier H, Crittenden M, Dowker E, Fuhrig S, et al. (2020)
#' geoBoundaries: A global database of political administrative boundaries.
#' PLoS ONE 15(4): e0231866. https://doi.org/10.1371/journal.pone.0231866
#'
#' @return a `sf` object
#'
#' @export
geoboundaries <- function(country = NULL, adm_lvl = "adm0",
                          type = NULL, version = NULL, quiet = TRUE) {
  if (is.null(country) || (!is.null(type) && tolower(type) == "cgaz")) {
    path <- get_cgaz_shp_link(adm_lvl, quiet = quiet)
    res <- read_gb(path, quiet = quiet, options = NULL)
  } else {
    links <- get_zip_links(country = country,
                           adm_lvl = adm_lvl,
                           type = type,
                           version = version)
    shps <- get_shp_from_links(links)
    path <- paste0("/vsizip/", shps)
    #andys temporary patch to fix encoding differences in geoboundaries
    encoding  <-  "WINDOWS-1252"
    if (!is.null(type) && tolower(type) != "hpscu")
      encoding <- "UTF-8"
    res <- read_gb(path, quiet = quiet, options = paste0("ENCODING=",encoding) )
  }
  res
}


#' @rdname geoboundaries
#' @export
gb_adm0 <- function(country = NULL, type = NULL, version = NULL,  quiet = TRUE)
  geoboundaries(country = country,
                adm_lvl = "adm0",
                type = type,
                version = version,
                quiet = quiet)

#' @rdname geoboundaries
#' @export
gb_adm1 <- function(country = NULL, type = NULL, version = NULL, quiet = TRUE)
  geoboundaries(country = country,
                adm_lvl = "adm1",
                type = type,
                version = version,
                quiet = quiet)

#' @rdname geoboundaries
#' @export
gb_adm2 <- function(country = NULL, type = NULL, version = NULL, quiet = TRUE)
  geoboundaries(country = country,
                adm_lvl = "adm2",
                type = type,
                version = version,
                quiet = quiet)

#' @rdname geoboundaries
#' @export
gb_adm3 <- function(country, type = NULL, version = NULL, quiet = TRUE)
  geoboundaries(country = country,
                adm_lvl = "adm3",
                type = type,
                version = version,
                quiet = quiet)

#' @rdname geoboundaries
#' @export
gb_adm4 <- function(country, type = NULL, version = NULL, quiet = TRUE)
  geoboundaries(country = country,
                adm_lvl = "adm4",
                type = type,
                version = version,
                quiet = quiet)

#' @rdname geoboundaries
#' @export
gb_adm5 <- function(country, type = NULL, version = NULL, quiet = TRUE)
  geoboundaries(country = country,
                adm_lvl = "adm5",
                type = type,
                version = version,
                quiet = quiet)
