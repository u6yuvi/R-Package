library(missForest)
library(mice)
library(VIM)

#'iris' is a default data set in R
data <- iris

#creating 10% random NAs in the iris data set
iris.miss <- prodNA(data, noNA = 0.1)
summary(iris.miss)

#checking no. of missing values using a histogram
mice_plot <- aggr(iris.miss, col = c('blue','green'),
                  numbers = T, sortVars = T,
                  cex.axis = 0.7, gap = 3, ylabs = c("Missing Data","Pattern"))

#imputing the data set using mice
imputed_iris <- mice(iris.miss, m = 3, maxit = 50, method = "pmm", seed = 500)
summary(imputed_iris)