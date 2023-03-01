
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
#> initial  value 49.451699 
#> iter  10 value 31.018807
#> iter  20 value 17.760579
#> iter  30 value 0.961127
#> iter  40 value 0.448299
#> iter  50 value 0.396241
#> iter  60 value 0.355532
#> iter  70 value 0.339051
#> iter  80 value 0.270308
#> iter  90 value 0.212628
#> iter 100 value 0.165070
#> iter 110 value 0.143722
#> iter 120 value 0.129183
#> iter 130 value 0.088098
#> iter 140 value 0.078054
#> iter 150 value 0.072245
#> iter 160 value 0.069539
#> iter 170 value 0.067410
#> iter 180 value 0.061666
#> iter 190 value 0.059343
#> iter 200 value 0.055956
#> iter 210 value 0.055259
#> iter 220 value 0.055119
#> iter 230 value 0.054989
#> iter 240 value 0.054801
#> iter 250 value 0.053874
#> iter 260 value 0.053450
#> iter 270 value 0.052938
#> iter 280 value 0.051566
#> iter 290 value 0.051065
#> iter 300 value 0.050778
#> iter 310 value 0.050082
#> iter 320 value 0.049187
#> iter 330 value 0.047547
#> iter 340 value 0.045029
#> iter 350 value 0.044128
#> iter 360 value 0.043911
#> iter 370 value 0.043474
#> iter 380 value 0.042827
#> iter 390 value 0.042543
#> iter 400 value 0.041653
#> iter 410 value 0.041459
#> iter 420 value 0.040740
#> iter 430 value 0.040488
#> iter 440 value 0.040380
#> iter 450 value 0.040296
#> iter 460 value 0.040105
#> iter 470 value 0.040005
#> iter 480 value 0.039641
#> iter 490 value 0.039460
#> iter 500 value 0.039434
#> iter 510 value 0.039399
#> iter 520 value 0.039347
#> iter 530 value 0.039305
#> iter 540 value 0.039195
#> iter 550 value 0.039015
#> iter 560 value 0.038997
#> iter 570 value 0.038932
#> iter 580 value 0.038912
#> iter 590 value 0.038903
#> iter 600 value 0.038883
#> iter 610 value 0.038853
#> iter 620 value 0.038836
#> iter 630 value 0.038819
#> iter 640 value 0.038795
#> iter 650 value 0.038783
#> iter 660 value 0.038774
#> iter 670 value 0.038764
#> iter 680 value 0.038726
#> iter 690 value 0.038720
#> iter 700 value 0.038713
#> iter 710 value 0.038680
#> iter 720 value 0.038665
#> iter 730 value 0.038655
#> iter 740 value 0.038639
#> iter 750 value 0.038621
#> iter 760 value 0.038601
#> iter 770 value 0.038592
#> iter 780 value 0.038580
#> iter 790 value 0.038561
#> iter 800 value 0.038548
#> iter 810 value 0.038536
#> iter 820 value 0.038528
#> iter 830 value 0.038525
#> iter 840 value 0.038521
#> iter 850 value 0.038507
#> iter 860 value 0.038495
#> iter 870 value 0.038479
#> iter 880 value 0.038464
#> iter 890 value 0.038457
#> iter 900 value 0.038437
#> iter 910 value 0.038429
#> iter 920 value 0.038419
#> iter 930 value 0.038406
#> iter 940 value 0.038390
#> iter 950 value 0.038377
#> iter 960 value 0.038364
#> iter 970 value 0.038357
#> iter 980 value 0.038347
#> iter 990 value 0.038334
#> iter1000 value 0.038319
#> iter1010 value 0.038311
#> iter1020 value 0.038306
#> iter1030 value 0.038303
#> iter1040 value 0.038293
#> iter1050 value 0.038284
#> iter1060 value 0.038273
#> iter1070 value 0.038264
#> iter1080 value 0.038258
#> iter1090 value 0.038244
#> iter1100 value 0.038237
#> iter1110 value 0.038230
#> iter1120 value 0.038221
#> iter1130 value 0.038210
#> iter1140 value 0.038200
#> iter1150 value 0.038196
#> iter1160 value 0.038191
#> iter1170 value 0.038186
#> iter1180 value 0.038176
#> iter1190 value 0.038165
#> iter1200 value 0.038157
#> iter1210 value 0.038151
#> iter1220 value 0.038131
#> iter1230 value 0.038127
#> iter1240 value 0.038125
#> iter1250 value 0.038121
#> iter1260 value 0.038102
#> iter1270 value 0.038076
#> iter1280 value 0.038049
#> iter1290 value 0.038029
#> iter1300 value 0.038018
#> iter1310 value 0.038014
#> iter1320 value 0.038007
#> iter1330 value 0.038002
#> iter1340 value 0.038001
#> iter1350 value 0.037990
#> iter1360 value 0.037976
#> iter1370 value 0.037972
#> iter1380 value 0.037971
#> iter1390 value 0.037965
#> iter1400 value 0.037962
#> iter1410 value 0.037959
#> iter1420 value 0.037952
#> iter1430 value 0.037951
#> iter1440 value 0.037945
#> iter1450 value 0.037944
#> iter1460 value 0.037942
#> iter1470 value 0.037939
#> iter1480 value 0.037936
#> iter1490 value 0.037926
#> iter1500 value 0.037921
#> iter1510 value 0.037919
#> iter1520 value 0.037915
#> iter1530 value 0.037911
#> iter1540 value 0.037910
#> iter1550 value 0.037908
#> iter1560 value 0.037907
#> iter1570 value 0.037906
#> iter1580 value 0.037905
#> iter1590 value 0.037905
#> iter1600 value 0.037903
#> iter1610 value 0.037892
#> iter1620 value 0.037890
#> iter1630 value 0.037889
#> iter1640 value 0.037887
#> iter1650 value 0.037886
#> iter1660 value 0.037885
#> iter1670 value 0.037885
#> iter1680 value 0.037885
#> iter1690 value 0.037884
#> iter1700 value 0.037884
#> iter1710 value 0.037884
#> iter1720 value 0.037883
#> iter1730 value 0.037883
#> iter1740 value 0.037883
#> iter1750 value 0.037883
#> final  value 0.037883 
#> converged


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
