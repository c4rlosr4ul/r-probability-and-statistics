setwd("../r-probability-and-statistics/Fisica-Experimental/")

library(readr)
library(readxl)

datos = read_excel("Semama.6.1.xlsx")

View(datos)
excel_sheets("Semama.6.1.xlsx") #Nombres de las hojas

datos_d_n <- read_excel("Semama.6.1.xlsx", "disco_naranja")
datos_d_a <- read_excel("Semama.6.1.xlsx", "disco_azul")
datos_p_g_a <- read_excel("Semama.6.1.xlsx", "punto_giratorio_azul")
datos_p_g_n <- read_excel("Semama.6.1.xlsx", "punto_giratorio_naranja")

# 1. Analisis disco naranja
print(ncol(datos_d_n))
nrow(datos_d_n)
View(datos_d_n$t)

datos_d_n_pre_impacto <- datos_d_n
datos_d_n_post_impacto <-
v_angular <- 



View(datos_d_a)
View(datos_p_g_a)
View(datos_p_g_n)

summary(datos_d_n)


