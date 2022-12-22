#-------------------#
#     Sesión 4      #
#     Regresión     #
#  Mg. Javier Vega  #
#-------------------#
#     Sesión 15.2   #
#-------------------#
# Inicialización
#-------------------------------------
# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
rm(list = ls())

# Cambiar el directorio de trabajo
setwd("C:/Users/CARLOS RAUL/Documents/MyGithub/r-probability-and-statistics/Estadistica_y_Probabilidad-1")

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

options(scipen=999) # para remover la notacion cientifica

# Uso de Librerías

library(readxl)

library(car)

########################################
#                                      #
# CASO 1: Ventas de los representantes #
#                                      #
########################################
# El gerente de una empresa quiere evaluar el desempeño de los 
# representantes de ventas de una empresa. Cada uno de los
# representantes es responsable de un territorio y el gerente
# decide medir su desempeño usando las ventas anuales del producto
# en el territorio  de ventas.
#
# Variable Dependiente:
# ventas:        ventas en cientos de unidades productos vendidas
#
# Variables Independientes:
# tiempo:        número de meses desde que el representante
#                es empleado de la empresa
# potencial:     ventas del producto de la empresa y productos de la
#                competencia en el territorio de venta
# publicidad:    gastos en dolares de la publicidad en el territorio
# participacion: promedio de participación en el mercado de la 
#                empresa en el territorio en los ultimos cinco años
# cambio:        cambio en la participacion en el mercado de la 
#                empresa en los cinco años anteriores(positivo o negativo)
########################################
# 1. Modelo de Regresión Lineal
########################################
#------------------------------------------------------
# 1.0. Lectura y Preparacion de los datos
#------------------------------------------------------
library(readxl)
datos_ventas <- read_excel("ventas.xlsx")
str(datos_ventas)
head(datos_ventas)  # Para ver el encabezado de la base de datos
attach(datos_ventas)

# Resumiendo la variable dependiente ventas


summary(datos_ventas$ventas)


#------------------------------------------------------
# 1.1. Analisis Descriptivo y Exploratorio
#------------------------------------------------------
#-------------------------------------
# 1.1.1 La variable dependiente
#-------------------------------------
# Histograma de la variable dependiente ventas
hist(ventas,
     nclass=5) # nclass is equivalent to breaks for a scalar or character argument

#-------------------------------------
# 1.1.2 La matriz de correlación
#-------------------------------------
# Explorando relaciones entre las variables numéricas: 
# La matriz de correlación (solo debe tener las variables independientes y sus coeficientes de correlacion)
#  entre las x el coeficiente de correlacion debe estar cercano a 0 (cero)
cor(datos_ventas[c("tiempo", "potencial", "publicidad", 
                   "participacion", "cambio", "ventas")])
#  Ó
# muestra la correlacion a 2 decimales
print(cor(datos_ventas[c("tiempo", "potencial", "publicidad", 
                   "participacion", "cambio", "ventas")]), 2)

M <- round(cor(datos_ventas[c("tiempo", "potencial", "publicidad", 
                              "participacion", "cambio", "ventas")]), digits=2)
M
library('corrplot')  # Para cargar el paquete corrplot
corrplot.mixed(M)

#-------------------------------------
# 1.1.3 La matriz de dispersión simple
#-------------------------------------
# Visualizando las relaciones entre las variables numéricas y no numericas
# Obteniendo La matriz de dispersión (es igual a la matriz de correlación,
#  pero tambien tiene
#  la variable dependiente y su correlacion con cada variable independiente)
#  entre x e y, el valor de correlacion debe estar cercano a 1 o a -1
plot(datos_ventas[c("tiempo", "potencial", "publicidad",
                    "participacion", "cambio", "ventas")],
     main="Gráfico: Matriz de Dispersión")
#  Ó
# esta es otra forma
pairs(datos_ventas[c("tiempo", "potencial", "publicidad",
                    "participacion", "cambio", "ventas")],
      main="Otra Matriz de Dispersión")
#  Ó
# esta es otra forma
pairs(datos_ventas,
      main="Matriz Completa de Dispersión")

#-------------------------------------
# 1.1.4 La matriz de Dispersión, Histograma y Correlación
#-------------------------------------
library(GGally)
ggpairs(datos_ventas[c("tiempo", "potencial", "publicidad",
                       "participacion", "cambio", "ventas")],
        title="GGally: Matriz de Dispersión, Histograma y Correlación")

# otra forma
library(psych)
pairs.panels(datos_ventas,
             pch=21,
             main="psych: Matriz de Dispersión, Histograma y Correlación")


#-----------------------------------------------------
# 1.2. Obtención de Modelos
#-----------------------------------------------------
#------------------------------------------------------
# 1.2.1. Modelo de Regresión Lineal Simple 
#        (no se estandariza)
#------------------------------------------------------
model <- lm(ventas ~ tiempo,
             data = datos_ventas)
model1 <- lm(ventas ~ tiempo,
             data = datos_ventas)
model2 <- lm(ventas ~ potencial,
             data = datos_ventas)
model3 <- lm(ventas ~ publicidad + cambio,
             data = datos_ventas)
model4 <- lm(ventas ~ participacion + tiempo,
             data = datos_ventas)
model5 <- lm(ventas ~ participacion + tiempo + potencial,
             data = datos_ventas)
model6 <- lm(ventas ~ participacion + tiempo + potencial + cambio,
             data = datos_ventas)

model <- lm(ventas ~ tiempo + potencial + publicidad + participacion + cambio, # modelo
            data = datos_ventas) # dataset
#  Ó
# es tambien lo mismo (es equivalente)
model <- lm(ventas ~ . ,  # el punto (.) significa o indica todas las demas variables
            data = datos_ventas)
str(model)
coef(model) # muestra solo los coeficientes
model$coefficients
model$coe
model$call
model # Coeficientes estimados (las betas)

summary(model) # Viendo con más detalle los coeficientes estimados del modelo
summary(model)$coef # valores de los betas

#-----------------------------------------------------
# 1.2.y. Evaluación de la perfomance del modelo
#-----------------------------------------------------
# Valores ajustados o predichos según modelo
# predecir la clase
fitted(model)
#  Ó
model$fitted.values
#  Ó
predict(model, datos_ventas)
#  Ó
p <- predict(model,  # que modelo voy a usar
             datos_ventas) # en que data lo voy a usar para predecir mi y(estimado)
str(p)
p
head(p, 10)

# Mostrar valores reales y ajustados (predichos)
cbind(ventas,
      p) # union de la prediccion a la data original

# Gráfica de valor observado vs valor ajustado
plot(ventas, 
     main="Ventas observadas (negro) y ventas predichas (rojo)", 
     xlab="Observación", 
     type="b", 
     col="black")
lines(fitted(model),
      type="b",
      col="red") # Similar lines(p,type="b",col=2) # modelo predecido

#-----------------------------------------------------
# 1.3. Calcular el RMSE (estimacion del error cuadratico medio)
#        (raiz del error cuadratico medio)
#-----------------------------------------------------
error <- ventas - p
error
RMSE1 <- sqrt(mean(error^2))
RMSE1
#sqrt(sum(error^2)) / 25
#sqrt(sum(error^2)) / 5


#------------------------------------------------------
# 1.4. Verificación (Evaluacion) de Supuestos
#------------------------------------------------------
#------------------------------------------------------
# 1.4.1. Gráfica de residuales
#------------------------------------------------------
#  si el patron esta definido => el modelo no es bueno
residuals(model) # la diferencia entre y e y(estimado)
#  Ó
model$residuals
#  Ó
error

plot(residuals(model),
     main="Residuos",
     xlab="Observación",
     type="b")
abline(h=0,
       col="red")
# en la grafica no hay un patron definido, por lo tanto pasa


#------------------------------------------------------
# 1.4.2. Gráfica de residuos vs valores ajustados para 
#------------------------------------------------------
#  detectar Homocedasticidad (homogenidad de variables) / Heterocedasticidad
#  no deberia haber ningun comportamiento, caso contrario no debes usar el modelo
plot(fitted(model),    # valores ajustados
     residuals(model)) # valores residuales
abline(h=0,
       col="red")
# en la grafica no hay comportamiento, por lo tanto pasa


#------------------------------------------------------
# 1.4.3. Gráfica de normalidad Q-Q
#------------------------------------------------------
# lo normal es que aparezca alrededor de la diagonal => es distribucion normal
qqnorm(scale(residuals(model)), 
       main = "Grafico de Normalidad Q-Q",
       ylim=c(-1.5,2.5))
qqline(scale(residuals(model)),
       col="blue")
# en la grafica aparecen alrededor de la diagonal, por lo tanto pasa

# Sin escala
qqnorm(residuals(model), 
       main = "Grafico de Normalidad Q-Q")
qqline(residuals(model),
       col="blue")


#------------------------------------------------------
# 1.5. Selección de variables
#------------------------------------------------------
summary(model)
# los asteriscos en la seccion coefficientes (p-value), indican que variable 
#  es mas significativa
coef(model)

# Usando el método Backward
# empieza con todas las x y despues comienza a disminuir las x, quitando las mas significativas
step(model,
     direction = "backward")

# Usando el método Forward
# empieza con cada x(es decir una regresion lineal simple y selecciona el menor p-value)
# despues escoje combinarla con cada una de las x faltantes y selcciona la mas significativa
# se detiene cuando los p-value que quedan son mayores a 0.5 => se queda en el paso anterior
modelf <- lm(ventas ~ 1,
             data = datos_ventas) # defino el modelo inicial
summary(modelf)

step(modelf,
     direction = "forward",
     ~ tiempo + potencial + publicidad + participacion + cambio)

# Usando el método Stepwise
# utiliza la combinacion de los dos modelos
step(model,
     direction = "both") # Stepwise


#------------------------------------------------------
# 1.7. Predicción para nuevos individuos
#------------------------------------------------------
#------------------------------------------------------
# 1.7.1. Predicción para el ingreso de un(1) nuevo vendedor
#------------------------------------------------------
str(datos_ventas)
nuevo1 <- data.frame(tiempo = 60,
                     potencial = 50000,
                     publicidad = 5000 ,
                     participacion = 5,
                     cambio = 0)
nuevo1
# predecir la probabilidad
predict(model,
        nuevo1) # prediccion de lo que deberia vender el nuevo vendedor

#------------------------------------------------------
# 1.7.2. Predicción del ingreso de nuevos vendedores
#        Ingreso desde archivo
#------------------------------------------------------
#library(readxl)
datos_nuevos <- read_excel("ventas-nuevos.xlsx")
datos_nuevos
a <- predict(model,
             datos_nuevos)
a
write.csv(cbind(datos_nuevos,a),
          "Ventas nuevas con prediccion.csv")




#######################################################
# 2. Prediccion de precio
#######################################################
# Como la multicolinealidad afecta el modelo
# Example data set from wine industry where many different variables 
# that could be used to predict wine price e.g. 
# average growing season temperature (AGST), 
# harvest rain, 
# winter rain,
# age of wine, 
# population of France where this wine is producing
wine <- read.csv("wine.csv")
str(wine)

plot(wine$HarvestRain,
     wine$AGST,
     pch=19) # tipo de simbolo en el cruce

cor(wine$HarvestRain,
    wine$AGST)
# el resultado no muestra ninguna correlacion (-0.06449593)

round(cor(wine), 2)

plot(wine$Age,
     wine$FrancePop,
     pch=19)

model_1 <- lm(Price ~ AGST + HarvestRain + WinterRain + Age + FrancePop,
              data=wine) 
summary(model_1)
#library(car)
vif(model_1)

# Eliminando la variable FrancePop (con el más alto VIF)
model_2 <- lm(Price ~ AGST + HarvestRain + WinterRain + Age,
              data=wine) 
summary(model_2)
vif(model_2)

# Eliminando la variable Age (con el más alto VIF)
model_3 <- lm(Price ~ AGST + HarvestRain + WinterRain + FrancePop,
              data=wine)
summary(model_3)
vif(model_3)

# Eliminando la variable Age y la variable FrancePop (con los más altos VIF)
model_4 <- lm(Price ~ AGST + HarvestRain + WinterRain,
              data=wine)
summary(model_4)
# por los rcuadrados nos quedamos con modelo 3
vif(model_4)







########################################
# 2. Árbol de Regresión CART
#    Prediccion con Arbol (solo para variables numericas)
########################################
#------------------------------------------------------
# 2.0. Lectura de datos
#------------------------------------------------------
#library(readxl)
datos_ventas <- read_excel("ventas.xlsx")
str(datos_ventas)
attach(datos_ventas)


#------------------------------------------------------
# 2.1. Analisis Descriptivo y Exploratorio
#------------------------------------------------------
# promedio de las ventas, para el modelo CART empieza con asignar a cada y(estimado) ese valor
mean(ventas)
summary(datos_ventas)


#------------------------------------------------------
# 2.2. Generando Modelo de Regresión CART
#------------------------------------------------------
library(rpart)
arbol1 <- rpart(ventas ~ tiempo + potencial + publicidad + participacion + cambio,  # defino la formula / modelo
                data = datos_ventas, # dataset
                control = rpart.control(minsplit=5, minbucket=1), # parametros
                method = "anova") # para regresion siempre es "anova", sino asume que es arbol de clasificacion
#  Ó
# es tambien lo mismo (es equivalente)
arbol1 <- rpart(ventas ~ . ,  # defino la formula / modelo
                data = datos_ventas, # dataset
                control = rpart.control(minsplit=5, minbucket=1), # parametros
                method = "anova")
# para regresion siempre es "anova", sino asume que es arbol de clasificacion
# definicion de: parametros
# un nodo para que se divida tiene que tener minsplit (default=20)
# un nodo hijo debe tener como minimo minbucket (default = round(minsplit/3 = 6)
# la relacion es 3 a 1 (minsplit a minbucket)
str(arbol1)
arbol1

arbol1$terms # muestra la formula
arbol1$where # en que rama esta cada fila
arbol1$y # los y reales (pero aumentados en 1)
#  Ó
# esta es otra forma
datos_ventas$ventas

# Importancia de las variables, ordenadas en forma decreciente
sort(arbol1$variable.importance,
     decreasing = TRUE)

# Graficando el árbol
library(rpart.plot)
rpart.plot(arbol1,
           digits=3,
           type=2, 
           extra=101,
           cex = .7,
           nn=TRUE)

# uno la prediccion a la data original
cbind(datos_ventas$ventas,
      arbol1$y)


#-----------------------------------------------------
# 2.2.y. Evaluación de la perfomance del modelo
#-----------------------------------------------------
# predecir la clase
# Valores ajustados o predichos según modelo
p.arbol <- predict(arbol1,  # que modelo voy a usar
                   datos_ventas) # en que data lo voy a usar para predecir mi y(estimado)
str(p.arbol)
p.arbol
head(p.arbol, 10)

# Mostrar valores reales y ajustados (predichos)
cbind(ventas,
      p.arbol) # union de la prediccion a la data original

# Gráfica del valor observado vs valor ajustado
plot(ventas,
     main="Ventas observadas (negro) y ventas predichas (rojo)", 
     xlab="Observación", 
     type="b", 
     col=1)
lines(p.arbol,
      type="b",
      col=2) # modelo predecido

#-----------------------------------------------------
# 2.3.2. Calcular el RMSE (estimacion del error cuadratico medio)
#        (raiz del error cuadratico medio)
#-----------------------------------------------------
error <- ventas - p.arbol
RMSE2 <- sqrt(mean(error^2))
RMSE2


#------------------------------------------------------
# 2.7. Predicción para nuevos individuos
#-----------------------------------------------------
#------------------------------------------------------
# 2.7.2. Predicción del ingreso de nuevos vendedores
#        Ingreso desde archivo
#------------------------------------------------------
datos_nuevos <- read_excel("ventas-nuevos.xlsx")
b <- predict(arbol1,
             datos_nuevos)
b
write.csv(cbind(datos_nuevos,b),
          "Ventas nuevas con prediccion arbol.csv")


########################################
# 2.8. Comparación
#      Comparar con el modelo de regresion lineal que es "a"
########################################
cbind(a,  # proyeccion con Regresion Lineal
      b)  # proyeccion con Árbol de Regresión CART
