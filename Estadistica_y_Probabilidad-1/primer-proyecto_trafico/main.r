install.packages("DataExplorer")

library(readxl)
library(readr)

#Tráfico aéreo internacional hacia y desde el territorio indio

Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Airlinewise Monthly International Air Traffic To And From The Indian Territory.csv")

Citypairwise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Citypairwise Quarterly International  Air Traffic To And From The Indian Territory.csv")

Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Countrywise Quarterly International Air Traffic To And From The Indian Territory.csv")

View(Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory)

View(Citypairwise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory)

View(Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory)


trafico_mensual_por_linea_aerea <- Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory

trafico_trimestral_por_pares_de_ciudad <- Citypairwise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory

trafico_trimestral_por_pais <- Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory

#1. Analisis del Tráfico aéreo internacional mensual por línea aérea hacia y desde el territorio indio

titulos_de_clasificacion <- head(trafico_mensual_por_linea_aerea, 1)

View(titulos_de_clasificacion)

  
# Todos los vi

