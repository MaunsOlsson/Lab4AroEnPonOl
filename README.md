# Lab3PonOlAroEn

<!-- badges: start -->
[![R-CMD-check](https://github.com/MaunsOlsson/Lab4AroEnPonOl/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/MaunsOlsson/Lab4AroEnPonOl/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of Lab4AroEnPonOl is to program a linear regression object with QR decompisition and make it an S3 object.

## Installation

To install the package run the following code:

``` r
# install.packages("devtools")
devtools::install_github("MaunsOlsson/Lab4AroEnPonOl", build_vignettes = TRUE)
library(Lab4AroEnPonOl)
```

## Example

Here is a short showcase of the functions
``` r
library(Lab4AroEnPonOl)

model <- linreg(formula = Sepal.Length ~ Sepal.Width + Petal.Length, data = iris[-c(1:5), ])

summary(model)
plot(model)
predict(model, iris[1:3, ])
```
