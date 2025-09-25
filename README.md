# Lab3PonOlAroEn

<!-- badges: start -->
[![R-CMD-check](https://github.com/MaunsOlsson/Lab4AroEnPonOl/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/MaunsOlsson/Lab4AroEnPonOl/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of Lab3PonOlAroEn is to program an euclidean and dijkstra algorithm and make it into a R package.

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
library(Lab3PonOlAroEn)
## Showcase of euclidean(). This function finds the greatest common divisor between two whole numbers.
 euclidean(123612, 13892347912)

## Showcase of dijkstra(). This function finds the shortest path from one node to every other node in a weighted graph.
data(wiki_graph)
dijkstra(wiki_graph, 1)
```
