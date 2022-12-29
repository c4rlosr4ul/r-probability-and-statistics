library(readxl)
library(readr)
library(openxlsx)

# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
rm(list = ls())

# Cambiar el directorio de trabajo
setwd("C:/Users/CARLOS RAUL/Documents/MyGithub/r-probability-and-statistics/Estadistica_y_Probabilidad-1/primer-proyecto_trafico/")


Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Airlinewise Monthly International Air Traffic To And From The Indian Territory.csv")

Citypairwise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Citypairwise Quarterly International  Air Traffic To And From The Indian Territory.csv")

Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Countrywise Quarterly International Air Traffic To And From The Indian Territory.csv")


trafico_mensual_por_linea_aerea <- Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory

trafico_trimestral_por_pares_de_ciudad <- Citypairwise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory

trafico_trimestral_por_pais <- Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory


View(trafico_mensual_por_linea_aerea)

# Análisis exploratotio de datos

#Detectar los datos numéricos
datos_num <- trafico_mensual_por_linea_aerea[, 6:ncol(trafico_mensual_por_linea_aerea)]
print(datos_num) #Entradas y salidas de pasajeros

#Tipos de datos y clasificación
str(trafico_mensual_por_linea_aerea)

#vizualizar datos por terminal 
head(trafico_mensual_por_linea_aerea, 3)


# Examen final :D 
  
  # El Trabajo de Investigación debe ser presentado mediante los archivos que consideren necesarios.
  # El Trabajo de Investigación debe ser presentado únicamente por el encargado del Grupo.
  # El Grupo, al momento de realizar la presentación de su Trabajo de Investigación, podrá acompañarse de diapositivas.
  # La exposición tendrá una duración máxima de 20 minutos.
  # El trabajo consiste en realizar el (análisis descriptivo) del Dataset que cada Grupo selecciono, el cual consiste en:
  
  # 1. Dos tablas de frecuencia agrupada basada en variable cualitativa.
    #Se emplearan: El data frame de trafico aereo mensual por linea aerea 
    
    ####colnames(trafico_mensual_por_linea_aerea) <- c("Año", "Mes", "Cuartil", "Linea aérea", "Tpo de portador", "Pasajeros hacia India", "Pasajeros desde India","Flete desde India", "Flete hacia India")    #Si se desea trabajar en español
    
    # 1.1. Tabla de frecuencia basada en aereolineas 

    # Limpieza de datoss
    trafico_mensual_por_linea_aerea <- na.omit(trafico_mensual_por_linea_aerea)
    View(trafico_mensual_por_linea_aerea)
    
    # Nombres y cantidad de aereolineas
    print(length(sort(unique(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`)))))
    print(length(sort(unique(trafico_mensual_por_linea_aerea[["AIRLINE NAME"]])))) # Lo mismo (Pero sin niveles :p)
  
    print(sort(unique(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`))))
    print(sort(unique(trafico_mensual_por_linea_aerea[["AIRLINE NAME"]])))
    
    
    #  Aereolinea Pasajeros 
      
      tabla_f_1 <- trafico_mensual_por_linea_aerea[,-c(1,2,3,5,8,9)]
      View(tabla_f_1)
    
    # Ordenamiento alfabetico por linea aerea
      trafico_mensual_por_linea_aerea <- trafico_mensual_por_linea_aerea[order(trafico_mensual_por_linea_aerea$`AIRLINE NAME`), ]
      View(trafico_mensual_por_linea_aerea)
    
    # Trabajo con los datos deseados
      nombres_de_aereolineas <- sort(unique(trafico_mensual_por_linea_aerea[["AIRLINE NAME"]]))
      
      #Vector para crear el data frame
      total_passengers <- c(1:length(nombres_de_aereolineas))
      
      total_accumulated_passengers <- c(0:length(nombres_de_aereolineas))
      
      percentage_passangers <- c(1:length(nombres_de_aereolineas))
      
      percentage_accumulated_passengers <- c(0:length(nombres_de_aereolineas))
        
    #Creación de la tabla de frecuencias por aereolinea
      
    for (i in 1:length(nombres_de_aereolineas)){
      airline <- trafico_mensual_por_linea_aerea[trafico_mensual_por_linea_aerea$`AIRLINE NAME`==nombres_de_aereolineas[i], ]
      passengers <- sum(airline$`PASSENGERS TO INDIA`) + sum(airline$`PASSENGERS FROM INDIA`)
      total_passengers[i] <- passengers
    }
      total_accumulated_passengers[1] <- total_passengers[1] 
    for (i in 1:length(nombres_de_aereolineas)) {
      total_accumulated_passengers[i+1] <-  total_accumulated_passengers[i] + total_passengers[i+1]
    }
      total_accumulated_passengers <- total_accumulated_passengers[-c(length(nombres_de_aereolineas)+1)] # Eliminado elemento sobrante
      general_total_passengers <- total_accumulated_passengers[length(nombres_de_aereolineas)]  
    for (i in 1:length(nombres_de_aereolineas)) {
      percentage_passangers[i] <- total_passengers[i]/general_total_passengers
    }
      percentage_accumulated_passengers[1] <- percentage_passangers[1]
    for (j in 1:length(nombres_de_aereolineas)) {
      percentage_accumulated_passengers[j+1] <- percentage_accumulated_passengers[j] + percentage_passangers[j+1]
    }
      percentage_accumulated_passengers <- percentage_accumulated_passengers[-c(length(nombres_de_aereolineas)+1)]
      
      # Data frame final
      tabla_f_1 <- data.frame(nombres_de_aereolineas, total_passengers, total_accumulated_passengers, percentage_passangers, percentage_accumulated_passengers)
      
      colnames(tabla_f_1) <- c("Aereolinea","Frecuencia Absoluta", "Frecuencia Absoluta Acumulativa", "Frecuencia Relativa", "Frecuencia Relativa Acumulativa")
      
      View(tabla_f_1) # TERMINADA LA TABLA DE FRECUENCIA 1
      
      # Tabla representa las frecuencias de pasajeros que emplearon la aereolinea desde 2015 hasta 2017  
    
    # 1.2. Tabla de frecuencia basada que aereolineas prefieren las personas o empresas para transportar mercaderia 
        
      #  Aereolinea flete 
      
      tabla_f_2 <- trafico_mensual_por_linea_aerea[,-c(1,2,3,5,6,7)]
      View(tabla_f_2)
      
      #Vector para crear el data frame
      total_merchandise <- c(1:length(nombres_de_aereolineas)) #en toneladas
      
      total_accumulated_merchandise<- c(0:length(nombres_de_aereolineas))
      
      percentage_merchandise <- c(1:length(nombres_de_aereolineas))
      
      percentage_accumulated_merchandise <- c(0:length(nombres_de_aereolineas))
      
      #Creación de la tabla de frecuencias por aereolinea
      
      for (i in 1:length(nombres_de_aereolineas)){
        airline <- trafico_mensual_por_linea_aerea[trafico_mensual_por_linea_aerea$`AIRLINE NAME`==nombres_de_aereolineas[i], ]
        merchandise <- sum(airline$`FREIGHT TO INDIA`) + sum(airline$`FREIGHT FROM INDIA`)
        total_merchandise[i] <- merchandise
      }
      total_accumulated_merchandise[1] <- total_merchandise[1] 
      for (i in 1:length(nombres_de_aereolineas)) {
        total_accumulated_merchandise[i+1] <-  total_accumulated_merchandise[i] + total_merchandise[i+1]
      }
      total_accumulated_merchandise <- total_accumulated_merchandise[-c(length(nombres_de_aereolineas)+1)] # Eliminado elemento sobrante
      general_total_merchandise <- total_accumulated_merchandise[length(nombres_de_aereolineas)]  
      for (i in 1:length(nombres_de_aereolineas)) {
        percentage_merchandise[i] <- total_merchandise[i]/general_total_merchandise
      }
      percentage_accumulated_merchandise[1] <- percentage_merchandise[1]
      for (j in 1:length(nombres_de_aereolineas)) {
        percentage_accumulated_merchandise[j+1] <- percentage_accumulated_merchandise[j] + percentage_merchandise[j+1]
      }
      percentage_accumulated_merchandise <- percentage_accumulated_merchandise[-c(length(nombres_de_aereolineas)+1)]
      
      # Data frame final
      tabla_f_2 <- data.frame(nombres_de_aereolineas, total_merchandise, total_accumulated_merchandise, percentage_merchandise, percentage_accumulated_merchandise)
      
      colnames(tabla_f_2) <- c("Aereolinea","Frecuencia Absoluta", "Frecuencia Absoluta Acumulativa", "Frecuencia Relativa", "Frecuencia Relativa Acumulativa")
      
      View(tabla_f_2) # TERMINADA LA TABLA DE FRECUENCIA 2
          
        
# 2. Tablas de frecuancia de pasajeros que desidieron emplear las areolineas
    ## Pendiente
      
  # Dos tablas de frecuencia No agrupada basada en variable cuantitativa.
  
  print( 1 + 3.3*(log(sum(trafico_trimestral_por_pais[[c(4)]]),10)))
   
  print(max(trafico_trimestral_por_pais[[c(4)]]))
  
  #logitud de clase
  
  ## Reduccion de datos repertidos La siguite tabla bivariada el los pasajeros y mercacias que se transportanron hacia india durante los 3 años
  
  trafico_trimestral_por_pais <-  tra
  
  long_clase_pasajero <- (max(trafico_trimestral_por_pais[[c(4)]], na.rm=TRUE)-min(trafico_trimestral_por_pais[[c(4)]], na.rm=TRUE)-1)/10
  long_clase_pasajero
  long_clase_mercancia <- (max(trafico_trimestral_por_pais[[c(6)]], na.rm=TRUE)-min(trafico_trimestral_por_pais[[c(6)]], na.rm=TRUE)-1)/10
  long_clase_mercancia
  
  pasajeros_hacia_india <- c(1:10)
  mercancias_hacia_india <- c(1:10)
  
  
  for (i in 1:10) {
    pasajeros_hacia_india[i] <- nrow(trafico_trimestral_por_pais[trafico_trimestral_por_pais$`PASSENGERS TO INDIA` > long_clase_pasajero*(i-1) & trafico_trimestral_por_pais$`PASSENGERS TO INDIA` <= long_clase_pasajero*(i), ])
    mercancias_hacia_india[i] <- nrow(trafico_trimestral_por_pais[trafico_trimestral_por_pais$`FREIGHT TO INDIA` > long_clase_mercancia*(i-1) & trafico_trimestral_por_pais$`FREIGHT TO INDIA` <= long_clase_mercancia*(i), ])
  }
  pasajeros_hacia_india
  mercancias_hacia_india
  tabla_f_3 <- table(pasajeros_hacia_india,mercancias_hacia_india)
  tabla_f_3  
  tabla_f_b_1 <- as.data.frame.matrix(tabla_f_3)
  View(tabla_f_b_1)
  #    pasajeros_hacia_india[i] <- length(trafico_trimestral_por_pais[[c(4)]][which(trafico_trimestral_por_pais[[c(4)]]  "")])
  
  # Dos tablas de frecuencia agrupada basada en variable cuantitativa.
  
  #XXXXXXXXXXXXXXXX
  
  # Una tabla de frecuencia bivariada basada en variable cualitativa vs. cualitativa.
  
  setwd('C:/Users/user/Desktop/Estadística y probabilidad/Carpeta R')
  
  #tabla cualitativa cualitativa
  
  datos <- read_excel("datasets/Citypairwise Quarterly International  Air Traffic To And From The Indian Territory.csv")
  head(datos)
  city1 <- datos[[c(3)]]
  table(city1)
  city2<-datos[[c(4)]]
  table(city2)
  
  #la tabla representa las ciudades a las que se viajó desde ciudades dentro de india hacia fuera de india, 
  #el número máximo es 8 ya que se realizaron viajes en todos los trimestres de los dos años
  #esta información puede ayudar a saber hacia donde posiblemente alguien puede haber viajado dependiendo de la ciudad de la que partió
  #disminuyendo los posibles destinos
  table(city2,city1)  #tabla bivariada
  
  
  #Tabla cualitativa-cuantitativa
  #relaciona el número de pasajeros hacia fuera de la india con los trimestres, con esta infomración podremos encontrar
  #los trimestres del año en el que se realizan más viajes
  viajes <- datos[[c(6)]]
  trimestres <- datos[[c(2)]]
  
  hist(viajes,plot=FALSE,breaks='Sturges')  #realizamos el histograma usando la regla de Sturges
  TBDF <- hist(viajes,plot=FALSE,breaks='Sturges') 
  table.freq(TBDF)
  tabla <- table.freq(TBDF)
  tabla
  
  #obervado la tabla vemos los intervalos y las frecuencias aboslutas de cada una
  #con esta información, evaluamos cada elemento del conjunto de datos de viajes y de acuerdo 
  #a qué intervalo se encuentre a cada valor se le igualará a su marcade clase, mientras los demá svalores se igualarán a 0
  #para así sumar todos los vectores obtenidos rrellenando los espacios con 0 con cada valor correspondiente
  
  viajes1=ifelse (viajes<=20000, 10000, 0) 
  
  viajes2=ifelse (viajes<=40000 & viajes>20000,30000,0)
  viajes3=ifelse (viajes<=60000 & viajes>40000,50000,0)
  viajes4=ifelse (viajes<=80000 & viajes>60000,70000,0)
  viajes5=ifelse (viajes<=100000 & viajes>80000,90000,0)
  viajes6=ifelse (viajes<=120000 & viajes>100000,110000,0)
  viajes7=ifelse (viajes<=140000 & viajes>120000,130000,0)
  viajes8=ifelse (viajes<=160000 & viajes>140000,150000,0)
  viajes9=ifelse (viajes<=180000 & viajes>160000,170000,0)
  viajes10=ifelse (viajes<=200000 & viajes>180000,190000,0)
  viajes11=ifelse (viajes<=220000 & viajes>200000,210000,0)
  viajes12=ifelse (viajes<=240000 & viajes>220000,230000,0)
  viajes13=ifelse (viajes<=260000 & viajes>240000,250000,0)
  viajes14=ifelse (viajes<=280000 & viajes>260000,270000,0)
  viajes15=ifelse (viajes<=300000 & viajes>280000,290000,0)
  viajes16=ifelse (viajes<=320000 & viajes>300000,310000,0)
  viajes17=ifelse (viajes<=340000 & viajes>320000,330000,0)
  
  viajesfinal=viajes1+viajes2+viajes3+viajes4+viajes5+viajes6+viajes7+viajes8+viajes9+viajes10+viajes11+viajes12+viajes13+viajes14+viajes15+viajes16+viajes17
  viajesfinal
  # de esta manera la tabla de viajes ahora se puede usar como una variable cualitativa
  table(trimestres,viajesfinal)
  #como vemos los viajes de menosde 10000 personas son los más comunes y son mayores en los ultimos dos trimestres de los años.
  #con los valores medios y la cantidad de viajes con esas cantidades que se han hecho es fácil aproximar alrededor 
  # de cuantas personas han viajado en cada cuarto de año sin requerir de los datos exactos
  
  # Una tabla de frecuencia bivariada basada en variable cuantitativa vs. cuantitativa.
  
  Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Countrywise Quarterly International Air Traffic To And From The Indian Territory.csv")
  
  trafico_trimestral_por_pais <- Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory
  
  
  #PASAJEROS HACIA LA INDIA (Variable 1)
  
  #Número de clases para la variable Pasajeros hacia la India
  print( 1 + 3.332*(log(length(trafico_trimestral_por_pais[[c(4)]]),10)))
  
  Passenger_to_India1 <- trafico_trimestral_por_pais[[c(4)]]
  
  #Rango de la variable
  RAN_Passenger_to_India1 <- max(Passenger_to_India1, na.rm=TRUE)-min(Passenger_to_India1, na.rm=TRUE)
  
  #Longitud de cada clase
  print((RAN_Passenger_to_India1-1)/10)
  
  
  #CARGA HACIA LA INDIA (Variable 2)
  
  #Número de clases para la variable Carga hacia la India
  print( 1 + 3.332*(log(length(trafico_trimestral_por_pais[[c(6)]]),10)))
  
  Freight_to_India <- trafico_trimestral_por_pais[[c(6)]]
  
  #Rango de la variable
  RAN_Freight_to_India <- max(Freight_to_India, na.rm=TRUE)-min(Freight_to_India, na.rm=TRUE)
  
  #Longitud de cada clase
  print(RAN_Freight_to_India/10)
  
  #CREACIÓN DE LA TABLA
  
  dato50 <- read_xlsx("datasets/Tabla bivariada - Pasajeros hacia la India - Mercancía hacia la India.xlsx")
  
  View(dato50)
  
  # Calcular: Cuartiles, Media, Moda, Rango, Varianza, Desviación Estándar y Coeficiente de variación de una variable cuantitativa.
  
  Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Countrywise Quarterly International Air Traffic To And From The Indian Territory.csv")
  
  trafico_trimestral_por_pais <- Countrywise_Quarterly_International_Air_Traffic_To_And_From_The_Indian_Territory
  
  View(trafico_trimestral_por_pais)    
  
  # Cálculo de cuartiles
  
  Passenger_to_India2 <- trafico_trimestral_por_pais[[c(4)]]
  
  quantile(Passenger_to_India2, props=c(0.25, 0.5, 0.75, 1))
  
  # Media
  
  mean(Passenger_to_India2)
  
  # Moda
  
  getmode <- function(v) {
    uniqv <- unique(v)
    uniqv[which.max(tabulate(match(v, uniqv)))]
  }
  
  getmode(Passenger_to_India2)
  
  # Rango
  
  print(max(Passenger_to_India2, na.rm=TRUE)-min(Passenger_to_India2, na.rm=TRUE))
  
  # Varianza
  
  var(Passenger_to_India2)
  
  # Desviación estándar
  
  sd(Passenger_to_India2)
  
  #Coeficiente de variación
  
  print(var(Passenger_to_India2)/mean(Passenger_to_India2))
  
  # Gráfico de Dispersión, Análisis de Correlación e Interpretación.
    View(trafico_trimestral_por_pares_de_ciudad)  
    plot( xlab = "Mercancias [Tn]",
          ylab = "Pasajeros [Personas]", x=trafico_trimestral_por_pares_de_ciudad$`PASSENGERS FROM CITY1 TO CITY2`, 
          y=trafico_trimestral_por_pares_de_ciudad$`FREIGHT FROM CITY1 TO CITY2`)
  
  # Generación de modelos (Lineal y No Lineal) e Interpretación.    

  
  
  
