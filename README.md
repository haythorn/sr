
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

This example shows the creation of an embedding on a time series,
division of the data into training and test subsets, using `gamma_test`
to control learning and prevent overtraining in a neural network, and
displaying the results. This example is explained in detail in the
time_series vignette.

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
#> initial  value 51.121839 
#> iter  10 value 26.293033
#> iter  20 value 2.941349
#> iter  30 value 0.650106
#> iter  40 value 0.521984
#> iter  50 value 0.433838
#> iter  60 value 0.335514
#> iter  70 value 0.249546
#> iter  80 value 0.225317
#> iter  90 value 0.208037
#> iter 100 value 0.162236
#> iter 110 value 0.119053
#> iter 120 value 0.099106
#> iter 130 value 0.093370
#> iter 140 value 0.084860
#> iter 150 value 0.074066
#> iter 160 value 0.071018
#> iter 170 value 0.066529
#> iter 180 value 0.061526
#> iter 190 value 0.059460
#> iter 200 value 0.055538
#> iter 210 value 0.052741
#> iter 220 value 0.051939
#> iter 230 value 0.051004
#> iter 240 value 0.050022
#> iter 250 value 0.049441
#> iter 260 value 0.048418
#> iter 270 value 0.047803
#> iter 280 value 0.046901
#> iter 290 value 0.046809
#> iter 300 value 0.046036
#> iter 310 value 0.044929
#> iter 320 value 0.044216
#> iter 330 value 0.043942
#> iter 340 value 0.043755
#> iter 350 value 0.043232
#> iter 360 value 0.042947
#> iter 370 value 0.042743
#> iter 380 value 0.042468
#> iter 390 value 0.042044
#> iter 400 value 0.041790
#> iter 410 value 0.041376
#> iter 420 value 0.041245
#> iter 430 value 0.041099
#> iter 440 value 0.041046
#> iter 450 value 0.040951
#> iter 460 value 0.040625
#> iter 470 value 0.040440
#> iter 480 value 0.040287
#> iter 490 value 0.040195
#> iter 500 value 0.040153
#> iter 510 value 0.040112
#> iter 520 value 0.039941
#> iter 530 value 0.039705
#> iter 540 value 0.039504
#> iter 550 value 0.039418
#> iter 560 value 0.039379
#> iter 570 value 0.039309
#> iter 580 value 0.039274
#> iter 590 value 0.039238
#> iter 600 value 0.039225
#> iter 610 value 0.039178
#> iter 620 value 0.039151
#> iter 630 value 0.039115
#> iter 640 value 0.039101
#> iter 650 value 0.039043
#> iter 660 value 0.038992
#> iter 670 value 0.038915
#> iter 680 value 0.038866
#> iter 690 value 0.038823
#> iter 700 value 0.038783
#> iter 710 value 0.038767
#> iter 720 value 0.038741
#> iter 730 value 0.038710
#> iter 740 value 0.038686
#> iter 750 value 0.038632
#> iter 760 value 0.038624
#> iter 770 value 0.038617
#> iter 780 value 0.038605
#> iter 790 value 0.038592
#> iter 800 value 0.038581
#> iter 810 value 0.038540
#> iter 820 value 0.038518
#> iter 830 value 0.038504
#> iter 840 value 0.038499
#> iter 850 value 0.038497
#> iter 860 value 0.038483
#> iter 870 value 0.038473
#> iter 880 value 0.038454
#> iter 890 value 0.038430
#> iter 900 value 0.038427
#> iter 910 value 0.038422
#> iter 920 value 0.038416
#> iter 930 value 0.038407
#> iter 940 value 0.038393
#> iter 950 value 0.038385
#> iter 960 value 0.038384
#> iter 970 value 0.038381
#> iter 980 value 0.038368
#> iter 990 value 0.038364
#> iter1000 value 0.038354
#> iter1010 value 0.038342
#> iter1020 value 0.038337
#> iter1030 value 0.038334
#> iter1040 value 0.038329
#> iter1050 value 0.038315
#> iter1060 value 0.038310
#> iter1070 value 0.038295
#> iter1080 value 0.038284
#> iter1090 value 0.038283
#> iter1100 value 0.038276
#> iter1110 value 0.038270
#> iter1120 value 0.038265
#> iter1130 value 0.038251
#> iter1140 value 0.038244
#> iter1150 value 0.038231
#> iter1160 value 0.038228
#> iter1170 value 0.038220
#> iter1180 value 0.038213
#> iter1190 value 0.038204
#> iter1200 value 0.038195
#> iter1210 value 0.038189
#> iter1220 value 0.038183
#> iter1230 value 0.038179
#> iter1240 value 0.038176
#> iter1250 value 0.038172
#> iter1260 value 0.038162
#> iter1270 value 0.038152
#> iter1280 value 0.038144
#> iter1290 value 0.038141
#> iter1300 value 0.038136
#> iter1310 value 0.038126
#> iter1320 value 0.038119
#> iter1330 value 0.038111
#> iter1340 value 0.038108
#> iter1350 value 0.038104
#> iter1360 value 0.038095
#> iter1370 value 0.038089
#> iter1380 value 0.038082
#> iter1390 value 0.038078
#> iter1400 value 0.038068
#> iter1410 value 0.038062
#> iter1420 value 0.038057
#> iter1430 value 0.038055
#> iter1440 value 0.038054
#> iter1450 value 0.038052
#> iter1460 value 0.038049
#> iter1470 value 0.038042
#> iter1480 value 0.038038
#> iter1490 value 0.038034
#> iter1500 value 0.038031
#> iter1510 value 0.038029
#> iter1520 value 0.038025
#> iter1530 value 0.038021
#> iter1540 value 0.038019
#> iter1550 value 0.038016
#> iter1560 value 0.038011
#> iter1570 value 0.038009
#> iter1580 value 0.038007
#> iter1590 value 0.038004
#> iter1600 value 0.038001
#> iter1610 value 0.037998
#> iter1620 value 0.037989
#> iter1630 value 0.037986
#> iter1640 value 0.037984
#> iter1650 value 0.037979
#> iter1660 value 0.037972
#> iter1670 value 0.037968
#> iter1680 value 0.037965
#> iter1690 value 0.037962
#> iter1700 value 0.037960
#> iter1710 value 0.037957
#> iter1720 value 0.037955
#> iter1730 value 0.037951
#> iter1740 value 0.037944
#> iter1750 value 0.037938
#> iter1760 value 0.037936
#> iter1770 value 0.037932
#> iter1780 value 0.037928
#> iter1790 value 0.037922
#> iter1800 value 0.037919
#> iter1810 value 0.037911
#> iter1820 value 0.037899
#> iter1830 value 0.037892
#> iter1840 value 0.037889
#> iter1850 value 0.037884
#> iter1860 value 0.037876
#> iter1870 value 0.037863
#> iter1880 value 0.037854
#> iter1890 value 0.037848
#> iter1900 value 0.037842
#> iter1910 value 0.037837
#> iter1920 value 0.037826
#> iter1930 value 0.037815
#> iter1940 value 0.037805
#> iter1950 value 0.037797
#> iter1960 value 0.037792
#> iter1970 value 0.037787
#> iter1980 value 0.037779
#> iter1990 value 0.037764
#> iter2000 value 0.037749
#> final  value 0.037749 
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
