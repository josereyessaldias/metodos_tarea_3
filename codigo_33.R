install.packages("fda")
library(fda)
library(dplyr)
library(ggplot2)

load("growth.rda")




plot(growth[["hgtm"]])


fbplot(growth[["hgtm"]], ylim=c(70,200))
fbplot(growth[["hgtf"]], ylim=c(70,200))


data <- growth[["hgtf"]][,1:10]
data <- as.ts(data)
matplot(data, type = c("l"), col = 1:10)

