
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
principled answer to the over-training problem in machine learning.

In order to detect smoothness, Gamma needs precision data. For category
and small integer data, you should use traditional methods - traditional
statistics is very good at category problems. Gamma works on continuous
data. In practice this means that values should range across two or more
full digits precision in all of your variables. .

Gamma finds causal relationships including lags and embeddings for time
series models. It can also be used to tune the performance of neural
networks. This package, `sr`, provides the Gamma test along with a
toolkit of search techniques that use it.

## Installation

You can install the development version of sr like so:

``` r
#  devtools::install_github("haythorn/sr")
```

## Example

This example shows the Gamma test used to control the training of a
neural network, to get an optimally accurate model without
over-training. The example shows

- the creation of an embedding on a time series,
- division of the data into training and test subsets,
- calling `gamma_test` to get a target mean squared error,
- training and testing the neural net to that target, and
- displaying the results.

This example is explained in detail in the time_series vignette.

``` r
library(sr)
library(nnet)
library(ggplot2)


x <- embed(as.matrix(hs), 3)   #hs is a time series

target <- x[ ,1]
train_t <- target[1:600]
test_t <-  target[601:998]

predictors <- x[ ,2:3]
train_p <- predictors[1:600, ]
test_p  <- predictors[601:998, ]

# train a neural net, using Gamma to control the training
sum_squares <- gamma_test(train_p, train_t)$Gamma * length(t)

gamma_model <- nnet(x = train_p, y = train_t, size = 8, rang = 0.1,
                decay = 1e-5, maxit = 2000, abstol =  sum_squares)
#> # weights:  33
#> initial  value 48.559456 
#> iter  10 value 29.440132
#> iter  20 value 12.404944
#> iter  30 value 2.077920
#> iter  40 value 1.172431
#> iter  50 value 0.770926
#> iter  60 value 0.569788
#> iter  70 value 0.483637
#> iter  80 value 0.436249
#> iter  90 value 0.361866
#> iter 100 value 0.334604
#> iter 110 value 0.275237
#> iter 120 value 0.236301
#> iter 130 value 0.212829
#> iter 140 value 0.205245
#> iter 150 value 0.204015
#> iter 160 value 0.202191
#> iter 170 value 0.201227
#> iter 180 value 0.199052
#> iter 190 value 0.190113
#> iter 200 value 0.176313
#> iter 210 value 0.175317
#> iter 220 value 0.171320
#> iter 230 value 0.167891
#> iter 240 value 0.166249
#> iter 250 value 0.165433
#> iter 260 value 0.163647
#> iter 270 value 0.158859
#> iter 280 value 0.156169
#> iter 290 value 0.154193
#> iter 300 value 0.153750
#> iter 310 value 0.152027
#> iter 320 value 0.150277
#> iter 330 value 0.149549
#> iter 340 value 0.148616
#> iter 350 value 0.148325
#> iter 360 value 0.148155
#> iter 370 value 0.147542
#> iter 380 value 0.145754
#> iter 390 value 0.142749
#> iter 400 value 0.142181
#> iter 410 value 0.139956
#> iter 420 value 0.139549
#> iter 430 value 0.138711
#> iter 440 value 0.138292
#> iter 450 value 0.138073
#> iter 460 value 0.137666
#> iter 470 value 0.137365
#> iter 480 value 0.137296
#> iter 490 value 0.137207
#> iter 500 value 0.136659
#> iter 510 value 0.136258
#> iter 520 value 0.135895
#> iter 530 value 0.135760
#> iter 540 value 0.135380
#> iter 550 value 0.135304
#> iter 560 value 0.135177
#> iter 570 value 0.134952
#> iter 580 value 0.134468
#> iter 590 value 0.134271
#> iter 600 value 0.134189
#> iter 610 value 0.133882
#> iter 620 value 0.133718
#> iter 630 value 0.133570
#> iter 640 value 0.133467
#> iter 650 value 0.133191
#> iter 660 value 0.132806
#> iter 670 value 0.132752
#> iter 680 value 0.132575
#> iter 690 value 0.132544
#> iter 700 value 0.132512
#> iter 710 value 0.132389
#> iter 720 value 0.132315
#> iter 730 value 0.132140
#> iter 740 value 0.131904
#> iter 750 value 0.131825
#> iter 760 value 0.131783
#> iter 770 value 0.131551
#> iter 780 value 0.131343
#> iter 790 value 0.131298
#> iter 800 value 0.131190
#> iter 810 value 0.130821
#> iter 820 value 0.130758
#> iter 830 value 0.130684
#> iter 840 value 0.130611
#> iter 850 value 0.130371
#> iter 860 value 0.130314
#> iter 870 value 0.130246
#> iter 880 value 0.130162
#> iter 890 value 0.130147
#> iter 900 value 0.130068
#> iter 910 value 0.129963
#> iter 920 value 0.129887
#> iter 930 value 0.129677
#> iter 940 value 0.129487
#> iter 950 value 0.129381
#> iter 960 value 0.129241
#> iter 970 value 0.129070
#> iter 980 value 0.128818
#> iter 990 value 0.128412
#> iter1000 value 0.128150
#> iter1010 value 0.127801
#> iter1020 value 0.127378
#> iter1030 value 0.127139
#> iter1040 value 0.126114
#> iter1050 value 0.124849
#> iter1060 value 0.122319
#> iter1070 value 0.117406
#> iter1080 value 0.102833
#> iter1090 value 0.094130
#> iter1100 value 0.089083
#> iter1110 value 0.084900
#> iter1120 value 0.079122
#> iter1130 value 0.075182
#> iter1140 value 0.071498
#> iter1150 value 0.068491
#> iter1160 value 0.066598
#> iter1170 value 0.064367
#> iter1180 value 0.062724
#> iter1190 value 0.061601
#> iter1200 value 0.059732
#> iter1210 value 0.059233
#> iter1220 value 0.058890
#> iter1230 value 0.058380
#> iter1240 value 0.057941
#> iter1250 value 0.057676
#> iter1260 value 0.056881
#> iter1270 value 0.056176
#> iter1280 value 0.055240
#> iter1290 value 0.055030
#> iter1300 value 0.054718
#> iter1310 value 0.054555
#> iter1320 value 0.054330
#> iter1330 value 0.054019
#> iter1340 value 0.053238
#> iter1350 value 0.052651
#> iter1360 value 0.052365
#> iter1370 value 0.052034
#> iter1380 value 0.050943
#> iter1390 value 0.048731
#> iter1400 value 0.047215
#> iter1410 value 0.044844
#> iter1420 value 0.044620
#> iter1430 value 0.043874
#> iter1440 value 0.043573
#> iter1450 value 0.043289
#> iter1460 value 0.042271
#> iter1470 value 0.041862
#> iter1480 value 0.041383
#> iter1490 value 0.041305
#> iter1500 value 0.041089
#> iter1510 value 0.040776
#> iter1520 value 0.040591
#> iter1530 value 0.040406
#> iter1540 value 0.040246
#> iter1550 value 0.040139
#> iter1560 value 0.040084
#> iter1570 value 0.040045
#> iter1580 value 0.039949
#> iter1590 value 0.039828
#> iter1600 value 0.039756
#> iter1610 value 0.039638
#> iter1620 value 0.039573
#> iter1630 value 0.039474
#> iter1640 value 0.039383
#> iter1650 value 0.039272
#> iter1660 value 0.039242
#> iter1670 value 0.039207
#> iter1680 value 0.039154
#> iter1690 value 0.039128
#> iter1700 value 0.039105
#> iter1710 value 0.039080
#> iter1720 value 0.038977
#> iter1730 value 0.038926
#> iter1740 value 0.038853
#> iter1750 value 0.038775
#> iter1760 value 0.038690
#> iter1770 value 0.038628
#> iter1780 value 0.038562
#> iter1790 value 0.038482
#> iter1800 value 0.038420
#> iter1810 value 0.038324
#> iter1820 value 0.038255
#> iter1830 value 0.038207
#> iter1840 value 0.038151
#> iter1850 value 0.038072
#> iter1860 value 0.037999
#> iter1870 value 0.037857
#> iter1880 value 0.037785
#> iter1890 value 0.037777
#> iter1900 value 0.037748
#> iter1910 value 0.037674
#> iter1920 value 0.037625
#> iter1930 value 0.037601
#> iter1940 value 0.037547
#> iter1950 value 0.037445
#> iter1960 value 0.037417
#> iter1970 value 0.037406
#> iter1980 value 0.037385
#> iter1990 value 0.037355
#> iter2000 value 0.037348
#> final  value 0.037348 
#> stopped after 2000 iterations


# how does the model do on test data?
predicted <- predict(gamma_model, test_p, type = "raw")
test_result <- data.frame(idx = 1:length(test_t), predicted[ ,1], test_t)
colnames(test_result) <- c("idx", "predicted", "actual")

ggplot(data = test_result[1:50, ]) +
  geom_line(mapping = aes(x = idx, y = actual, color = "green")) +
  geom_line(mapping = aes(x = idx, y = predicted, color = "blue")) +
  geom_line(mapping = aes(x = idx, y = actual - predicted, color = "red")) +
  scale_colour_manual(name = 'sequence', 
         values =c('green'='green', 'blue'='blue','red'='red'), 
         labels = c('predicted', 'actual', 'error' )) +
  labs(y = "predicted over actual",
      title = "Henon Model Using Gamma")
```

<img src="man/figures/README-example-1.png" width="100%" />
