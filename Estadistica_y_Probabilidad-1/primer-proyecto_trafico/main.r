install.packages("DataExplorer")
install.packages("openxlsx")
install.packages("ggthemes")
install.packages("ggplot2")

library(ggthemes)
library(ggplot2)
library(DataExplorer)

library(readxl)
library(readr)
library(openxlsx)


Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Airlinewise Monthly International Air Traffic To And From The Indian Territory.csv")

Citypairwise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Citypairwise Quarterly International  Air Traffic To And From The Indian Territory.csv")

Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Countrywise Quarterly International Air Traffic To And From The Indian Territory.csv")


trafico_mensual_por_linea_aerea <- Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory

trafico_trimestral_por_pares_de_ciudad <- Citypairwise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory

trafico_trimestral_por_pais <- Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory



#Tráfico aéreo internacional hacia y desde el territorio indio

View(trafico_mensual_por_linea_aerea)
View(trafico_trimestral_por_pares_de_ciudad)
View(trafico_trimestral_por_pais)

##1. Analisis del Tráfico aéreo internacional mensual por línea aérea hacia y desde el territorio indio

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
      aereolineas <-unique(sort(as.factor(col_aereolineas)))
      print(aereolineas)
      
      #
      nombres_de_aereolineas <- unique(sort(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`)))      
      print(nombres_de_aereolineas)
      
      numero_de_aereolineas <- length(nombres_de_aereolineas)
      print(numero_de_aereolineas)
      
      ## Conocer los elemento de cada columna
      print(length(sort(unique(as.factor(trafico_mensual_por_linea_aerea$YEAR)))))
        print(sort(unique(as.factor(trafico_mensual_por_linea_aerea$YEAR))))
          
      print(length(sort(unique(as.factor(trafico_mensual_por_linea_aerea$MONTH)))))
        print(unique(as.factor(trafico_mensual_por_linea_aerea$MONTH)))
      
      print(length(sort(unique(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`)))))
        print(sort(unique(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`))))
      
      print(length(sort(unique(as.factor(trafico_mensual_por_linea_aerea$`CARRIER TYPE`)))))
        print(sort(unique(as.factor(trafico_mensual_por_linea_aerea$`CARRIER TYPE`))))
      

        
      ##2          
        print(sort(unique(as.factor(trafico_trimestral_por_pais$YEAR))))
        print(sort(unique(as.factor(trafico_trimestral_por_pais$QUARTER))))
        
        print(length(sort(unique(as.factor(trafico_trimestral_por_pais$`COUNTRY NAME`)))))
          print(sort(unique(as.factor(trafico_trimestral_por_pais$`COUNTRY NAME`))))
      
      ##2 
          
        print(length(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$YEAR)))))
          print(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$YEAR))))
          
          print(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$QUARTER))))
          
        
          print(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$CITY1))))
          print(length(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$CITY1)))))
      
        print(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$CITY2))))
          print(length(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$CITY2)))))
      
##3
    print(as.factor(trafico_trimestral_por_pares_de_ciudad$YEAR))
          
          
      
      #Misión obtener todo el código de ... :D 
      
      #Concatenar codigo con ; .  cat(), es analogo a un print(), pero no asigna enter luego de ejecutarce  
      #Se puede asiganar de derecha a izquierda -> OUO ;
      # cat(paste("Algo", variable, "Algo")) un print limpio
      # ls() Un let see de variables
      # rm(variable)
      #class(variable)
      
