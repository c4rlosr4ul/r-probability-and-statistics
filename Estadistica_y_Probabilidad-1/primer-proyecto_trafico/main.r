install.packages("DataExplorer")
install.packages("openxlsx")
install.packages("ggthemes")
install.packages("ggplot2")

library(readxl)
library(readr)
library(openxlsx)
library(ggthemes)
library(ggplot2)
library(DataExplorer)

#Tráfico aéreo internacional hacia y desde el territorio indio

Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Airlinewise Monthly International Air Traffic To And From The Indian Territory.csv")

Citypairwise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Citypairwise Quarterly International  Air Traffic To And From The Indian Territory.csv")

Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Countrywise Quarterly International Air Traffic To And From The Indian Territory.csv")


trafico_mensual_por_linea_aerea <- Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory

trafico_trimestral_por_pares_de_ciudad <- Citypairwise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory

trafico_trimestral_por_pais <- Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory


View(trafico_mensual_por_linea_aerea)
  View(trafico_trimestral_por_pares_de_ciudad)
View(trafico_trimestral_por_pais)

#1. Analisis del Tráfico aéreo internacional mensual por línea aérea hacia y desde el territorio indio

  #titulos_de_clasificacion <- head(trafico_mensual_por_linea_aerea, 1)
  #View(titulos_de_clasificacion)
  
  #Pruebas...
  


    
# Análisis exploratotio de datos
  
  #Detectar los datos numéricos
    datos_num <- trafico_mensual_por_linea_aerea[, 6:ncol(trafico_mensual_por_linea_aerea)]
    print(datos_num) #Entradas y salidas de pasajeros
    
    
  #Tipos de datos y clasificación
    str(trafico_mensual_por_linea_aerea)
  
  #vizualizar datos por terminal 
    head(trafico_mensual_por_linea_aerea, 3)

  #Previzualizar la gráfica :D $Eso vs. numeración 
    ts.plot(trafico_mensual_por_linea_aerea$YEAR)
    ts.plot(trafico_mensual_por_linea_aerea$`PASSENGERS TO INDIA`)
    ts.plot(trafico_mensual_por_linea_aerea$`PASSENGERS FROM INDIA`)
    ts.plot(trafico_mensual_por_linea_aerea$`FREIGHT TO INDIA`)
    ts.plot(trafico_mensual_por_linea_aerea$`FREIGHT FROM INDIA`)
  
  #Ploteo con data explorer
    #Faltan datos en el data frame?
      plot_missing(datos_num)
        #Falta algundo pasajeros que van a india
    #Editar datos  
      fix(datos_num)
    #Vista general histográmica de los datos
      plot_histogram(datos_num)
      
      plot.histogram(trafico_mensual_por_linea_aerea)
#Las aerelineas son:
      #Variables categoricas <> factores
      col_aereolineas <- trafico_mensual_por_linea_aerea$`AIRLINE NAME`
      mode(col_aereolineas) #Tipo de dato      
      aereolineas <- sort(as.factor(col_aereolineas))
      print(aereolineas)
      
      #
      nombres_de_aereolineas <- sort(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`))      
      numero_de_aereolineas <- length(nombres_de_aereolineas)
      print(numero_de_aereolineas)
      
      
      #Msi{on obtener todo el código de 
      
