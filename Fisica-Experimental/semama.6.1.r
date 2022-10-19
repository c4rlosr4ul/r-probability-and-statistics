rm(list = ls())
setwd("../r-probability-and-statistics/Fisica-Experimental/")

library(readr)
library(readxl)
library(ggplot2)

#Angulos entan en grados sexagesimales 
#Todo lo demas está en el S.I

excel_sheets("Semama.6.1.xlsx") #Nombres de las hojas

#1.- Datos teniendo en cuenta sistema de referencia movil al centro de masa :D
datos_d_n <- read_excel("Semama.6.1.xlsx", "disco_naranja")
datos_d_a <- read_excel("Semama.6.1.xlsx", "disco_azul")

#Limpieza de datos
datos_d_a <- datos_d_a[datos_d_a$frame >= 615 & datos_d_a$frame <= 659, ]
datos_d_a
View(datos_d_a)

datos_d_n <- datos_d_n[datos_d_n$frame >= 615 & datos_d_n$frame <= 659, ]
datos_d_n
View(datos_d_n)


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
  
  plot(datos_d_n_pre_impacto[["t"]],datos_d_n_pre_impacto[["angulo"]] )
  plot(datos_d_n_post_impacto[["t"]],datos_d_n_post_impacto[["angulo"]])
  
  
  
  # 1.2. Disco azul
  datos_d_a_pre_impacto <- datos_d_a[datos_d_a$frame <= 624, ]
  datos_d_a_post_impacto <- datos_d_a[datos_d_a$frame >= 624, ]

  plot(datos_d_a_pre_impacto[["t"]],datos_d_a_pre_impacto[["x"]] )
  plot(datos_d_a_post_impacto[["t"]],datos_d_a_post_impacto[["x"]])
  
  plot(datos_d_a_pre_impacto[["t"]],datos_d_a_pre_impacto[["y"]] )
  plot(datos_d_a_post_impacto[["t"]],datos_d_a_post_impacto[["y"]])
  
  plot(datos_d_a_pre_impacto[["t"]],datos_d_a_pre_impacto[["angulo"]] )
  plot(datos_d_a_post_impacto[["t"]],datos_d_a_post_impacto[["angulo"]])
  

  #Velocidad angula experimental
  
  ggplot(datos_d_a, aes(x=t, y=angulo)) + geom_point() + theme_light()
  ggplot(datos_d_n, aes(x=t, y=angulo)) + geom_point() + theme_light()
  
  summary(lm(angulo ~ t, data = datos_d_a_post_impacto))
   #Por lo tanto en el disco naranja
    angulo = 37.042 + 368.732*t
    #Entonces la velocidad angular experimental del disco azul post impacto es
    v_a_exp_p_i_d_a = 368.732*pi/180 
    v_a_exp_p_i_d_a #rad/s
      
  summary(lm(angulo ~ t, data = datos_d_n_post_impacto))
   #Por lo tanto en el disco azul
    angulo = -142.958 + 368.732*t
  
    #Entonces la velocidad angular experimental del disco naranja post impacto es
    v_a_exp_p_i_d_n = 368.732*pi/180 
    v_a_exp_p_i_d_n #rad/s
    
  #Finalmente
    v_angular_experimental = 6.43 #rad/s
    
    

#Producto R(x)U todo el tramo
RxU_1 <- datos_d_n[["y"]]*datos_d_n[["vx"]] - datos_d_n[["x"]]*datos_d_n[["vy"]]
RxU_2 <- datos_d_a[["y"]]*datos_d_a[["vx"]] - datos_d_a[["x"]]*datos_d_a[["vy"]]

RxU_1
RxU_2
  
#Producto R(x)U todo el post impacto
RxU_1_p_i <- datos_d_n_post_impacto[["y"]]*datos_d_n_post_impacto[["vx"]] - datos_d_n_post_impacto[["x"]]*datos_d_n_post_impacto[["vy"]] 
RxU_2_p_i <- datos_d_a_post_impacto[["y"]]*datos_d_a_post_impacto[["vx"]] -  datos_d_a_post_impacto[["x"]]*datos_d_a_post_impacto[["vy"]] 


RxU_1_p_i
RxU_2_p_i
  

#Radio para sistema de referecia centro de masa
  # Radio del disco naranja 
  R_n <- (datos_d_n_post_impacto[["x"]]^2 + datos_d_n_post_impacto[["y"]]^2)^(0.5)
  R_n
    plot(datos_d_n_post_impacto[["t"]], R_n)
  #Radio de disco azul
  R_a <- (datos_d_a_post_impacto[["x"]]^2 + datos_d_a_post_impacto[["y"]]^2)^(0.5)
  R_a
    plot(datos_d_a_post_impacto[["t"]], R_a)
  R_a
  
  R_f=(R_a^2 +R_n^2)^(0.5)
  R_f
    plot(datos_d_a_post_impacto[["t"]], R_f)
  mean(R_f)
    #Por lo tanto el radio de las esferas es 0.17 metros

#Velocidad angular teorica post impacto
  
v_angular_teorica <- (RxU_1_p_i + RxU_2_p_i)/(3*R_f^2)
  plot(datos_d_a_post_impacto[["t"]], v_angular_teorica) #\rightsquare
  mean(v_angular_teorica)
  #Por lo tanto la velocidad angular teorica es 2.12
  v_angular_teorica = 2.12


#Por lo tanto el error porcentual de la velocidad angular es
  
  error_porcentual <- (v_angular_experimental/v_angular_teorica - 1)*100
  error_porcentual
  
  
  















