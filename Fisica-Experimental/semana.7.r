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


#Renombramiento del nombre de una columna
colnames(datos_d_ma)
#colnames(datos_d_ma)[10] <- "angulo"
#colnames(datos_d_ma)


# 1. Analisis disco naranja
ncol(datos_d_ma); nrow(datos_d_ma)
ncol(datos_d_me); nrow(datos_d_me)

# 1.1. Disco mayor
datos_d_ma_pre_impacto <- datos_d_ma[datos_d_ma$frame < 281, ]
datos_d_ma_post_impacto <- datos_d_ma[datos_d_ma$frame > 281, ]

plot(datos_d_n_pre_impacto[["t"]],datos_d_n_pre_impacto[["x"]] )
plot(datos_d_n_post_impacto[["t"]],datos_d_n_post_impacto[["x"]])

plot(datos_d_n_pre_impacto[["t"]],datos_d_n_pre_impacto[["y"]] )
plot(datos_d_n_post_impacto[["t"]],datos_d_n_post_impacto[["y"]])

plot(datos_d_n_pre_impacto[["t"]],datos_d_n_pre_impacto[["angulo"]] )
plot(datos_d_n_post_impacto[["t"]],datos_d_n_post_impacto[["angulo"]])


plot(datos_d_n_pre_impacto[["t"]],datos_d_n_pre_impacto[["r"]] )
plot(datos_d_n_post_impacto[["t"]],datos_d_n_post_impacto[["r"]])



# 1.2. Disco azul
datos_d_a_pre_impacto <- datos_d_a[datos_d_a$frame < 624, ]
datos_d_a_post_impacto <- datos_d_a[datos_d_a$frame > 624, ]

plot(datos_d_a_pre_impacto[["t"]],datos_d_a_pre_impacto[["x"]] )
plot(datos_d_a_post_impacto[["t"]],datos_d_a_post_impacto[["x"]])

plot(datos_d_a_pre_impacto[["t"]],datos_d_a_pre_impacto[["y"]] )
plot(datos_d_a_post_impacto[["t"]],datos_d_a_post_impacto[["y"]])

plot(datos_d_a_pre_impacto[["t"]],datos_d_a_pre_impacto[["angulo"]] )
plot(datos_d_a_post_impacto[["t"]],datos_d_a_post_impacto[["angulo"]])

plot(datos_d_a_pre_impacto[["t"]],datos_d_a_pre_impacto[["r"]] )
plot(datos_d_a_post_impacto[["t"]],datos_d_a_post_impacto[["r"]])


#Velocidad angula experimental

ggplot(datos_d_a, aes(x=t, y=angulo)) + geom_point() + theme_light()
ggplot(datos_d_n, aes(x=t, y=angulo)) + geom_point() + theme_light()



summary(lm(angulo ~ t, data = datos_d_a_post_impacto))
#Por lo tanto en el disco naranja
# angulo = 37.005 + 368.765*t
#Entonces la velocidad angular experimental del disco azul post impacto es
v_a_exp_p_i_d_a = 368.765*pi/180 #rad/s
v_a_exp_p_i_d_a #rad/s

summary(lm(angulo ~ t, data = datos_d_n_post_impacto))
#Por lo tanto en el disco azul
# angulo = -142.995 + 368.765*t

#Entonces la velocidad angular experimental del disco naranja post impacto es
v_a_exp_p_i_d_n = 368.765*pi/180 #rad/s 
v_a_exp_p_i_d_n #rad/s

#Finalmente

v_angular_experimental = (v_a_exp_p_i_d_a +v_a_exp_p_i_d_n)/2 #rad/s
v_angular_experimental #rad/s
v_angular_experimental = 6.4 #rad/s


#Producto RxU todo el post impacto
RxU_1_p_i <- datos_d_n_post_impacto[["y"]]*datos_d_n_post_impacto[["vx"]] - datos_d_n_post_impacto[["x"]]*datos_d_n_post_impacto[["vy"]] 
RxU_2_p_i <- datos_d_a_post_impacto[["y"]]*datos_d_a_post_impacto[["vx"]] -  datos_d_a_post_impacto[["x"]]*datos_d_a_post_impacto[["vy"]] 


RxU_1_p_i
RxU_2_p_i


#Radio para sistema de referecia centro de masa
# Radio del disco naranja 
R_n <- (datos_d_n_post_impacto[["x"]]^2 + datos_d_n_post_impacto[["y"]]^2)^(0.5)
R_n
plot(datos_d_n_post_impacto[["t"]], R_n)
mean(R_n)

#Radio de disco azul
R_a <- (datos_d_a_post_impacto[["x"]]^2 + datos_d_a_post_impacto[["y"]]^2)^(0.5)
R_a
mean(R_a)
plot(datos_d_a_post_impacto[["t"]], R_a)
R_a

R_f= (R_a + R_n)/2
plot(datos_d_a_post_impacto[["t"]], R_f)
mean(R_f)
#Por lo tanto el radio de las esferas es 0.17 metros

#Velocidad angular teorica post impacto

v_angular_teorica <- (RxU_1_p_i + RxU_2_p_i)/(3*R_f^2)
plot(datos_d_a_post_impacto[["t"]], v_angular_teorica) #\rightsquare
mean(v_angular_teorica)
#Por lo tanto la velocidad angular teorica es 4.21
v_angular_teorica = 4.2


#Por lo tanto el error porcentual de la velocidad angular es

error_porcentual <- (v_angular_experimental/v_angular_teorica - 1)*100
error_porcentual #%


















