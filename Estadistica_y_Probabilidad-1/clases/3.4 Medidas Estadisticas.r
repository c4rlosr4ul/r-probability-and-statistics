#-----------------------------#
#          Sesión 3           #
#  Medidas Tendencia Central  #
#      Medidas de Posicion    #
#    Medidas de Variabilidad  #
#    Medidas de Correlacion   #
#    Analizando las Graficas  #
#       Mg. Javier Vega       #
#-----------------------------#
# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
rm(list = ls()) # borra todo


# Cambiar el directorio de trabajo
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# ---
#---- Dataset ----
# ---
# Esta base de datos cuenta con 6 variables de
#  un grupo de 36 estudiantes de la universidad
# edad del estudiante (años)
# peso del estudiante (kilogramos)
# altura del estudiante (centímetros)
# sexo del estudiante (Hombre, Mujer)
# muneca: perímetro de la muñeca derecha (centímetros)
# biceps: perímetro del biceps derecho (centímetros)

datos <- read.table(file="medidas_cuerpo.txt", header=T)
dim(datos)
dim(datos)[1]
nrow(datos)
dim(datos)[2]
ncol(datos)

head(datos)
tail(datos)
str(datos)
summary(datos)
class(datos)


# ---
#---- Medidas de Tendencia Central ----
# ---
# --- 1.0 ---
# Media 
# mean(x, na.rm = FALSE)
#  x : indica la variable de interés
#  na.rm : FALSE (Default) / TRUE significa que se deben remover
#          las observaciones con NA
edad <- c(18, 23, 26, 32, NA, 32, 29)
# Error
mean(x=edad)
mean(x=edad, na.rm=TRUE)

# Altura media general
mean(datos$altura)

# Altura media pero diferenciando por sexo
# Para dividir el vector de altura según la variable sexo,
#  usar la función split y el resultado será una lista con
#  tantos elementos como niveles tenga la variable sexo.
# Luego a cada uno de los elementos de esa lista se le
#  aplica la función mean con la ayuda de sapply (lista
#  o vector) o tapply (combinacion unica de valores)
table(datos$sexo)
split(x=datos$altura, f=datos$sexo)
sapply(split(x=datos$altura, f=datos$sexo), mean)
## 179.0778 164.0333

# Error
tapply(split(x=datos$altura, f=datos$sexo), mean)


# --- 2.0 ---
# Mediana 
# median(x, na.rm = FALSE)
#  x : indica la variable de interés
#  na.rm : FALSE (Default) / TRUE significa que se deben remover
#          las observaciones con NA
median(x=datos$edad)

# El resultado anterior tambien se pudo haber obtenido con
quantile(x=datos$edad, probs=0.5)


# --- 3.0 ---
# Moda 
# Calcular la moda para la variable edad de la base de datos
# Se construye una tabla de frecuencias con la función table

tabla <- table(datos$edad)
tabla
# Al observar la tabla anterior, hay desorden, entonces ordenamos

sort(tabla, decreasing=TRUE)



# ---
#---- Medidas de Posicion ----
# ---
# Cuantiles
# quantile(x, probs, na.rm = FALSE)
#  x : indica la variable de interés
#  na.rm : FALSE (Default) / TRUE significa que se deben remover
#          las observaciones con NA
#  probs : sirve para definir los cuantiles de interés

# Para obtener cualquier cuantil (percentil 5, la mediana,
#  el cuartil 3 y el decil 8)
quantile(x=datos$altura, probs=c(0.05, 0.5, 0.75, 0.8))



# ---
#---- Medidas de Variabilidad ----
# ---
datos <- read.table(file = 'D:/Data Learning/R/Estadistica/aptos.csv',
                    header = TRUE, sep = ',')
head(datos)
summary(datos)

# precio: precio de venta del apartamento (millones)
# mt2: área del apartamento (metros cuadrados)
# ubicacion: ubicación del aparamentos en la ciudad (cualitativa)
# estrato: nivel socioeconómico donde está el apartamento (2 a 6)
# alcobas: número de alcobas del apartamento
# banos: número de baños del apartamento
# balcon: si el apartamento tiene balcón (si o no)
# parqueadero: si el apartamento tiene parqueadero (si o no)
# administracion: valor mensual del servicio de administración (millones)
# avaluo: valor del apartamento en escrituras (millones)
# terminado: si el apartamento se encuentra terminado (si o no)

# --- 1.0 ---
# Rango 
# range(x, na.rm = FALSE)
#  x : indica la variable de interés
#  na.rm : FALSE (Default) / TRUE significa que se deben remover
#          las observaciones con NA
range(datos$precio)
range(datos$precio)[1]
range(datos$precio)[2]

# --- 1.1
# utilizando el operador pipe %>%, el cual se puede leer como
#  “entonces” y permite escribir código que cuenta una historia
install.packages("dplyr")
library(dplyr)
datos %>%
  select(precio) %>%
  range()
# El código anterior se puede leer así:
#  Tome los datos, entonces seleccione el precio, entonces
#  calcule el rango.

# --- 1.2
# Rango para la variable precio de los apartamentos pero diferenciado
#  por el estrato.
datos %>% 
  group_by(estrato) %>% 
  summarise(el_rango=max(precio)-min(precio))
# Tome los datos, entonces agrúpelos por estrato, entonces haga un
#  resumen llamado el_rango que se obtiene de restar el mínimo
#  de precio al máximo.


# --- 2.0 ---
# Varianza
# Mide qué tanto se alejan las observaciones en relación al
#  promedio y se mide en unidades cuadradas.
# var(x, na.rm = FALSE)
#  x : indica la variable de interés
#  na.rm : FALSE (Default) / TRUE significa que se deben remover
#          las observaciones con NA

# Error, porque hay columnas cualitativas
var(datos)
str(datos)

var(datos$precio)
var(datos[, 2])
var(datos[, 5])
var(datos[, c(2, 5)])

# --- 2.1
var(datos[, c(1, 2, 10)])
datos %>% 
  select(precio, mt2, avaluo) %>% 
  var()

# --- 2.2
# Determinar cuál ubicación en la ciudad presenta mayor varianza
#  en los precios de los apartamentos y cuántos apartamentos hay
#  en cada ubicación
datos %>% 
  group_by(ubicacion) %>% 
  summarize(n=n(),
            varianza=var(precio),
            minimo = min(precio),
            maximo = max(precio))

# Boxplot para el precio de los apartamentos dada la ubicación.
boxplot(datos$precio ~ datos$ubicacion,
        ylab='Precio (millones)')
with(datos, boxplot(precio ~ ubicacion,
                    ylab='Precio (millones)'))

# La sd() se aplica sólo a vectores mientras que la var()
#  se puede aplicar tanto a vectores como a marcos de datos


# --- 3.0 ---
# Desviación estándar muestral
# Mide qué tanto se alejan las observaciones en relación al promedio
#  y se mide en las mismas unidades de la variable de interés
# sd(x, na.rm = FALSE)
#  x : indica la variable de interés
#  na.rm : FALSE (Default) / TRUE significa que se deben remover
#          las observaciones con NA

# Desviación estándar muestral para el precio de los apartamentos
sd(datos$precio)
sqrt(var(datos$precio))


# --- 3.1
# Calcular la desviación estándar poblacional para:
#  12, 25, 32, 15 y 26

Sigma <- function(x) {
  n <- length(x)
  desvi <- sqrt(sum((x-mean(x))^2) / n)
  return(desvi)
} 

y <- c(12, 25, 32, 15, 26)
Sigma(y)
Sigma(c(12, 25, 32, 15, 26))
Sigma(datos$precio)


# --- 4.0 ---
# Coeficiente de variación
coef_var <- function(x, na.rm = FALSE) {
  sd(x, na.rm=na.rm) / mean(x, na.rm=na.rm)
}

w <- c(5, -3, NA, 8, 8, 7)
coef_var(x=w, na.rm = T)



# ---
#---- Medidas de correlación ----
# ---
# Función cor
#cor(x, y, use = "everything",
#    method = c("pearson", "kendall", "spearman"))
#  x, y : vectores cuantitativos.
#  use : indica lo que se debe hacer cuando se presenten registros
#        NA, opciones: everything (Default) / all.obs / complete.obs
#        na.or.complete / pairwise.complete.obs
#  method : coeficiente de correlación a calcular
#          pearson (Default) / kendall / spearman

gasto  <- c(170, 230, 120, 156, 256, NA, 352)
ahorro <- c(45, 30, NA, 35, 15, 65, 15)

cor(gasto, ahorro)
cor(gasto, ahorro, use='complete.obs')


# --- 1.0 ---
# Coeficiente de correlación entre 2 variables
# Coeficiente de correlación entre las variables área y precio

# Coeficiente de correlación de Pearson
cor(x=datos$mt2, y=datos$precio)
cor(datos$mt2, datos$precio)
cor(x=datos$mt2, y=datos$precio, method='pearson')
cor(datos$mt2, datos$precio, method='pearson')
with(datos, cor(mt2, precio))

# Coeficiente de correlación de Kendall
cor(x=datos$mt2, y=datos$precio, method='kendall')
# Coeficiente de correlación de Spearman
cor(x=datos$mt2, y=datos$precio, method='spearman')

# Gráfico
with(datos, plot(x=mt2, y=precio, pch=20, col='blue',
                 xlab='Área del apartamento', las=1,
                 ylab='Precio del apartamento (Millones)'))


# --- 2.0 ---
# Coeficiente de correlación en el Dataset
# Error, hay datos cualitativos
cor(datos)

# Hay que separar solo las columnas numericas
str(datos)
# Observamos que: precio, mt2, alcobas, banos, administracion y
#  avaluo son cuantitativas y son las columnas
#  1, 2, 5, 6, 9 y 10 respectivamente
cor(datos[, c(1, 2, 5, 6, 9, 10)])

datos.cuanti <- datos[, c(1, 2, 5, 6, 9, 10)]
colnames(datos.cuanti) <- c('Precio', 'Área', 'Alcobas',
                            'Baños', 'Admin', 'Avaluo')
head(datos.cuanti)
M <- round(cor(datos.cuanti), digits=2)
M


# --- 3.0 ---
install.packages("corrplot")
library('corrplot')
corrplot.mixed(M)

# La función corrplot es muy versátil, para conocer otras
#  posibilidades visite:
#  https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html



# ---
#---- Analizando las Graficas ----
# ---
# --- 1.0 ---
# Histograma y densidad
# El histograma y el gráfico de densidad sirven para mostrar la
#  distribución, la simetría, el sesgo, variabilidad, moda, mediana
#  y observaciones atípicas de un conjunto de datos.
# Para explorar la normalidad de un conjunto de datos lo que se
#  busca es que el histograma o gráfico de densidad presenten un
#  patrón más o menos simétrico.

# Explorando la normalidad de los pesos divididos por sexo
#install.packages("readr")
library(readr)
datos <- read_csv("medidas_cuerpo.csv")
head(datos)
class(datos)

datos <- read.table(file="medidas_cuerpo.txt", header=T)
head(datos)
class(datos)
str(datos)

pesos <- split(datos$peso, datos$sexo)
pesos

plot(density(pesos$Hombre), lwd=3, col='blue',
     xlim=c(30, 110), main='', las=1,
     xlab='Peso (kg)', ylab='Densidad')
lines(density(pesos$Mujer), lwd=3, col='deeppink')
legend('topleft', lwd=3, col=c('blue', 'deeppink'),
       legend=c('Hombres', 'Mujeres'), bty='n')

# No se observa una evidencia clara de sesgo, pero la densidad para
#  los hombres es un poco más simétrica que la densidad para las
#  mujeres, entonces, no se puede rechazar la premisa de que pesos
#  corporales provienen de una distribución normal


# --- 2.0 ---
# Gráficos cuantil cuantil (QQplot)
# El QQplot es un gráfico exploratorio de normalidad.

# Los gráficos cuantil cuantil (QQplot) son una herramienta gráfica
#  para explorar si un conjunto de datos o muestra proviene de una
#  población con cierta distribución, en particular aquí nos
#  interesan para estudiar la normalidad de un conjunto de datos.
# La qqnorm() sirve para construir el QQplot y la qqline() agrega
#  una línea de referencia que ayuda a interpretar el gráfico
#  QQplot, para obtener una explicación de cómo construir este
#  gráfico se recomienda ver el video disponible en:
#  https://www.youtube.com/watch?v=kx_o9rnI4DE

# Con QQplot solo
par(mfrow=c(1, 2))
qqnorm(pesos$Hombre, pch=20,
       main='QQplot para peso de hombres')
qqline(pesos$Hombre)

qqnorm(pesos$Mujer, pch=20,
       main='QQplot para peso de mujeres')
qqline(pesos$Mujer)
#par(mfrow=c(1, 1))

# Se observa que los puntos no están tan desalineados, lo cual
#  nos lleva a NO rechazar la hipótesis de normalidad.

# Se debe interpretar con precaución el QQplot, del ejemplo con
#  datos simulados se vió que los QQplot no siempre están
#  perfectamente alineados.


# --- 2.1
# Con QQplot con bandas
install.packages("car")
require(car)
#par(mfrow=c(1, 2))
qqPlot(pesos$Hombre, pch=20, ylab='Peso (Kg)',
       main='QQplot para peso de hombres')

qqPlot(pesos$Mujer, pch=20, ylab='Peso (Kg)',
       main='QQplot para peso de mujeres')
par(mfrow=c(1, 1))

# Como los puntos del QQplot están dentro de las bandas se puede
#  aceptar que los pesos corporales provienen de una población normal


# --- 3.0 ---
# Pruebas de normalidad

# Aplicar la prueba Shapiro-Wilk
lapply(pesos, shapiro.test)
# W = 0.94709, p-value = 0.3812
# Se observa que ambos valores-P fueron mayores al nivel
#  de significancia 5%, por lo tanto, se puede concluir que
#  ambas muestras provienen de poblaciones con distribución normal.

# Aplicar la prueba Anderson-Darling
#install.packages("nortest")
require(nortest)
lapply(pesos, ad.test)
# Se observa que ambos valores-P fueron mayores al nivel
#  de significancia 5%, por lo tanto, se puede concluir que
#  ambas muestras provienen de poblaciones con distribución normal.

# Al usar las pruebas Shapiro-Wilks y Anderson-Darling se
#  concluye que no hay evidencias para pensar que los pesos
#  corporales de hombres y mujeres no provienen de una
#  población normal.
