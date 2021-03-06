% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geoboundaries.R
\name{geoboundaries}
\alias{geoboundaries}
\alias{gb_adm0}
\alias{gb_adm1}
\alias{gb_adm2}
\alias{gb_adm3}
\alias{gb_adm4}
\alias{gb_adm5}
\title{Get the administrative boundaries of selected countries}
\usage{
geoboundaries(
  country = NULL,
  adm_lvl = "adm0",
  type = NULL,
  version = NULL,
  quiet = TRUE
)

gb_adm0(country = NULL, type = NULL, version = NULL, quiet = TRUE)

gb_adm1(country = NULL, type = NULL, version = NULL, quiet = TRUE)

gb_adm2(country = NULL, type = NULL, version = NULL, quiet = TRUE)

gb_adm3(country, type = NULL, version = NULL, quiet = TRUE)

gb_adm4(country, type = NULL, version = NULL, quiet = TRUE)

gb_adm5(country, type = NULL, version = NULL, quiet = TRUE)
}
\arguments{
\item{country}{characher; a vector of country names or country ISO3. If NULL all countries will be used
for adm0, adm1, adm2 where the administrative level are available}

\item{adm_lvl}{characher; administrative level, adm0, adm1, adm2, adm3, adm4 or adm5. adm0 being the country boundary. 0, 1, 2, 3, 4 or 5 can also be used.}

\item{type}{character; defaults to HPSCU. One of HPSCU, HPSCGS, SSCGS, SSCU or CGAZ.
Determines the type of boundary link you receive. More on details}

\item{version}{character; defaults to the most recent version of geoBoundaries available.
The geoboundaries version requested, with underscores. For example, 3_0_0 would return data
from version 3.0.0 of geoBoundaries.}

\item{quiet}{logical; if TRUE no message while downloading and reading the data. Default to FALSE}
}
\value{
a \code{sf} object
}
\description{
Access country boundaries at a specified administrative level
}
\details{
Different types to of boundaries available:
\itemize{
\item HPSCU - High Precision Single Country Unstadardized. The premier geoBoundaries release,
representing the highest precision files available for every country in the world.
No standardization is performed on these files, so (for example) two countries
may overlap in the case of contested boundaries.
\item HPSCGS - High Precision Single Country Globally Standardized. A version of geoBoundaries
high precision data that has been clipped to the U.S. Department of State boundary file,
ensuring no contested boundaries or overlap in the dataset. This globally standardized
product may have gaps between countries. If you need a product with no gaps,
we recommend our simplified global product.
\item SSCU - Simplified Single Country Unstandardized. A simplified version of every file
available for every country in the world. No standardization is performed on these files,
so (for example) two countries may overlap in the case of contested boundaries.
\item SSCGS - Simplified Single Country Globally Standardized. A version of geoBoundaries
simplified data that has been clipped to the U.S. Department of State boundary file,
ensuring no contested boundaries or overlap in the dataset.
This globally standardized product may have gaps between countries.
}

The following wrappers are also available:
\itemize{
\item \code{gb_adm0} returns the country boundaries
\item \code{gb_adm1} if available, returns the country first administrative level boundaries
\item \code{gb_adm2} if available, returns the country second administrative level boundaries
\item \code{gb_adm3} if available, returns the country third administrative level boundaries
\item \code{gb_adm4} if available, returns the country fourth administrative level boundaries
\item \code{gb_adm5} if available, returns the country first administrative level boundaries
}
}
\references{
Runfola D, Anderson A, Baier H, Crittenden M, Dowker E, Fuhrig S, et al. (2020)
geoBoundaries: A global database of political administrative boundaries.
PLoS ONE 15(4): e0231866. https://doi.org/10.1371/journal.pone.0231866
}
