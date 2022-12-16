#-------------------#
#     Sesión 4      #
#     Regresión     #
#  Mg. Javier Vega  #
#-------------------#
#     Sesión 15.3   #
#-------------------#
#-------------------------------------
# Inicializacion
#-------------------------------------
# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
rm(list = ls())

# Cambiar el directorio de trabajo
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

library(ISLR)
library(gridExtra)
library(caret)

# Uso de Librer?as
library(splines)
#library(mgcv)
library(gam)
library(rpart)
library(rpart.plot)

################################
#                              #
# CASO 1. Regresión No Lineal  #
#                              #
################################
#----------------------------------------------------------
# 1.0 Lectura y Preparacion de los datos
#----------------------------------------------------------
Boston_datos <- read.csv("Boston.csv",
                         stringsAsFactors=T)
str(Boston_datos)
head(Boston_datos)
Boston_datos <- Boston_datos[,-1]
attach(Boston_datos)

#------------------------------------------------------------------------
# 1.1.z Selección de muestra de entrenamiento (80%) y de Validación (20%)
#------------------------------------------------------------------------
# library(caret)
set.seed(123)
index      <- createDataPartition(medv,
                                  p=0.8,       # porcentaje de entrenamiento
                                  list=FALSE)  # si es TRUE va a una lista
train.data <- Boston_datos[ index, ]           # 407 datos trainig             
test.data  <- Boston_datos[-index, ]           #  99 datos testing

ggplot(train.data, aes(lstat, medv) ) +
  geom_point() +
  stat_smooth()


train.data = Boston_datos
test.data = Boston_datos
#-----------------------------------------------------
# 1.2. Obtención de Modelos
#-----------------------------------------------------
#------------------------------------------------------------------------
# 1.2.1. Regresión Lineal
#------------------------------------------------------------------------
model.lm <- lm(medv ~ lstat,
               data = train.data)
summary(model.lm)

#-----------------------------------------------------
# 1.2.1.y. Evaluación de la perfomance del modelo
#-----------------------------------------------------
prediccion.lm <- predict(model.lm,
                         test.data)

#-----------------------------------------------------
# 1.2.1.3. Indicadores de la perfomance del modelo
#-----------------------------------------------------
#-----------------------------------------------------
# 1.2.1.3.2. Calcular el RMSE (estimacion del error cuadratico medio)
#            (raiz del error cuadratico medio)(Error de predicción)
# 1.2.1.3.3. R cuadrado, R2
#-----------------------------------------------------
data.frame(RMSE = RMSE(prediccion.lm, test.data$medv),
           R2   = R2(prediccion.lm, test.data$medv))

#-----------------------------------------------------
# 1.2.1.3.4. Graficas
#-----------------------------------------------------
ggplot(train.data, aes(lstat, medv) ) +
  geom_point() +
  stat_smooth(method = lm,     # usa modelo lineal
              formula = y ~ x) # y en funcion de x

#------------------------------------------------------------------------
# 1.2.2. Regresión Polinomial
#------------------------------------------------------------------------
#####
p <- lm(medv ~ lstat + I(lstat^2),
        data = train.data)
summary(p)
# ?, es lo mismo
p <- lm(medv ~ poly(lstat, 2, raw = TRUE),
        data = train.data)
summary(p)
# la diferencia radica en que el primero debe ingresarse cada termino, es
#   decir podria crear modelos no jerarquicos, y
#   el segundo los genera automaticamente hasta el numero que se indique, es
#   decir crea un modelo jerarquico

p <- lm(medv ~ poly(lstat, 6),
        data = train.data) 
summary(p)
# puede observarse que se genera hasta x a la sexta. pero esta no es significativa
#####

# Generando Modelo hasta x a la quinta
model.p <- lm(medv ~ poly(lstat, 5),
              data = train.data)
summary(model.p)

#-----------------------------------------------------
# 1.2.2.y. Evaluación de la perfomance del modelo
#-----------------------------------------------------
prediccion.p <- predict(model.p,
                        test.data)

#-----------------------------------------------------
# 1.2.2.3. Indicadores de la perfomance del modelo
#-----------------------------------------------------
#-----------------------------------------------------
# 1.2.2.3.2. Calcular el RMSE (estimacion del error cuadratico medio)
#            (raiz del error cuadratico medio)(Error de predicci?n)
# 1.2.2.3.3. R cuadrado, R2
#-----------------------------------------------------
data.frame( RMSE = RMSE(prediccion.p, test.data$medv),
            R2   = R2(prediccion.p, test.data$medv))

#-----------------------------------------------------
# 1.2.2.3.4. Graficas
#-----------------------------------------------------
ggplot(train.data, aes(lstat, medv) ) +
  geom_point() +
  stat_smooth(method = lm,
              formula = y ~ poly(x, 5))

#------------------------------------------------------------------------
# 1.2.3. Transformación Logística
#------------------------------------------------------------------------
#------------------------------------------------------------------------
# 1.2.3.1 Transformación Logística Aplicando log
#------------------------------------------------------------------------
model.log <- lm(medv ~ log(lstat),
                data = train.data)
summary(model.log)

#-----------------------------------------------------
# 1.2.3.1.y. Evaluación de la perfomance del modelo
#-----------------------------------------------------
prediccion.log <- predict(model.log,
                          test.data)

#-----------------------------------------------------
# 1.2.3.1.3. Indicadores de la perfomance del modelo
#-----------------------------------------------------
#-----------------------------------------------------
# 1.2.3.1.3.2. Calcular el RMSE (estimacion del error cuadratico medio)
#              (raiz del error cuadratico medio)(Error de predicci?n)
# 1.2.3.1.3.3. R cuadrado, R2
#-----------------------------------------------------
data.frame(RMSE = RMSE(prediccion.log, test.data$medv),
           R2   = R2(prediccion.log, test.data$medv))

#-----------------------------------------------------
# 1.2.3.1.3.4. Graficas
#-----------------------------------------------------
ggplot(train.data, aes(lstat, medv) ) +
  geom_point() +
  stat_smooth(method = lm,
              formula = y ~ log(x))

#------------------------------------------------------------------------
# 1.2.3.2 Transformación Logística Aplicando sqrt
#------------------------------------------------------------------------
model.log <- lm(medv ~ sqrt(lstat),
                data = train.data)
summary(model.log)

#-----------------------------------------------------
# 1.2.3.2.y. Evaluación de la perfomance del modelo
#-----------------------------------------------------
prediccion.log <- predict(model.log,
                          test.data)

#-----------------------------------------------------
# 1.2.3.2.3. Indicadores de la perfomance del modelo
#-----------------------------------------------------
#-----------------------------------------------------
# 1.2.3.2.3.2. Calcular el RMSE (estimacion del error cuadratico medio)
#              (raiz del error cuadratico medio)(Error de predicci?n)
# 1.2.3.2.3.3. R cuadrado, R2
#-----------------------------------------------------
data.frame(RMSE = RMSE(prediccion.log, test.data$medv),
           R2   = R2(prediccion.log, test.data$medv))

#-----------------------------------------------------
# 1.2.3.2.3.4. Graficas
#-----------------------------------------------------
ggplot(train.data, aes(lstat, medv) ) +
  geom_point() +
  stat_smooth(method = lm,
              formula = y ~ sqrt(x))




###############################################
#                                             #
# CASO 2. Comparación de modelos no lineales  #
#                                             #
###############################################
# El set de datos Wage del paquete ISRL contiene información sobre 3000 
# trabajadores. Entre las 12 variables registradas se encuentra el salario 
# (wage) y la edad (age)
# Dada la relación no lineal existente entre estas dos variables, 
# se recurre a un modelo polinómico de grado 4 que permita 
# predecir el salario en función de la edad.
#----------------------------------------------------------
# 2.0 Lectura y Preparacion de los datos
#----------------------------------------------------------
library(ISLR)
attach(Wage)
str(Wage)
plot(x = age,
     y = wage,
     pch = 20,
     col = "darkgrey")
write.csv(Wage, "wage.csv")
head(Wage)
Wage$age[1:5]

#-----------------------------------------------------
# 2.2. Obtención de Modelos
#-----------------------------------------------------
#------------------------------------------------------------------------
# 2.2.1. Regresión polin?mica
#------------------------------------------------------------------------
# Diferentes maneras de expresar la misma funcion, para el presente problema
# lm(wage ~ age + I(age^2) + I(age^3) + I(age^4), data = Wage) 
# lm(wage ~ cbind(age + age^2 + age^3 + age^4), data = Wage) 
# lm(wage ~ poly(age, 4, raw = TRUE), data = Wage) 
# lm(wage ~ poly(age, 4), data = Wage)

# Diferencia de raw=TRUE
# Probamos con las 5 primeras filas
# Los coeficientes son diferentes, pero se obtienen las mismas predicciones
poly(Wage$age,
     degree = 4,
     raw = TRUE,
     simple = TRUE)[1:5, ]
# ?
poly(Wage$age,
     degree = 4,
     raw = FALSE,
     simple = TRUE)[1:5, ]

# Modelo polinómico de grado 4 
modelo_poli4 <- lm(wage ~ poly(age, 4),
                   data = Wage)
summary(modelo_poli4)
# modelo que se obtuvo:
# wage = 111.7036 + 447.0679age - 478.3158age^2 + 125.5217age^3 - 77.9112age^4 


#-----------------------------------------------------
# 2.2.1.2 Comparación de modelos
#-----------------------------------------------------
#------------------------------------------------------------------------
# 2.2.1.2.1 Comparación: Por contraste de hipótesis ANOVA
#------------------------------------------------------------------------
# Se ajustan modelos polinómicos de grado 1 a 5 
modelo_1 <- lm(wage ~ age,
               data = Wage) 
modelo_2 <- lm(wage ~ poly(age, 2),
               data = Wage) 
modelo_3 <- lm(wage ~ poly(age, 3),
               data = Wage) 
modelo_4 <- lm(wage ~ poly(age, 4),
               data = Wage) 
modelo_5 <- lm(wage ~ poly(age, 5),
               data = Wage)

anova(modelo_1, modelo_2, modelo_3, modelo_4, modelo_5)
# de acuerdo a los resultados el mejor es el modelo cubico
