
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sr

<!-- badges: start -->
<!-- badges: end -->

Smooth Regression is a set of techniques for finding causal
relationships in precision data. It is built around the Gamma test. If
you have some measurements that might be predictive, and a target that
you want to predict, Gamma estimates the mean squared error of the best
smooth model that could be built on that data. In linear regression, the
intercept coefficient tells you the expected error of the model. Gamma
does this for smooth models as a class. It measures smoothness in a data
relationship. Smoothness is a property of natural causal processes.
Natural processes differ from noise because they are smooth, and noise
is not. Neural networks are smooth models, as are differential equations
whose derivatives don’t become infinite. Gamma is a mathematically
principled answer to the overtraining problem in machine learning.

In order to detect smoothness, Gamma needs precision data. For category
and small integer data, you should use traditional methods - traditional
statistics is very good at category problems. Gamma works on continuous
data. In practice this means that values should range across two or more
full digits precision in all of your variables. .

Gamma can find causal relationships, including lags and embeddings for
time series models. It can also be used to tune the performance of
neural networks. This package, ‘sr’, provides the Gamma test along with
a toolkit of search techniques that use it.

## Installation

You can install the development version of sr like so:

``` r
#  devtools::install_github("haythorn/sr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(sr)
library(nnet)

x <- embed(as.matrix(henon_x), 3)
p <- x[ ,2:3]
t <- x[ ,1]

# train neural net to mean squared error determined by Gamma
sum_squares <- gamma_test(p, t)$Gamma * length(t)
gamma_model <- nnet(x = p, y = t, size = 8, rang = 0.1,
                decay = 1e-5, maxit = 2000, abstol =  sum_squares)
#> # weights:  33
#> initial  value 1034.881451 
#> iter  10 value 751.258679
#> iter  20 value 711.869753
#> iter  30 value 711.721847
#> iter  40 value 710.892295
#> iter  50 value 707.704292
#> iter  60 value 688.272359
#> iter  70 value 615.199349
#> iter  80 value 614.328401
#> iter  90 value 611.509094
#> iter 100 value 606.283536
#> iter 110 value 604.937903
#> iter 120 value 604.485511
#> iter 130 value 519.749721
#> iter 140 value 437.144566
#> iter 150 value 434.300257
#> iter 160 value 433.611882
#> iter 170 value 432.600940
#> iter 180 value 432.074881
#> iter 190 value 429.864196
#> iter 200 value 429.037167
#> iter 210 value 428.676007
#> iter 220 value 426.011318
#> iter 230 value 423.515423
#> iter 240 value 421.530096
#> iter 250 value 419.246946
#> iter 260 value 418.543754
#> iter 270 value 417.716431
#> iter 280 value 416.541021
#> iter 290 value 416.251069
#> iter 300 value 415.879573
#> iter 310 value 415.362378
#> iter 320 value 414.842513
#> iter 330 value 414.433586
#> iter 340 value 414.073452
#> iter 350 value 413.769447
#> iter 360 value 413.693869
#> iter 370 value 413.628286
#> iter 380 value 413.591832
#> iter 390 value 413.525018
#> iter 400 value 413.516903
#> iter 410 value 413.490707
#> iter 420 value 413.473607
#> iter 430 value 413.457279
#> iter 440 value 413.435955
#> iter 450 value 413.417531
#> iter 460 value 413.406455
#> iter 470 value 413.400204
#> iter 480 value 413.384476
#> iter 490 value 413.369038
#> iter 500 value 413.341226
#> iter 510 value 413.336075
#> iter 520 value 413.316252
#> iter 530 value 413.301062
#> iter 540 value 413.292216
#> iter 550 value 413.288085
#> iter 560 value 413.285367
#> iter 570 value 413.283824
#> iter 580 value 413.264843
#> iter 590 value 413.226454
#> final  value 413.226310 
#> converged
```
