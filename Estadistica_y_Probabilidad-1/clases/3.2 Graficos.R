#-------------------#
#      Sesión 3     #
#      Gráficos     #
#  Mg. Javier Vega  #
#-------------------#
# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
rm(list = ls()) # borra todo

# Cambiar el directorio de trabajo
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# ---
#---- Dispositivos Gráficos ----
# ---
# Para visualizar los gráficos hay que inicializar un dispositivo
#  gráfico (graphic device), y si hay varios, elegir uno de ellos.
# Crear dispositivos gráficos
win.graph()
x11()
windows()
# El último, siempre es el disposito activo, al cual se enviarán
#  todos los dibujos.

# Podemos cambiar entre ellas utilizando el comando dev.set()
# Ventana activa la dos
dev.set(2)
# Ventana activa la cuatro
dev.set(4)

# Para eliminar una ventana gráfica cualquiera o INACTIVA:
dev.off(3)
# Para eliminar la ventana gráfica actual O ACTIVA:
dev.off()
dev.off()


# ---
#---- Gráficos de Alto Nivel ----
# ---
data(VADeaths)  # en otros casos es deaths
VADeaths
summary(VADeaths)
summary(VADeaths[ ,1]) # Columna
summary(VADeaths[1, ]) # Fila
View(VADeaths)

# Ojo: Hay diferencia
class(VADeaths)
summary(VADeaths[1,])
x = data.frame(VADeaths)
summary(x[1,])
class(x)
x


# --- 1.0 ---
# barplot() : Diagrama de barras
barplot(VADeaths)
barplot(VADeaths, beside=T)
barplot(VADeaths[,1])
barplot(VADeaths[,1], beside=T)
barplot(VADeaths[,1], beside=F)


# --- 2.0 ---
# boxplot() : Diagrama de caja
x <- rnorm(200)
x
summary(x)
boxplot(x)

# Diagrama de caja para una sola columna (variable)
boxplot(VADeaths[,1])

# Diagrama de caja por cada categoría
boxplot(VADeaths)
boxplot(data.frame(VADeaths))


# --- 3.0 ---
# hist() : Histograma
x <- rnorm(1000) # Genera 1000 datos de una normal
x
summary(x)
hist(x)

# No aclara la comprension del dataset
hist(VADeaths[,1])
hist(VADeaths)


# --- 4.0 ---
# pairs() : Pares de gráficos de dispersión por variables
data(iris)
class(iris)
View(iris)
summary(iris)
summary(iris[ ,1]) # Columna
summary(iris[1, ])  # Fila
head(iris)

# Incorrecto, hay una columna cualitativa
pairs(iris)
# Correcto
iris[,1:4]
pairs(iris[,1:4])


# --- 5.0 ---
# persp() : Gráfico 3D
# Generamos una malla de puntos (x,y)
x <- seq(-1.95, 1.95, length.out = 30)
y <- seq(-1.95, 1.95, length.out = 35)
summary(x)
summary(y)
x ; y

# z = f(x,y)
# El producto exterior de los arreglos X e Y es el arreglo Z
#  con dimensión c(dim(X), dim(Y)) donde el elemento Z
#  es el resultado de aplicar una funcion(X, Y)
z <- outer(x, y, function(x, y) x^2 - y^2)
z
summary(z)
View(z)

x[1:10] ; y[1:10] ; z[1:5, 1:4]
# Fila 1
x[1]^2 - y[1]^2 # (-1.9500000)^2 - (-1.9500000)^2
x[1]^2 - y[2]^2 # (-1.9500000)^2 - (-1.8352941)^2
x[1]^2 - y[3]^2 # (-1.9500000)^2 - (-1.7205882)^2
# Fila 2
x[2]^2 - y[1]^2 # (-1.8155172)^2 - (-1.9500000)^2
x[2]^2 - y[2]^2 # (-1.8155172)^2 - (-1.8352941)^2
x[2]^2 - y[3]^2 # (-1.8155172)^2 - (-1.7205882)^2

# Tambien
f <- function(x, y) { x^2 - y^2 }
z <- outer(x, y, f)
z

# Verificando Dimensiones
length(x)
nrow(z)
length(y)
ncol(z)

# Generando gráfico sin perspectiva
persp(x,y,z)

# Generando gráfico con perspectiva
persp(x,y,z, theta=30, phi=30)



# ---
#---- Gráfico Generico ----
# ---
# plot() : Rutina de dibujo general
#axes=F       Suprime la generación de los ejes
#log="x"      El eje X se tome en escala logarítmica
#log="y"
#log="xy"

#type="p"  Dibuja puntos individuales (opción por defecto)
#type="l"  Dibuja líneas
#type="b"  Dibuja puntos y líneas
#type="o"  Dibuja puntos atravesados por líneas
#type="h"  Dibuja con líneas verticales
#type="s"  Dibuja a base de funciones escalera
#type="S"  Casi lo mismo
#type="n"  No dibuja nada. Pero marca los puntos para uso posterior

#xlab="cadena"  Etiqueta para el eje de las x
#ylab="cadena"  Etiqueta para el eje de las y
#main="cadena"  Título del gráfico
#sub="cadena"   Subtítulo del gráfico

#pch="simbolo"  Se dibuja un "simbolo" especificado
#pch=18
#pch="x"
#pch="P"

#col= <numero entero>  o <Color>
#col=2    Color rojo / "red"
#col=3    Color verde / "green"

# Generamos una distribución normal
x <- seq(-4,4, length=200)
summary(x)
x

plot(x, dnorm(x), type="l")
plot(x, dnorm(x), axes=F, type="p", xlab="Eje horizontal", col = 1)
plot(x, dnorm(x), type="b", ylab="Eje vertical", col = 2)
plot(x, dnorm(x), type="o", main="Titulo", col = 3)
plot(x, dnorm(x), type="h", sub="detalle", col = 4)
plot(x, dnorm(x), type="s", main="Titulo", sub="detalle", col = 5)
plot(x, dnorm(x), type="S", col = 6)
plot(x, dnorm(x), type="n")
plot(x, dnorm(x), type="p", col = 7, pch=18)
plot(x, dnorm(x), type="p", col = 8, pch="x")
plot(x, dnorm(x), type="p", col = 9, pch="p")
plot(x, dnorm(x), type="p", col = 9, pch=22)

plot(x, dnorm(x), type="l", log="x")
plot(x, dnorm(x), type="l", log="y")
plot(x, dnorm(x), type="l", log="xy")
plot(x, type="l")


# --- 1.0 ---
x <- seq(-10,10)
summary(x)
length(x)
x
plot(x, x)

# Muestra una seccion segun limites
plot(x, x, xlim=c(0,10), ylim=c(0,10))
# Genera lineas horizontales
for(i in 0:10)
  abline(h=i, col=i+1)
# Genera lineas verticales
for(i in 0:10)
  abline(v=i, col=i)


# --- 2.0 ---
#x <- seq(-10,10)
y <- x^2
x ; y
plot(x, y)
plot(x, y, main="Parabola",
     type="l", xlab="eje de las x", ylab="eje de las y")
plot(x, y, main="Parabola",
     type="h", xlab="Eje de las X", ylab="Eje de las Y", axes=T)
plot(x, y,
     type="b", pch=18, col=2)


# --- 3.0 ---
# Con el comando rnorm() generamos numeros aleatorios basados
#  en la distribución normal.
x <- rnorm(50, 0, 1)
summary(x)
x <- rnorm(50, 0, 1)
summary(x)
x <- rnorm(50)
summary(x)

# La función set.seed de la primera línea sirve para fijar
#  la semilla de tal manera que los números aleatorios
#  generados en la segunda línea sean siempre los mismos.
set.seed(12455) # primera linea
x <- rnorm(50)  # segunda linea
summary(x)

x <- rnorm(50)
summary(x)
set.seed(12455)
x <- rnorm(50)
summary(x)

# Gráficos de lineas con la función plot()
plot(x,
     type = "l",
     col = "blue",
     main = "Gráfico de Lineas", 
     sub= "Subtitulo del Gráfico",
     xlab = "Nombre de la variable x",
     ylab = "Nombre de la variable y")

plot(x,
     type = "p",
     col = "blue",
     main = "Gráfico de Lineas", 
     sub= "Subtitulo del Gráfico",
     xlab = "Nombre de la variable x",
     ylab = "Nombre de la variable y",
     pch = 10)

plot(x,
     type = "b",
     col = "blue",
     main = "Gráfico de Lineas", 
     sub= "Subtitulo del Gráfico",
     xlab = "Nombre de la variable x",
     ylab = "Nombre de la variable y",
     pch = 10)
abline(h=0)



# ---
#---- Gráficos de Bajo Nivel ----
# ---
# Los comandos de bajo nivel sirven para añadir información extra
#  a los gráficos que producen los comandos de alto nivel.
# Podríamos añadir al gráfico: texto, puntos extras, líneas, etc.

# points(x,y)     Añade puntos al gráfico actual
# lines(x,y)      Añade líneas conectadas al gráfico actual
# text(x,y,label) Añade texto en la posición X,Y al gráfico actual
# abline(a,b)     Añade una línea de pendiente a Y que corta al origen en B
# abline(h=y)     Añade línea horizontal que corta al eje Y en h=Y
# abline(v=x)     Lo análogo para línea vertical
# polygon(x,y)    Dibuja un polígono
# title(main,sub) Añade título y subtítulo al gráfico actual
# axis(side)      Añade ejes de 1 a 4 al gráfico actual

# --- 1.0 ---
plot(x, y, axes=F)
axis(1)


# --- 2.0 ---
plot(x,y)
abline(h=40, col=3)
abline(v=0, col=4)
text(-5, 60, "grafico raro")
text(0, 40, "Centro")



# ---
#---- Distribuir los Gráficos ----
# ---
# Un solo gráfico por ventana: Default
par(mfrow=c(1,1))

# Varios graficos en una misma ventana
# Dibuja una matriz de gráficos 2x1: un gráfico debajo de otro
par(mfrow = c(2, 1))
# Matriz de gráficos 2 x 3 : dos filas por tres columnas
par(mfrow = c(2, 3))

# Generamos datos
x <- rnorm(200)
summary(x)
length(x)
x

# Se crea una matriz de gráficos 2 x 2
par(mfrow=c(2,2))

# Dibujo de x frente al índice 1 a 200
plot(x)
abline(h=0,col=2)
# Histograma de x
hist(x)
# Diagrama de caja de x
boxplot(x)
# Gráfico cuantil-cuantil de x frente a la distribución normal
qqnorm(x)
abline(v=0,col=3)

# Regresar al estado inicial
par(mfrow=c(1,1))



# ---
#---- Ejemplo Completo de Graficos ----
# ---
sexo <- c("hombre", "mujer", "mujer", "otro",
          "hombre", "hombre", "mujer", "mujer", "otro")
class(sexo)
est  <- c(1.85, 1.64, 1.56, 1.71,
          1.79, 1.81, 1.56, 1.63, 1.69)
class(est)
edad <- c(18, 20, 23, 25,
          22, 18, 17, 19, 20)
class(edad)

data <- data.frame(sexo, est, edad)
class(data)
summary(data)
str(data)
head(data)
tail(data)
View(data)
print(data)
data

# --- 1.0 ---
# plot()
plot(est, edad)
plot(est, edad,
     type = "p",
     pch = 10,
     col = "blue",
     main = "Título del gráfico", 
     sub= "Subtitulo del Gráfico",
     xlab = "Nombre de la variable x",
     ylab = "Nombre de la variable y")


# --- 2.0 ---
# Histograma
summary(data[, 3])
summary(data$edad)
table(edad)
hist(edad)
hist(edad,
     col = "gray",
     main = "Histograma", 
     sub= "Subtitulo del Gráfico",
     xlab = "Nombre de la variable x",
     ylab = "Nombre de la variable y")

summary(data[, 1])
summary(data$sexo)
table(sexo)
# NO es legible por se columna cualitativa
hist(table(sexo))


# --- 3.0 ---
# Para utilizar el gráfico de barras o el gráfico de pastel,
#  primero se realiza una tabla con el comando table() si
#  son datos categóricos (cualitativos)
# Gráfico de barras
barplot(table(sexo))
barplot(table(sexo),
        main = "Gráfico de Barras", 
        sub= "Subtitulo del Gráfico",
        xlab = "Nombre de la variable x",
        ylab = "Nombre de la variable y",
        col = 5)


# --- 4.0 ---
# Gráfico de pastel
pie(table(sexo))
pie(table(sexo),
    main = "Gráfico de Torta", 
    sub= "Subtitulo del Gráfico",
    xlab = "Nombre de la variable x",
    ylab = "Nombre de la variable y")


# --- 5.0 ---
# Gráfico de Cajas
# Para realizar un el gráfico de cajas, tenemos una variable
#  categórica contra una variable continua, por ello, se debe
#  expresar como un modelo, es decir, utilizamos el simbolo ~
# cuantitativa = f(cualitativa, ...)
# cuantitativa ~ cualitativa + ...

# Error
boxplot(sexo~edad) # cualitativa = f(cuantitativa, ...)
boxplot(edad~sexo)

boxplot(edad~sexo,
        col = "green",
        main = "Gráfico de Caja", 
        sub= "Subtitulo del Gráfico",
        xlab = "Nombre de la variable x",
        ylab = "Nombre de la variable y")



# ---
#---- Demo de Gráficos ----
# ---
# Los gráficos disponibles en R son de gran calidad y de versatilidad
#  impresionante. Para tener una idea, ejecutar la demo:
demo("graphics")
par(mfrow=c(1,1))
