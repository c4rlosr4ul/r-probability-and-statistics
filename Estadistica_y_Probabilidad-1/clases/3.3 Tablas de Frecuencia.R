#----------------------#
#       Sesión 3       #
# Tablas de Frecuencia #
#   Mg. Javier Vega    #
#----------------------#
# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
rm(list = ls()) # borra todo

# Cambiar el directorio de trabajo
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# ---
#---- Construir Tablas de Frecuencia ----
# ---
# table(..., exclude, useNA)
#  ... nombres de los objetos (variables o vectores) para los cuales
#      se quiere construir la tabla.
#  exclude: vector con los niveles a remover de la tabla.
#      Si exclude=NULL implica que se desean ver los NA, lo que
#       equivale a useNA = 'always'.
#  useNA: que se desea hacer con los NA. Los posibles valores:
#      'no' si no se desean usar
#      'ifany' y 'always' si se desean incluir.

# --- 1.0 ---
# Tablas de Frecuencia
fuma <- c('Frecuente', 'Nunca', 'A veces', 'A veces', 'A veces',
          'Nunca', 'Frecuente', NA, 'Frecuente', NA, 'hola', 
          'Nunca', 'Hola', 'Frecuente', 'Nunca')
length(fuma)
table(fuma)

# Incluyendo los NA
table(fuma, useNA='always')

# No incluir: "Hola" y "hola"
table(fuma, exclude=c('Hola', 'hola'))

# No incluir: "Hola", "hola" y "NA"
tabla1 <- table(fuma, exclude=c('Hola', 'hola', NA))
tabla1

# Otro Conjunto de Datos
sexo <- c('Hombre', 'Hombre', 'Hombre', NA, 'Mujer',
          'Casa', 'Mujer', 'Mujer', 'Mujer', 'Hombre', 'Mujer', 
          'Hombre', NA, 'Mujer', 'Mujer')
length(sexo)
table(sexo)

# No incluir
table(sexo, exclude=c('Casa', 'hola', NA))


# --- 2.0 ---
# table(var1, var2)
#  Variable 1 quedará en las filas y variable 2 en las columnas

# Tablas Bivariadas
table(sexo, fuma)

# No incluir: "Hola", "hola", "Casa" y "NA"
tabla2 <- table(sexo, fuma, exclude=c('Hola', 'hola', 'Casa', NA))
tabla2



# ---
#---- Crear tablas de frecuencia relativa ----
# ---
# prop.table(x, margin=NULL)
#  x: tabla de frecuencia.
#  margin: 1 para proporciones por filas, 2 por columnas,
#          NULL para frecuencias globales
# Tabla simple
tabla1
prop.table(x=tabla1)

# Frecuencias relativas global
tabla2
tabla3 <- prop.table(x=tabla2)
tabla3

# Frecuencias relativas marginal por columnas
tabla4 <- prop.table(x=tabla2, margin=2)
tabla4

# Frecuencias relativas marginal por filas
tabla5 <- prop.table(x=tabla2, margin=1)
tabla5



# ---
#---- Agrega totales por filas o por columnas ----
# ---
# addmargins(A, margin)
#  A: tabla de frecuencia.
#  margin: 1 para proporciones por columnas, 2 por filas,
#          NULL para frecuencias globales

addmargins(tabla3)
addmargins(tabla4, margin=1)
addmargins(tabla5, margin=2)



# ---
#---- Comando: hist ----
# ---
# Tablas de Frecuencias para variables cuantitativas
# hist(x, plot = TRUE,
#      breaks = "Sturges", right = TRUE,
#      include.lowest = TRUE,
#      labels = FALSE, nclass = NULL, 
#      warn.unused = TRUE, freq = NULL, ...)
#  x : Vector de valores
#  breaks : puede ser
#           Un vector con los puntos de corte
#           Una funcion: "Sturges" (default) / "Scott" y "FD" /
#            "Freedman-Diaconis"
#           Un valor indicando la cantidad de intervalos
# include.lowest : posicion de una observación que coincide con un
#           límite del intervalo, TRUE será ubicada en intervalo 
#           izquierdo y FALSE en intervalo derecho
# right : TRUE (default), el intervalo es de la forma (a, b]
#         FALSE, el intervalo es de la forma [a, b)
# plot : TRUE (default), el histograma se imprime

# Se obtiene un objeto tipo lista con los siguientes componentes:
# breaks : límites inferior y superior de cada intervalo
#          limites nominales sin la discrepancia de si es "abierto" o
#           "cerrado"
#          los límites de la celda n+1 (= a los limites si se trata
#           de un vector)
# counts : la cantidad en cada clase o categoria o intervalo
#          (Frecuencia Absoluta)
# density : valores de densidad estimados
# mids : los puntos medios de las celdas n (Marcas de clase)
# xname : el nombre real del Vector de valores (x)
# equidist : lógico, indica si las distancias entre los intervalos
#            son todas iguales

# --- 1.0 ---
# Tabla con regla de Sturges
x <- rnorm(n = 200, mean = 170, sd = 5)
summary(x)
res1 <- hist(x = x, plot = FALSE,
             breaks = 'Sturges')
res1
res1[1:2]

# Tabla con tres intervalos de límites 150, 170, 180 y 190
res2 <- hist(x = x, plot = FALSE, 
             breaks = c(150, 170, 180, 190))
res2

# Tabla con tres intervalos de límites 150, 155, 170 y 190
res3 <- hist(x = x, plot = FALSE,
             breaks = c(150, 155, 170, 190))
res3

# Tabla con diez intervalos
res4 <- hist(x = x, plot = FALSE, 
             breaks = 10)
res4

# Comparando resultados
res1[1:2]
res2[1:2]
res3[1:2]
res4[1:2]


# --- 2.0 ---
x <- c(1.1, 1.2, 1.3, 2.0, 2.0, 2.5, 2.7, 3.0, 3.4)
plot(x)

# Usamos right=TRUE --> <a, b]
res3 <- hist(x, plot = FALSE, 
             breaks = c(1, 2, 3, 4), right=TRUE)
res3[1:2]

# Usemos right=FALSE --> [a, b>
res4 <- hist(x, plot = FALSE, 
             breaks = c(1, 2, 3, 4), right=FALSE)
res4[1:2]

# Al comparar los dos resultados vemos que:
#  la primera frecuencia es 5 porque right=TRUE
#  y los intervalos se consideran cerrados a la derecha

# Usemos FALSE con los parámetros include.lowest y right.
res5 <- hist(x, plot = FALSE, 
             breaks = c(1, 2, 3, 4), right=FALSE,
             include.lowest=FALSE)
res5[1:2]

# El resultado es similar a: [a, b>



# ---
#---- Comando: table.freq ----
# ---
# Tablas de Frecuencias para variables cuantitativas
#install.packages("agricolae")
library(agricolae)
x <- c(0.2,  8.4, 14.3,  6.5, 3.4,  4.6, 9.1, 4.3,  3.5, 1.5,
       6.4, 15.2, 16.1, 19.8, 5.4, 12.1, 9.6, 8.7, 12.1, 3.2)
length(x)

# --- 1.0 ---
# Intervalo de la forma [a, b)
TFDA <- hist(x, plot = FALSE, 
             breaks = c(0, 4, 8, 12, 16, 20), right = FALSE)
TFDA
TFDA$breaks
TFDA[["mids"]]
TFDA[2]

hist(x, 
     breaks = c(0, 4, 8, 12, 16, 20), right = FALSE)

Tabla <- table.freq(TFDA)
Tabla
class(Tabla)

barplot(Tabla[ ,4]) # Frecuencia
barplot(Tabla$CF)   # Frecuencia Acumulada
barplot(Tabla$Percentage)     # Frecuencia Relativa en %
barplot(Tabla$Percentage/100) # Frecuencia Relativa
barplot(Tabla$CPF)     # Frecuencia Relativa Acumulada en %
barplot(Tabla$CPF/100) # Frecuencia Relativa Acumulada
pie(Tabla$Percentage) # Frecuencia Relativa en %


# --- 2.0 ---
# Con 2 Intervalos
TFDA <- hist(x, plot = FALSE, 
             breaks = 2, right = FALSE)
TFDA[1:2]

hist(x,
     breaks=2, right=F)

Tabla <- table.freq(TFDA)
Tabla

barplot(Tabla[,4])



# ---
#---- Usamos "ejercicio.csv" ----
# ---
# --- 1.0 ---
datos <- read.csv("ejercicio.csv",
                  header = F, sep = ";")
datos
View(datos)
dim(datos)
dim(datos)[1] # filas
nrow(datos)
dim(datos)[2] # columnas
ncol(datos)

dimnames(datos)
dimnames(datos)[1]
rownames(datos)
dimnames(datos)[2]
colnames(datos)
colnames(datos)[1] <- "Notas"
colnames(datos)

tail(datos)
tail(datos, 3)
head(datos)
head(datos, 4)

# Viendo la estructura de los datos
str(datos)
summary(datos)
class(datos)


# --- 2.0 ---
# Tabla de Frecuencia No Agrupada (TFDNA)
TFDNA <- as.data.frame(table(datos))
TFDNA

Freq_Acu <- cumsum(TFDNA[2])
Freq_Acu

TFDNA <- data.frame(TFDNA,
                    Freq_Acu,
                    round(TFDNA[2]/dim(datos)[1], 4),
                    round(Freq_Acu/dim(datos)[1], 4))
head(TFDNA)
colnames(TFDNA) <- c("Valores", "Frec_Abs",
                     "Frec_Acu", "Frec_Rel", "Frec_Rel_Acu")
TFDNA

barplot(TFDNA[ ,2])
barplot(TFDNA$Frec_Acu)
barplot(TFDNA$Frec_Rel)
barplot(TFDNA$Frec_Rel*100)
barplot(TFDNA$Frec_Rel_Acu)
barplot(TFDNA$Frec_Rel_Acu*100)
pie(TFDNA$Frec_Rel*100)


# --- 3.0 ---
# Intervalo de la forma [a, b>
TFDA <- hist(datos$Notas, plot = FALSE, 
             breaks = 'Sturges', right=FALSE)
TFDA
View(TFDA)
names(TFDA)
TFDA$breaks
TFDA[["mids"]]
TFDA$counts
TFDA[1:2]

hist(datos$Notas, 
     breaks = 'Sturges', right=FALSE)

Tabla <- table.freq(TFDA)
Tabla

barplot(Tabla[,4])
barplot(Tabla$Percentage)
barplot(Tabla$CF)
barplot(Tabla$CPF)
pie(Tabla$Percentage/100)


# --- 4.0 ---
# Intervalo de la forma <a, b]
TFDA <- hist(datos$Notas, plot = FALSE, 
             breaks = 'Sturges')
TFDA
View(TFDA)
names(TFDA)
TFDA$breaks
TFDA[["mids"]]
TFDA$counts

hist(datos$Notas, 
     breaks = 'Sturges')

Tabla <- table.freq(TFDA)
Tabla

barplot(Tabla[ ,4]) # Frecuencia
barplot(Tabla$CF)   # Frecuencia Acumulada
barplot(Tabla$Percentage)     # Frecuencia Relativa en %
barplot(Tabla$Percentage/100) # Frecuencia Relativa
barplot(Tabla$CPF)     # Frecuencia Relativa Acumulada en %
barplot(Tabla$CPF/100) # Frecuencia Relativa Acumulada
pie(Tabla$Percentage) # Frecuencia Relativa en %
