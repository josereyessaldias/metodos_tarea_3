require(readr)
library(readr)
library(dplyr)
library(tidyverse)
install.packages("xts")
library(xts)
library(ggplot2)
install.packages("forecast")
library(forecast)

covid <- read_csv("https://raw.githubusercontent.com/MinCiencia/Datos-COVID19/master/output/producto13/CasosNuevosCumulativo.csv")
data <- covid[7,]
data <- data[,-1]
data <- t(data)

data <- as.ts(data)

data <- ts(data,frequency=7)
data.decom <- decompose(data)
autoplot(data.decom) + theme_minimal()


ggAcf(data) + theme_minimal()

ggPacf(data) + theme_minimal()

spectrum(data,log="no",type="h", method="pgram")
spectrum(data,log="no",type="h", method="ar")

# data <- data %>%
#   remove_rownames() %>%
#   column_to_rownames(var = 'Region')
# 
# data <-t.data.frame(data)
#data$Date <- as.Date(data$Date, format =  "%m/%d/%Y") 
#data_rm <- data %>% select(Date,Metropolitana)
#data <- as.ts(x = data[, -1], order.by = data$Date)
#data_rm <- as.ts(data_rm, order.by = data_rm$Date, frequency=7)
#data_rm <- ts(data_rm,frequency=7)
#data.decom <- decompose(data_rm)
#autoplot(data.decom) + thememinimal()
#ggplot2::autoplot(data.decom) + thememinimal()









