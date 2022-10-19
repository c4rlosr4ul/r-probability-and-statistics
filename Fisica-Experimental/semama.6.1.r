rm(list = ls())
setwd("../r-probability-and-statistics/Fisica-Experimental/")

library(readr)
library(readxl)



#Angulos entan en grados sexagesimales 



excel_sheets("Semama.6.1.xlsx") #Nombres de las hojas
excel_sheets("Semama.6.2.xlsx") #Nombres de las hojas

#Datos teniendo en cuenta sistema de referencia fijo :p

datos_d_n <- read_excel("Semama.6.2.xlsx", "disco_naranja")
datos_d_a <- read_excel("Semama.6.2.xlsx", "disco_azul")
datos_c_m <- read_excel("Semama.6.2.xlsx", "centro_de_masa") #semama xD :0
datos_p_g_a <- read_excel("Semama.6.2.xlsx", "punto_giratorio_azul")
datos_p_g_n <- read_excel("Semama.6.2.xlsx", "punto_giratorio_naranja")



#1.- Datos teniendo en cuenta sistema de referencia movil al centro de masa :D
datos_d_n <- read_excel("Semama.6.1.xlsx", "disco_naranja")
datos_d_a <- read_excel("Semama.6.1.xlsx", "disco_azul")
datos_p_g_a <- read_excel("Semama.6.1.xlsx", "punto_giratorio_azul")
datos_p_g_n <- read_excel("Semama.6.1.xlsx", "punto_giratorio_naranja")

  datos_d_n

#Limpieza de datos
datos_d_a <- datos_d_a[datos_d_a$frame >= 616 & datos_d_a$frame <= 659, ]
datos_d_a
View(datos_d_a)

datos_d_n <- datos_d_n[datos_d_n$frame >= 616 & datos_d_n$frame <= 659, ]
datos_d_n
View(datos_d_n)

datos_c_m <- datos_c_m[datos_c_m$frame >= 616 & datos_c_m$frame <= 659, ]
datos_c_m
View(datos_c_m)

datos_p_g_a

datos_p_g_a


# 1. Analisis disco naranja
ncol(datos_d_n); nrow(datos_d_n)
ncol(datos_d_a); nrow(datos_d_a)

  # 1.1. Disco naranja
  datos_d_n_pre_impacto <- datos_d_n[datos_d_n$frame <= 624, ]
  datos_d_n_post_impacto <- datos_d_n[datos_d_n$frame >= 624, ]

  plot(datos_d_n_pre_impacto[["t"]],datos_d_n_pre_impacto[["x"]] )
  plot(datos_d_n_post_impacto[["t"]],datos_d_n_post_impacto[["x"]])
  
  plot(datos_d_n_pre_impacto[["t"]],datos_d_n_pre_impacto[["y"]] )
  plot(datos_d_n_post_impacto[["t"]],datos_d_n_post_impacto[["y"]])
  
  # 1.2. Disco azul
  datos_d_a_pre_impacto <- datos_d_a[datos_d_a$frame <= 624, ]
  datos_d_a_post_impacto <- datos_d_a[datos_d_a$frame >= 624, ]

  plot(datos_d_a_pre_impacto[["t"]],datos_d_a_pre_impacto[["x"]] )
  plot(datos_d_a_post_impacto[["t"]],datos_d_a_post_impacto[["x"]])
  
  plot(datos_d_a_pre_impacto[["t"]],datos_d_a_pre_impacto[["y"]] )
  plot(datos_d_a_post_impacto[["t"]],datos_d_a_post_impacto[["y"]])
  

max(datos_d_n_post_impacto[["x"]])  
min(datos_d_n_post_impacto[["x"]])  
  # Secuencia lógica
  #TF <- datos_d_n_post_impacto[datos_d_n_post_impacto$x == max(datos_d_n_post_impacto[["x"]]), ][["t"]]
  #tf <- TF[["t"]]
  # tf
  #Calculo de la velocidad angular
# Velocidad angular disco naranja 
  ti <- datos_d_n_post_impacto[datos_d_n_post_impacto$x == max(datos_d_n_post_impacto[["x"]]), ][["t"]]
  ti
  
  tf <- datos_d_n_post_impacto[datos_d_n_post_impacto$x == min(datos_d_n_post_impacto[["x"]]), ][["t"]]
  tf

  ti <- datos_d_n_post_impacto[datos_d_n_post_impacto$y == max(datos_d_n_post_impacto[["y"]]), ][["t"]]
  ti
  
  tf <- datos_d_n_post_impacto[datos_d_n_post_impacto$y == min(datos_d_n_post_impacto[["y"]]), ][["t"]]
  tf

  
v_angular_teo <-  2*(pi/(tf - ti))

v_angular_teo #Indistinto si se toma a y o x


#Producto R(x)U
RxU_1 <- datos_d_n[["y"]]*datos_d_n[["vx"]] - datos_d_n[["x"]]*datos_d_n[["vy"]]
RxU_2 <- datos_d_a[["y"]]*datos_d_a[["vx"]] - datos_d_a[["x"]]*datos_d_a[["vy"]]

RxU_cm <- datos_c_m[["y"]]*datos_c_m[["vx"]] - datos_c_m[["x"]]*datos_c_m[["vy"]]

RxU_1
RxU_2

RxU_cm


R <- ((datos_d_a[["x"]] + datos_d_n[["x"]])^2 + (datos_d_a[["y"]] + datos_d_n[["y"]])^2 )^(0.5)
R
# Radio de n
R_n <- (datos_d_n_post_impacto[["x"]]^2 + datos_d_n_post_impacto[["x"]]^2)^(0.5)
R_n
  plot(datos_d_n_post_impacto[["t"]], R_n)
#Radio de a
R_a <- (datos_d_a_post_impacto[["x"]]^2 + datos_d_a_post_impacto[["x"]]^2)^(0.5)
R_a
  plot(datos_d_a_post_impacto[["t"]], R_a)
R_a



datos_d_a[["x"]]
datos_d_n[["x"]]
(datos_d_a[["x"]] + datos_d_n[["x"]])^2

plot(datos_d_a[["t"]], R)
# Cuando se emplea un sistema inercial fijo

  v_angular_exp <- (RxU_1 + RxU_2 - 2*RxU_cm)/(3*(R^2))

#Está es teorica :U
#La experememtal es defrente tomar el \theta del tracker
  
  v_angular_exp

  plot(datos_d_a[["t"]], v_angular_exp)

# Cuando se emple un sistema de referencia inercial movil (centro de masa)
  v_angular_exp <- (RxU_1 + RxU_2)/(3*(R^2))
  
  v_angular_exp
  
  plot(datos_d_a[["t"]], v_angular_exp)


error = abs(v_angular_exp/v_angular_teo - 1)*100
error
plot(error)


