install.packages("DataExplorer")
install.packages("openxlsx")
install.packages("ggthemes")
install.packages("ggplot2")
install.packages("extrafont")

# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
rm(list = ls())

# Cambiar el directorio de trabajo
setwd("C:/Users/CARLOS RAUL/Documents/MyGithub/r-probability-and-statistics/Estadistica_y_Probabilidad-1/primer-proyecto_trafico/")


library(ggthemes)
library(ggplot2)


library(DataExplorer)
library(extrafont)

font_import()                 #Escanea las fuentes en el equipo
loadfonts(device="win")       #Registra las fuentes de windows
fonts()                       #Vector de fuentes disponibles
##  [1] "Andale Mono"                  "AppleMyungjo"                
##  [3] "Arial Black"                  "Arial"                       
##  [5] "Arial Narrow"                 "Arial Rounded MT Bold"  :P

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
        ##1  
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
        
        ##3
          print(length(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$YEAR)))))
            print(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$YEAR))))
            print(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$QUARTER))))
          print(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$CITY1))))
            print(length(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$CITY1)))))
          print(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$CITY2))))
            print(length(sort(unique(as.factor(trafico_trimestral_por_pares_de_ciudad$CITY2)))))
        
            
# 3W: Pre-ordenamiento de la data para su graficación    
    
  # Limpieza de datoss
  trafico_mensual_por_linea_aerea <- na.omit(trafico_mensual_por_linea_aerea)
    View(trafico_mensual_por_linea_aerea)
  
  # Nombres y cantidad de aereolineas
  print(length(sort(unique(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`)))))
    print(sort(unique(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`))))
  
  # Seleción de datos por año
  año <- 2015
  trafico_mensual_por_linea_aerea <- trafico_mensual_por_linea_aerea[trafico_mensual_por_linea_aerea$YEAR==año, ]
    View(trafico_mensual_por_linea_aerea) #Comprobar integridad de los datos
    
  # Ordenamiento alfabetico por linea aerea
  trafico_mensual_por_linea_aerea <- trafico_mensual_por_linea_aerea[order(trafico_mensual_por_linea_aerea$`AIRLINE NAME`), ]
     View(trafico_mensual_por_linea_aerea)
  
  # Trabajo con los datos deseados
    nombres_de_aereolineas <- sort(unique(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`)))

    total_passengers <- c(1:length(nombres_de_aereolineas))
    
    #Creación de data frame por aereolinea
    for (i in 1:length(nombres_de_aereolineas)){
        airline <- trafico_mensual_por_linea_aerea[trafico_mensual_por_linea_aerea$`AIRLINE NAME`==nombres_de_aereolineas[i], ]
        passengers <- sum(airline$`PASSENGERS TO INDIA`) + sum(airline$`PASSENGERS FROM INDIA`)
        total_passengers[i] <- passengers
    }
    
    # Data frame final
    tabla <- data.frame(nombres_de_aereolineas, total_passengers )
    tabla <- tabla[order(tabla$total_passengers),]
    View(tabla)
    
      #Datos encima del promedio
      trafico_total <- sum(tabla$total_passengers)
      
      trafico_promedio <- mean(tabla$total_passengers)
      
      tabla <- tabla[tabla$total_passengers >= trafico_promedio, ]
      
      tabla[["trafico_porcentual"]]
      
      tabla <- data.frame(tabla$nombres_de_aereolineas, (tabla$total_passengers / trafico_total))
        colnames(tabla)[1] <- "nombres_de_aereolineas"; colnames(tabla)[2] <- "trafico_porcentual" 
    
      class(tabla$trafico_porcentual)
      View(tabla)
    
      #Datos encima del promedio superior
        
        tabla <- tabla[tabla$trafico_porcentual >= mean(tabla$trafico_porcentual), ]
        
      View(tabla)      
      
        tabla <- rbind(tabla, data.frame(nombres_de_aereolineas = "OTRAS AEREOLINEAS", trafico_porcentual = (1 - sum(tabla$trafico_porcentual)) ))
        
      #Trabajo gráfico
      #Ordenando la data
      tabla <- tabla[order(tabla$nombres_de_aereolineas),]
      View(tabla)
      
        
      #Creación del histograma
      barplot(
        tabla[["trafico_porcentual"]],
        names.arg = droplevels(tabla[["nombres_de_aereolineas"]]), 
        xlab = "Aereolineas",
        ylab = "Porcentaje de pasajeros",
        col = "goldenrod2",
        main = paste("Distribución del trafico aereo mensual total de personas en",año), 
        border = "black"
        )
      
#Creación grafica mediante plot
  plot(droplevels(tabla[["nombres_de_aereolineas"]]), 
      tabla[["trafico_porcentual"]], 
      type="l", 
      xlab = "Aereolineas",
      ylab = "Porcentaje de pasajeros")
  title(paste("Distribución del trafico aereo mensual total de personas en",año))
  abline(h = tabla[["trafico_porcentual"]], 
         v = c((0:12)/2), 
         col = "gray")
  legend("top", "(Aereolinea, N°T.P / P.A )", pch=1, 
         title=paste("N° T.P = ", trafico_total))
  points(1:6, tabla[["trafico_porcentual"]])      
  lines(droplevels(tabla[["nombres_de_aereolineas"]]), 
        tabla[["trafico_porcentual"]], 
        col = "red")
  for (j in 1:nrow(tabla)) {
    text(j,
        (tabla[["trafico_porcentual"]][j] + 0.01),
        paste(format((tabla[["trafico_porcentual"]][j]*100),
                      digits = 4, 
                      nsmall = 2),"%")
        )    
  }
  
# Creación grafica de LINEA mediante plot
  x <- 1:6; y1 <- 1/x; y2 <- 2/x
  plot(droplevels(tabla[["nombres_de_aereolineas"]]), 
       c(y1, y2), 
      type="n", 
      xlab = "Aereolineas",
      ylab = "Porcentaje de pasajeros")
  title(paste("Distribución del trafico aereo mensual total de personas en",año))
  abline(h = tabla[["trafico_porcentual"]], 
         v = c((0:12)/2), 
         col = "gray")
  legend("top", "(Aereolinea, N°T.P / P.A )", pch=1, 
         title=paste("N° T.P = ", trafico_total))
  points(1:6, tabla[["trafico_porcentual"]])      
  lines(droplevels(tabla[["nombres_de_aereolineas"]]), 
        tabla[["trafico_porcentual"]], 
        col = "red")
  for (j in 1:nrow(tabla)) {
    text(j,
        (tabla[["trafico_porcentual"]][j] + 0.01),
        paste(format((tabla[["trafico_porcentual"]][j]*100),
                      digits = 4, 
                      nsmall = 2 ),
              "%")
        )    
  }
      c((1:60)/100)
    
    ?lines()
  
  
  
      #Creación grfico circular mediante pie bidimensional
      pie(tabla[["trafico_porcentual"]],
          labels = droplevels(tabla[["nombres_de_aereolineas"]]), 
          col = c("aquamarine2", 
                  "cadetblue2", 
                  "chartreuse1", 
                  "darkolivegreen3", 
                  "cyan3", 
                  "dodgerblue3"), 
          main = paste("Distribución del tráfico aéreo mensual en",año), 
          radius = 1, 
          col.main = "darkgray"
          )
      
      #, "gold2"
      #  col = rainbow(nrow(tabla)), o c("aquamarine2", "cadetblue2", "chartreuse1", "darkolivegreen3", "cyan3", "dodgerblue3")
      
      # parcial :P
      
      
      trafico_trimestral_por_pares_de_ciudad 
      View(trafico_trimestral_por_pares_de_ciudad) 
      
      ciudades2 <- trafico_trimestral_por_pares_de_ciudad[["CITY2"]]
      
      
      length(unique(ciudades2))

      View(ciudades2)
      nombres_de_ciudades_2 <- data.frame(sort(unique(ciudades2)))
      View(nombres_de_ciudades_2) 
      write.csv(nombres_de_ciudades_2,".\\nombres_ciudades_2.csv", row.names = FALSE)
      
# Examen final :D 
      
      # El Trabajo de Investigación debe ser presentado mediante los archivos que consideren necesarios.
      # El Trabajo de Investigación debe ser presentado únicamente por el encargado del Grupo.
      # El Grupo, al momento de realizar la presentación de su Trabajo de Investigación, podrá acompañarse de diapositivas.
      # La exposición tendrá una duración máxima de 20 minutos.
      # El trabajo consiste en realizar el (análisis descriptivo) del Dataset que cada Grupo selecciono, el cual consiste en:
      
      # Dos tablas de frecuencia agrupada basada en variable cualitativa.
          #Se emplearan: El data frame de trafico aereo mensual por linea aerea 
        
          
      
      # Dos tablas de frecuencia No agrupada basada en variable cuantitativa.
      
      
      # Dos tablas de frecuencia agrupada basada en variable cuantitativa.
      
      # Una tabla de frecuencia bivariada basada en variable cualitativa vs. cualitativa.
      
      # Una tabla de frecuencia bivariada basada en variable cualitativa vs. cuantitativa.
      
      # Una tabla de frecuencia bivariada basada en variable cuantitativa vs. cuantitativa.
      # Calcular: Cuartiles, Media, Moda, Rango, Varianza, Desviación Estándar y Coeficiente de variación de una variable cuantitativa.
      
      # Gráfico de Dispersión, Análisis de Correlación e Interpretación.
      # Generación de modelos (Lineal y No Lineal) e Interpretación.    
      
      
      