rm(list = ls())
setwd("../r-probability-and-statistics/Fisica-Experimental/")

library(readr)
library(readxl)
library(ggplot2)

#Angulos entan en grados sexagesimales 
#Todo lo demas está en el S.I

excel_sheets("Semana.7.1.xlsx") #Nombres de las hojas


#1.- Datos teniendo en cuenta sistema de referencia movil al centro de masa :D
  datos_d_me <- read_excel("Semana.7.1.xlsx", "disco_menor")
  datos_d_ma <- read_excel("Semana.7.1.xlsx", "disco_mayor")
  
  View(datos_d_ma)
  View(datos_d_me)

#Limpieza de datos
  datos_d_ma <- datos_d_ma[datos_d_ma$frame > 270 & datos_d_ma$frame < 295, ]
  datos_d_ma
  View(datos_d_ma)
  
  datos_d_me <- datos_d_me[datos_d_me$frame > 270 & datos_d_me$frame < 295, ]
  datos_d_me
  View(datos_d_me)
##2. Calculo del momento angular experimental
  
#2.1 Momento angular del DISCO MAYOR tomando como sistema de referencia su centro
  
  datos_d_ma_DMA <- read_excel("Semana.7.1.xlsx", "punto_giratorio_mayor_DMA")[read_excel("Semana.7.1.xlsx", "punto_giratorio_mayor_DMA")$frame > 270 & read_excel("Semana.7.1.xlsx", "punto_giratorio_mayor_DMA")$frame < 295, ]
  
  View(datos_d_ma_DMA)
  
  plot(datos_d_ma_DMA[["t"]], datos_d_ma_DMA[["angulo"]])

  #Separando antes y despues del impacto 
    
    pre_i <- datos_d_ma_DMA_pre_impacto <- datos_d_ma_DMA[datos_d_ma_DMA$frame < 281, ]
    post_i<- datos_d_ma_DMA_post_impacto <- datos_d_ma_DMA[datos_d_ma_DMA$frame > 281, ]
    
    #Graficas angulo barrido vs. tiempo
    plot(datos_d_ma_DMA_pre_impacto[["t"]], datos_d_ma_DMA_pre_impacto[["angulo"]])
    plot(datos_d_ma_DMA_post_impacto[["t"]], datos_d_ma_DMA_post_impacto[["angulo"]])
    
      #PRE-IMPACTO
      summary(lm(angulo ~ t, data = datos_d_ma_DMA_pre_impacto))
        #Por lo tanto la velocidad angular: velocidad_angular = 105.351*t - 117.6163 grados_sexagesimales/t
        velocidad_angular_dma <- 105.351*(2*pi/180) #rad/s 
        velocidad_angular_dma #=3.6 rad/s
        
      #POST-IMPACTO
      summary(lm(angulo ~ t, data = datos_d_ma_DMA_post_impacto))
      
        #Por lo tanto la velocidad angular: velocidad_angular = 243.624*t - 169.496 grados_sexagesimales/t
        velocidad_angular_dma <- 243.624*(2*pi/180) #rad/s 
        velocidad_angular_dma #=8.5 rad/s
    
#2.2  Momento angular del DISCO MENOR tomando como sistema de referencia su centro
    
    datos_d_me_DME <- read_excel("Semana.7.1.xlsx", "punto_giratorio_menor_DME")[read_excel("Semana.7.1.xlsx", "punto_giratorio_menor_DME")$frame > 270 & read_excel("Semana.7.1.xlsx", "punto_giratorio_menor_DME")$frame < 295, ]
    
      View(datos_d_me_DME)
    
    plot(datos_d_me_DME[["t"]], datos_d_me_DME[["angulo"]])
    
    #Separando antes y despues del impacto 
    
    pre_i <- datos_d_me_DME_pre_impacto <- datos_d_me_DME[datos_d_me_DME$frame < 281, ]
    post_i<- datos_d_me_DME_post_impacto <- datos_d_me_DME[datos_d_me_DME$frame > 281, ]
    
    plot(datos_d_me_DME_pre_impacto[["t"]], datos_d_me_DME_pre_impacto[["angulo"]])
    plot(datos_d_me_DME_post_impacto[["t"]], datos_d_me_DME_post_impacto[["angulo"]])
    
    summary(lm(angulo ~ t, data = datos_d_me_DME_post_impacto))
    
    #Por lo tanto la velocidad angular: velocidad_angular = 498.382*t - 37.600 grados_sexagesimales/t
    velocidad_angular_dme <- 498.382*(2*pi/180) #rad/s 
    velocidad_angular_dme #=17.3 rad/s

















