
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rgeoboundaries

<!-- badges: start -->

[![Project Status: Active - Initial development is in progress, but
there has not yet been a stable, usable release suitable for the
public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![GitLab CI Build
Status](https://gitlab.com/dickoa/rgeoboundaries/badges/master/pipeline.svg)](https://gitlab.com/dickoa/rgeoboundaries/pipelines)
[![CRAN
status](https://www.r-pkg.org/badges/version/rgeoboundaries)](https://cran.r-project.org/package=rgeoboundaries)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

`rgeoboundaries` is an R client for the [GeoBoundaries
API](https://www.geoboundaries.org/)

<!-- badges: end -->

## Installation

You can install the development version of rgeoboundaries using the
`remotes` package:

``` r
# install.packages("remotes")
remotes::install_gitlab("dickoa/rgeoboundaries")
```

## Access administrative boundaries using rgeoboundaries

This is a basic example which shows you how get Senegal administrative
level 3 boundaries and plot it

``` r
library(rgeoboundaries)
library(sf)
#> Linking to GEOS 3.8.0, GDAL 3.0.4, PROJ 6.3.1
sen_adm3 <- geoboundaries("sen", "adm3")
plot(st_geometry(sen_adm3))
```

<img src="man/figures/README-example-1.png" width="100%" />