#---------------------#
#       Sesión 2      #
#       Entorno       #
# Estructura de Datos #
#   Mg. Javier Vega   #
#---------------------#
#---------------------#
#       Entorno       #
#---------------------#
# ---
  #---- Inicializacion ----
# ---
install.packages("rstudioapi")
# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
  
rm(list = ls()) # borra todas las variables 1---
# Cambiar el directorio de trabajo
getwd()
#install.packages(c("rstudioapi", "ggplot2"))
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) #2 Simplemente para fijar como nuevo directorio de tarbajo
getwd()
# libreria::funcion()

# Uso de Librerías
library() # libreria guardadas(de base instaladas)
search()  # libreria cargadas en el entorno
require(ggplot2)
library()
search()

# Relación de objetos en una libreria
ls("package:ggplot2") #
help(ylim, package = "ggplot2") #Detalles del packete
help(ggplot2)  #Muestra detalles de la libreria


detach("package:ggplot2")# Desactivar libreria del worksapce

library()
search()
library(ggplot2)
search()
detach("package:ggplot2")
search()


# ---
#---- Configuración global ----
# ---
# Varias características se benefician de ser personalizables usando el método:
options()
names(options()) 

# Digits(digits = n)
# controla cuántos dígitos DESPUES DEL DECIMALse imprimen (por defecto)
# El valor predeterminado es 7.

options("digits")

100/998
options(digits=4, prompt="CJ?> ") #Cambia digitos a cuatro y cambia el simbolo ">" por "JVG>" xD?
100/998
getOption("digits") ; options("digits")
options(digits=20)
100/998
options(digits=7, prompt="> ")
100/998

# options(scipen = n)
# Controla la notación exponencial
# Los valores positivos hacia la notación fija 
# Los valores negativos hacia la notación científica con los valores negtivos
# Para evitar la activación de la notación científica, se puede
#  utilizar cualquier número positivo grande. Sin embargo, este
#  método realiza cambios en toda la configuración de R.
# se puede restablecer utilizando 0 como valor de "n"
options("scipen")

num2 <- 1.128347132904321674821
num2
(num <- 12383828281831342) #Defines y luego lo imprimes

options(scipen = 100, digits = 4)
print (num2) ; print (num)

options(scipen=999)
options(digits=2) #XD La notación
num2 ; num

options(scipen = 0, digits = 7) #Por defecto regenerar
num2 ; num

#Definiendo el formato
format(num2, scientific = F) ; format(num, scientific = FALSE)
format(num2, scientific = T) ; format(num, scientific = TRUE)

num3 =2.21e+09
num3
format(num3, scientific = FALSE) #FALSE para negar o quitR
format(num3, scientific = TRUE) #FALSE para negar o quitR

#RESUMEN
  #Digit
  #Prompt
  #Notación cientifica :D

# ---
#---- Calculadora ----
# ---
5%%2 # División modulo: se devuelve la parte sobrante solamente
5%/%2 # División entera: se devuelve la parte entera solamente
5/2 #Divición convecional :P
exp(1) # El numero e
exp(3) ; 2.718282^3 ; exp(1)^3 # El número e al cubo
sqrt(2) # La raíz cuadrada de 2
log(3) # El logaritmo neperiano de 3
log(3, 10) # El logaritmo de 3 en base 10 log(number, base)
abs(-3.4) # Valor absoluto de un número
pi # El número pi


# Para averiguar un poquito más sobre la organización de las funciones matemáticas en R, podemos probar las siguientes órdenes:
help("Math")
help("Arithmetic")
help("Trig")
help("log")
help("Special")


# ---
#---- Redondear ----
# ---
# Valor numérico redondeado a los dígitos que le digamos
# Redondeo Clásico, a partir de .5, redondea hacia arriba
# round(valor que quieres redondear, número de decimales)
round(5.342, 2) ; round(-5.342, 2)
round(5.346, 2) ; round(-5.346, 2)
round(5.3455, 2) ; round(-5.3455, 2)
round(5.3451, 2) ; round(-5.3451, 2)
round(5.3450, 2) ; round(-5.3450, 2)#Lo redondea hacia abajo hasta 5:....50 = 5....4
round(5.345, 2) ; round(-5.345, 2)

# Devuelve el valor entero posterior del número elegido, excepto cuando sea exacto
# ceiling(número)
ceiling(5.00)
ceiling(5.01)
ceiling(4.99)
ceiling(5.00) ; ceiling(5.0001)
ceiling(-5.00) ; ceiling(-5.0001) #TQoma el m'as alto en la recta de los realaes

# TRUNC / FLOOR


# Truncar un valor
# Para valores positivos, ambos se comportan de la misma forma
# Para valores negativos FLOOR redondea hacia abajo y TRUNC sigue truncando
x <- c(-3.2, -1.8, 2.01, 2.9)
trunc(x) ; floor(x) # separa ordenes en la misma linea
#trunc trunca para arriba
#floor trunca para abajo :0



#---------------------#
# Estructura de Datos #
#---------------------#
# ---
#---- Generar Patrones ----
# ---
# from:to
    1:5  # Genera números enteros entre 1 y 5
 

# seq
  seq(1, 5) # Generar números entre 1 y 6

# Va sumando al número anterior 0.5 hasta 6
  seq(1, 5, by=0.5)
# Generar una CANTIDAD de 10 números entre 1 y 6
  seq(1, 5, length=10)
  seq(1, 5, length=30)

# rep(loque quieres repetir, cuantas veces qquieres repetirlo)
  rep(1, 5) # Se ha repetido el 1 cinco veces
# Se ha repetido el patrón (1,2) cinco veces.
  rep(c(1,2), 5)
# Se ha repetido la secuencia 1,2,3,4 dos veces
  rep(1:4, 2)
# Se ha repetido la secuencia 1,2,3 de acuerdo al vector (1,4,5)
rep(1:3, c(1,4,5))
rep(1:3, c(1,4,0))
rep(1:3, c(1,4)) # Error Porque para el tres no se ha definido cuanto repetir
rep(1:3, c(1,4,5,6)) # Error Porque sobran instruciiones
rep(1:3, c(1,4,-5)) # Error XD? Repetir negativamente :P




# ---
#---- Vectores ----
# ---
# Un vector de tipo numérico, lógico o carácter
# La letra c significa "concatenar", y de hecho es un acrónimo para dicha palabra
# Crea un vector numérico de 4 elementos
c(1,5,3,2)
# Crea un vector lógico de 5 elementos
c(T,F,T,T,F)
# Crea un vector de 4 cadenas de caracteres
c("Barcelona","Tarragona","Lerida","Gerona")

# Concatenar 2 vectores
x <- c(1,3,5)
y <- c(2,4,6)
c(x,y) ; c(y,x) #Concatena de izquierda a derecha

 # Extracción de elementos de un vector
x <- c(18, 11, 12, 10, 7, 6, 17)

# 1. Especificar los índices de los elementos a extraer:
# La orden extrae los elementos 1, 3 y 6 del vector
X[4] # Error, se encuentra en mayusculas
x[4]
x[c(4)]
x[c(40)]
x[c(1,3,6)]

# Un número negativo precediendo al índice significa exclusión
x[-3] #Te elmina el elemento en la posición 3
x[-c(1,2)]

# 2. Especificar una condición lógica:
x > 10 #Itera y halla el valor logico con cada elemento
x[x>10] #Te brinda el vector con la condición remarcada 

# 3. Si es un vector de variables, podemos utilizar los nombres de las variables
A <- 1
B <- 3
C <- 5
y <- c(A,B,C)

y
y[1]
y[2]
y[B] ; y[3]
y[4] ; y[5] ; y[C] #y[vector en la posición que deseeas]

# indica el contenido
y[0]

x[0]
x <- c("Barcelona","Tarragona","Lerida","Gerona")
x <- c("Barcelona",1)
x[0] #Guarda el tipo de cchracter o muerico del vector en sus elemtos 


# Valores faltantes: NA (significa Not Available)
# Cualquier operación aritmética que involucre a un NA da por resultado un NA
x <- c(1, 2, 3, NA, 4, 5)
x[0]
x
x[x>2]
x*2

# Pregunta qué elementos de x son NA
is.na(x) #:0
x[is.na(x)] #XD? Not Aplicabble

# Pregunta qué elementos de x NO son NA y asigna el resultado al mismo vector x
x <- x[!is.na(x)]
x

# Secuencia de numeros dentro de un vector utilizando la nomenclatura
#  c(j:k) para que el vector tome los valores de j hasta k
x <- c(5:10)
x

# Crear un vector de ceros con el comando numeric() indicando
#  el tamaño del vector
x <- numeric(5)
x

# Para conocer el contido del vector podemos utilizar str():

str(x)
x <- c(1.1,2,3,4,5)
str(x)


# Elaboración de tablas de contingencia a partir de variables dadas
color.pelo <- c("negro", "rubio", "negro",  "rojo", "oscuro","oscuro", "rubio", "negro")
color.ojos <- c("negro", "azul",  "marron", "azul", "negro","negro", "azul",   "marron")
table(color.pelo, color.ojos)

##########Aplicar para realizar un grafico años vs. cantidad de gente cantid

# ---
#---- Factores ----
# ---
# Un factor es un vector que se usa para especificar una clasificación discreta
estudiantes.origen <- c("getafe","mostoles","madrid","madrid","mostoles",
                        "leganes","getafe","leganes","madrid","mostoles",
                        "parla","alcorcon","mostoles","getafe","leganes")
estudiantes.origen
levels(estudiantes.origen)
summary(estudiantes.origen)
# Pide el largo del objeto
length(estudiantes.origen)

festudiantes <- as.factor(estudiantes.origen)
length(festudiantes)
levels(festudiantes)
summary(festudiantes) #Una tabla de frecuancias 
table(estudiantes.origen)
#Cualitativso nominales
# El resultado es una tabla que nos muestra los niveles del factor y el
#  número de estudiantes de cada nivel

# Factores ordenado
# Para transformar un factor en ordenado se usa la función ordered().
nivel.ingles <- c("medio", "medio", "bajo",  "medio", "bajo","medio", "alto",  "alto",  "bajo", "bajo" )
nivel.ingles
length(nivel.ingles)
levels(nivel.ingles)

summary(nivel.ingles)

fnivel.ingles <- ordered(nivel.ingles,
                         levels = c("bajo","medio","alto"))#Indicas manualmete el orden deseado 

fnivel.ingles
levels(fnivel.ingles)
length(fnivel.ingles)
summary(fnivel.ingles)

fnivel.ingles < "medio"
fnivel.ingles <= "medio"

#Dicho tratatamiento cuatitativo ce datos cualitativos :D porq ejemplo clasificar por grados de importacia pero uno previamente determinar cuales son más importantey apartir de ahí discriminar....




# ---
#---- Matrices ----
# ---
# matrix(data, nrow, ncol, byrow=F)
# data	datos que forman la matriz 
# nrow	número de filas de la matriz
# ncol	número de columnas de la matriz
# byrow	Los datos se colocan por filas o por columnas según se van leyendo
#       Por defecto se colocan por columnas
# OJO: todos del mismo tipo: todos numéricos, o de tipo carácter o lógico

# Matriz con 6 elementos (vector columna)
matrix(1:6) # omg wao un vector columna ahroa como covierto una columna en una fila D: ?

# Crea una matriz con 6 elementos y dos filas, se lee por columnas
matrix(1:6, nrow=2) ; matrix(1:6, nrow=2, byrow=F) ; matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)

# Igual que en el anterior, pero se lee por filas
matrix(1:6, nrow=2, byrow=T) #byrow el orden en la colocaion de los datos

x <- matrix(1:6, nrow=3)
View(x)
length(x)                 # Número Total de elementos de la matriz
mode(x)                   # Tipo de datos de la matriz
dim(x)                    # Dimensiones de la matriz (f, c)
dimnames(x)               # Nombre de las dimensiones de la matriz
rownames(x)               # Nombre de las filas de la matriz
colnames(x)               # Nombre de las columnas de la matriz
x[] ; x                   # Se muestran todos los elementos de la matriz
x[1,2]                    # Se muestra el elemento 1,2 de la matriz
x[1,]                     # Se muestra la primera fila de la matriz
x[,2]                     # Se muestra la segunda columna de la matriz
cbind(x, c(0,0,0))        # Se añade una columna de ceros a la matriz :0
cbind(c(0,0,0), x)        # Se añade una columna de ceros a la matriz :0
rbind(x, c(9,9))          # Se añade una fila de nueves a la matriz
is.matrix(x)              # El objeto x, ¿es una matriz? XD?


y <- c("blanco","negro")  # Creamos un vector de dos palabras
is.matrix(y)              # El objeto y, ¿es una matriz? :c

# Asignando nombre a las filas y columnas
# Funciones dimnames, colnames y rownames
datos<-matrix(c(20,65,174,22,70,180,19,68,170),),nrow=3, byrow=T)
datosxD<-matrix(c(20,65,174,22,70,180,19,68,170),nrow=3, byrow=T)
datos
datosxD


# Se asignan nombres a las columnas
colnames(datos)<-c("edad","peso","altura")
datos
View(datos)

# Se asignan nombres a las filas
rownames(datos) <- c("paco","pepe","kiko")
datos
dimnames(datos)           # Muestra los nombres de filas y cols.

# Alternativamente
datos <- matrix(c(20,65,174,22,70,180,19,68,170),nrow=3,byrow=T)
datos

# Aqui esta el cambio
# dimnames(objeto) <- list( vector con nombres de filas,
#                           vector con nombres de columnas)
dimnames(datos)<-list(c("paco","pepe","kiko"),
                      c("edad","peso","altura"))
datos
dimnames(datos)            # Muestra los nombres de filas y cols.

datos[,"edad"]             # Edades de todas las personas

datos[, 1]#Quireo ver la columna 1
datos[1, ]#Quireo ver la fila 1

datos["pepe",]             # Variables del individuo "Pepe" 
datos[,c("edad","altura")] # Edad y altura de todas las personas

# apply Aplica una función sobre las filas o columnas de una matriz
# apply(data, MARGIN, FUNCION A APLICAR, ..., simplify = TRUE)
# MARGIN: para una matriz, 1 indica filas, 2 indica columnas, c(1, 2) indica
#         filas y columnas. Si data ha nombrado dimnames, puede ser un vector
#         de caracteres seleccionando nombres de dimensión.
# Hallamos la media de las variables edad, peso y altura

apply(datos, 2, mean) #APLICA UNA FUNCION SOBRE LA FILAS O COLUMNAS DE UN MATRIZ D:
  #Aplicó promedio a cada D:  


# Ahora disponemos de las estaturas de cada uno de los estudiantes del ejemplo
#  en la seccion factores
estudiantes.origen
summary(festudiantes) #FACTOR ORDENADO
festudiantes
estudiantes.estaturas <- c(1.83, 1.71, 1.79, 1.64, 1.74, 1.81, 1.62,
                           1.84, 1.68, 1.81, 1.82, 1.74, 1.84, 1.61, 1.84)
estudiantes.estaturas

# La función tapply() se utiliza para aplicar una función para cada grupo de
#  componentes del primer argumento, definidos por los niveles de la segunda
#  componente, en este caso, festudiantes.
tapply(estudiantes.estaturas, festudiantes, mean) #sACALE LA MEAN :P Media xD
#tapply(vector fractor ,, ) helpppppp D,:


########## NOta: :
# ---
#---- Arrays ----
# ---
# Array es la generalización de una matriz al caso multidimensional
#  array(datos, dimensiones [..., 3D, col, fil]) OSEA TENSORES
# Los comandos para manejar arrays son similares a los que manejan matrices

array(1:24, c(3,4,2)) #Z=2, Y=COL 4, x=fill=3

x <- array(c(45,46,65,55,170,167,48,49,68,56,169,165), c(2,3,2))
dimnames(x) <- list(c("hombres","mujeres"),      # fila
                    c("edad","peso","altura"),   # Col
                    c("villarriba","villabajo")) # 3D
x
dimnames(x)

# Datos de todos los hombres x[fila, columa, 3D]
x["hombres", , ]
x[,"altura" , ]
x[, ,"villabajo"]

# Array :D Interpretar y dominar para ser más chchs :) :D 

# Media de todas las variables para hombres y mujeres
apply(x,1,mean) #Uno indica filas :D 
(45+65+170+48+68+169)/6 # 94.16667

# Edades de las personas
x[ ,"edad", ]
# Media de las variables  edad, peso y altura para toda la población
apply(x,2,mean)
(45+46+48+49)/4 # 47

# Datos para la población "Villarriba"
x[ , , "villarriba"]
# Media de todas las variables para cada villa
apply(x,3,mean)
(45+65+170+46+55+167)/6 # 91.33333


# ---
#---- Listas ---- :D
# ---
# Las listas sirven para concatenar objetos donde cada uno es diferente
familia <- list(padre="juan", madre="maria", numero.hijos=3,
                nombre.hijos=c("luis","carlos","eva"),
                edades.hijos=c(7,5,3), ciudad="lugo")
familia
names(familia)

# Para acceder a componentes concretos se usa el operador $ seguido del nombre
#  del componente de la lista, o bien el número de la componente entre
#  corchetes dobles [[]]
# El doble corchete [[ ]][ ] se utiliza cuando se buscan elementos de
#  un vector dentro de una lista
familia$padre ; familia[[1]]

familia$numero.hijos ; familia[[3]]
View(familia)

familia[["ciudad"]] ; familia$ciudad ; familia[[6]]
familia[["nombre.hijos"]] ; familia$nombre.hijos ; familia[[4]]
familia[["nombre.hijos"]][2] ; familia$nombre.hijos[2] ; familia[[4]][2]


# Las listas son utilizadas en muchas ocaciones dentro de una función
#  porque puede almacenar distintos tipos de datos
lista <- list(nombre = "elias", edad = 21, calificaciones = c(10,9,8.5,10,9))
lista

lista$nombre
lista$edad
lista$calificaciones
lista[3]
lista[[3]][1]

#sE PUEDE REALIZAR OPERECINES SOBRE ELLEMENTOS DE LA LISTA Y NO SOBRE TODA LA LISTA :D :P


# ---
#---- Data Frame ----#############################
# ---
# Un data frame es un arreglo rectangular, es decir una estructura de datos
# Permite almacenar distintos tipos de datos, tanto numéricos como de caracter
# Las columnas (variables a menudo) pueden ser de diferente tipo entre sí, pero,
#  todos los elementos de una misma columna deben ser del mismo tipo.
# Al igual que las filas y columnas de una matriz, todos los elementos de un
#  data frame deben ser de la misma longitud.
# Pueden usarse funciones tales como dimnames, dim, nrow
# Los datos de un data frame pueden accederse como una matriz o una lista.

datos

A <- c("madrid","malaga","murcia")
datos2 <- cbind(datos, A)
datos2

# Calculamos la media de la variable edad
mean(datos[,"edad"])
mean(datos2[,"edad"])#Erroe porque so ncaracterres :P

mode(datos)
is.matrix(datos)
mode(datos2) 
is.matrix(datos2)

# Hacerlo correctamente:
datos2 <- data.frame(datos, A)
datos2
mean(datos2[,"edad"])

apply(datos2      , 2, mean)
# Lo correcto
apply(datos2[,1:3], 2, mean)

# Cambiar nombre columna ########################################PARA TRADUCIR LOS TITULOS XD
datos2
colnames(datos2) <- c(colnames(datos2)[1], colnames(datos2)[2],
                      colnames(datos2)[3], "Provincia")
datos2
colnames(datos2[1]) <- "Age" # Mala sintaxis, error
datos2 #XD? Que cambio 8u
colnames(datos2)[1] <- "Age"
datos2
rownames(datos2)[1] <- "Chatarrita"
datos2

# Acceso
datos2[,2]
datos2[,"Age"]
datos2[,"age"] # Mal llamado, error
datos2$age # Mal llamado, pero no arroja error
datos2$Age
    #basicamente recuerda que r si distigue Mayus y minus :U

datos2[,4]
datos2[,"Provincia"]
datos2$Provincia
# las variables no numéricas se presentan como factores

# Modo 1
Age
datos2[,"Age"]

# Modo 2
# Acceder a los nombres de datos2 directamente
attach(datos2)
Age
datos2[,"Age"]
detach(datos2)
Age


# ---
# Comando Data
# ---
# Relación de todas las fuentes de datos o data.frame de las librerias disponibles :O
data()
# Relación de los data.frame de una libreria
data(package="ggplot2")
help(diamonds)
library(ggplot2)
help(diamonds)

# Carga en memoria el objeto diamonds
data(diamonds)
diamonds$price

# Permite trabajar con los elementos de diamonds sin nombrar a diamonds
attach(diamonds)
price

# Hay que nombrar a diamonds para trabajar con los objetos
detach(diamonds)
price
diamonds$priced
View(diamonds)
 
:D