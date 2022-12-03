#-----------------------------#
#          Sesión 2           #
#     Lectura y Escritura     #
# Estructuras de Programación #
#          Funciones          #
#       Mg. Javier Vega       #
#-----------------------------#
# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
rm(list = ls()) # borra todo

# Cambiar el directorio de trabajo
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# ---
#---- Lectura y Escritura ----
# ---
# La funcion scan se utiliza para introducir datos desde la propia ventana
#  de comandos y toma la siguiente forma:
# scan(file=" ", what = numeric(), n, sep, ...)
#  n  especifica el número de datos a introducir
#  what logical, integer, numeric, complex, character, raw and list. 

# Cuando queremos dejar de introducir datos, pulsamos un ENTER de más.
scan()

# Guardamos los que introducimos en la variable datos
datos <- scan()
datos

# Crea un vector de 3 cadenas de caracteres
nombres <- scan(what=character(), 3)
nombres


# revisar *************************
# 1.0
# Suma de cantidades enteras
a = int(input("ingrese una cantidad a:"))
b = int(input("ingrese una cantidad b:"))
suma=a+b
print("El resultado de la suma es", suma)
print("El resultado de la suma es", a+b)


# 2.0
# Suma de cantidades reales
c = float(input("ingrese una cantidad c:"))
d = float(input("ingrese una cantidad d:"))
suma=c+d
print("El resultado de la suma es", suma)
print("El resultado de la suma es", a+d)


# 3.0
# Pago de horas de dictado
g = input("ingrese su nombre:")
h = float(input("ingrese el costo de la hora:"))
i = float(input("ingrese la cantidad de horas trabajadas:"))
print(g, "ha trabajado", i, "hora(s) y su costo es", h*i)

# 4.0
# Calculo del Area del Circulo, Pi x radio al cuadrado
from math import pi
r = float(input("Ingrese el Radio del Circulo: "))
area = round(pi*r**2, 2)
print ("El Area del Circulo es:", area)

# hasta aqui ********************

getwd()
# Como recuperar un archivo de datos, denominado "datos.txt"
datos <- scan("D:\\Javicho\\datos.txt", sep=",") 
# hemos puesto sep="," para indicar que los datos vienen separados por comas
datos

# Para darle forma de matriz:
datos <- matrix(datos, ncol=3, byrow=T)
datos

# Para leer una tabla del disco:
# read.table(file, header = F, sep = "", ...)
datos <- read.table("D:\\Javicho\\edadaltura.txt")
datos
#     edad altura
#paco   20    174
#pepe   22    180
#kiko   19    170
colnames(datos)
rownames(datos)
dimnames(datos)

# Para escribir una tabla en disco:
# write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ",
#             row.names = TRUE, col.names = TRUE)
# Despues de cada instruccion ir al Terminal, verificar que se este en el
#  directorio correcto y tipear:
# more datos1.txt
write.table(datos, "D:\\Javicho\\datos1.txt")
write.table(datos, "D:\\Javicho\\datos1.txt",
            quote=F)
write.table(datos, "D:\\Javicho\\datos1.txt",
            quote=F, row.names=F)


# Despues de cada instruccion ir al Terminal, verificar que se este en el
#  directorio correcto y tipear:
# more datos2.txt
# La función write() permite escribir en archivos planos de texto
x <- c(1,2,3,4,5)
x
write(x, "D:\\Javicho\\datos2.txt")
# El contenido del fichero x.txt será el vector 1 2 3 4 5

# Si lo que queremos es escribir una matriz 
#  primero debemos transponer la matriz
x <- matrix(1:9, ncol=3, byrow=T)
x
write(x, "D:\\Javicho\\datos2.txt")
write(t(x), "D:\\Javicho\\datos2.txt",
      ncol = ncol(x))


# ---
#---- Estructuras de Programación ----
# ---
# 1.0
# El bucle for
# El ciclo se repite mientras se cumple una condición
# for (i in listadevalores)  { secuencia de comandos }
for (i in 1:10) {print(i)}
for (i in 1:10) {
  print(i)
}


for i in range(1,10): print(i); print("Hello!!!")
for i in range(1,10):
  print(i)
  print("Hello!!!")



for (i in c(0, 1, 2)) {
  for (j in c(0, 1)) {
    print(paste("i vale", i, "y j vale", j))
  }
}

for (i in 1:3) {
  for (j in 1:2) {
    print(paste("i vale", i, "y j vale", j))
  }
}

for (i in c(1, 2, 3)) {
  for (j in 1:i) {
    print(paste("i vale", i, "y j vale", j))
  }
}

# 2.0
# El bucle while
# El ciclo se repite mientras se cumple una condición
# while (condicion logica)  { secuencia de comandos }
i = 1
while i < 6 {
  print(i)
  i = i + 1
}

i = 1
while i < 6 {
  print(i)
  i = i + 1
}



# Calcular qué número es el mayor cuyo cuadrado no pase de 1000
n = 0
cuadrado <- 0
while(cuadrado<=1000) {n <- n+1 ; cuadrado <- n^2 }
while(cuadrado<=1000)
{
  n <- n+1
  cuadrado <- n^2
}

cuadrado
n
32^2

# Mejorando el programa
n = 0
cuadrado <- 0
while(cuadrado<=1000)
{
  if ((n+1)^2 > 1000) {
    print(n)
    break
  }
  n <- n+1
  cuadrado <- n^2
}
n


# 3.0
# El Condicional if
# if (condicion) comando1 else comando2
a <- 10
if (a == 10){
  print("a es igual a 10")
}

n = 4
if (n%%3 == 1) print("Si") else print("No")
if (n%%3 == 1) {
  print("Si")
} else {
  print("No")
}

n = 5
if (n%%3 == 0) {
  print("Exacto")
} else if (n%%3 == 1) {
  print("Sobro 1")
} else {
  print("Sobro 2")
}

if ('Yes' == 'Yes') {
  print('Son iguales')
}

if (2 > 1) == (5 < 10) {
  print('Ambas expresiones dan el mismo resultado')
}

if ("Yes" != "No") {
  print("NO son iguales")
}


# 3.1
# ifelse(cond, value-on-true, value-on-false)
ifelse(a == 10, "a es igual a 10", "a NO es igual a 10")
a = 11
a = 9
ifelse(a == 10, "a es igual a 10", ifelse(a <= 10, "a es menor a 10", "a es menor a 10"))


# 4.0
# Todo en 1
# Crear dos listas de 1 a 10; una almacene los números pares 
#  y otra los impares
n <- 10           # Se inicializa n
pares <- c()      # Se crea un vector vacío
impares <- c()    # Idem
for(i in 1:n) {    # Se van a procesar los números de 1 a n
  if(i%%2==0) pares<-c(pares,i)  # Si al dividir por 2 sale 0 el 
  else impares<-c(impares,i)     # numero es par, caso contrario impar
}
pares
impares


# 5.0
# switch()
# Permite ejecutar alguna orden dentro de un conjunto
#  dependiendo de si una condición se ha cumplido
# Se desea calcular el valor máximo o mínimo de un vector
#  dependiendo de una condición previa
#v <- runif(20, -10, 10)
v <- seq(-8, 10, 1)
v
type = "minimo"
switch(type, minimo = min(v), maximo = max(v))

type = "maximo"
switch(type, minimo = min(v), maximo = max(v))

type = "otro"
switch(type, minimo = min(v), maximo = max(v), otro = mean(v))
switch("otro", minimo = min(v), maximo = max(v), otro = mean(v))


# 6.0
# stop()
# Detener un proceso cuando se cumple una condición
a <- 5
b <- c(1,2,3,5,5)
if (a %in% b == TRUE) {stop("a esta en b")}

#a <- 7
#a <- 10
#a <- 11
for (i in 1:10) {
  if (i == a) {stop("Debe detenerse")}
  print(i)
}


# ---
#---- Función I ----
# ---
x <- 1:10
x

# --- 1 ----
# nombre <- function(argumento1, argumento2, .....)   comandos
# Función que calcule la desviación típica
desv <- function(x) {sqrt(var(x))}
View(desv)
desv(x)

desv <- function(x) {
  sqrt(var(x))
}
View(desv)
desv(x)

# La funcion definida en R coincide con lo que hicimos
sd(x)

y <- matrix(rnorm(15), nrow=3)
y
# Aplicar la funcion a las columnas de y
apply(y, 2, desv)
# Aplicar la funcion a las filas de y
apply(y, 1, desv)


# --- 2 ----
# Las variables definidas dentro de una función son locales, y desaparecen
#  al terminar la ejecución de la función
# Definimos la variable y LOCAL
y <- 10
# Definimos la variable y DE LA FUNCION
cuadrado <- function(x){ y <- x^2 ;  return(y)}
cuadrado <- function(x) {
  y <- x^2
  print(x) ; print(y)
  return(y)
}

j <- cuadrado(2)
x ; y ; j


# --- 3 ----
# Es posible definir funciones con un número variable de argumentos
# f <- function(...) { cuerpo de la función }
# f <- function(x, ...) { cuerpo de la función }
# f <- function(..., x) { cuerpo de la función }

# Una función puede tener varios argumentos, y podríamos omitir algunos
#  entonces, la función tomará por defecto unos valores preespecificados
desv <- function(x, n=length(x)-1) {
  #print(n)
  sum((x-mean(x))^2)/n
}


# Desviación típica corregida (al no especificar el segundo parámetro, se
#  divide por n-1
desv(x)

# Desviación típica sin corregir
desv(x, 8)
desv(x, length(x))


# La función podría llamarse sin hacer referencia explícita a x (ejemplo: f(2) )
# Deberíamos especificar f(x=2), poque al encontrar primero los argumentos
#  variables, no podría saber si nos estamos refiriendo a "x" u otro de los
#  argumentos variables
f <- function(...){ L <- list(...) ; return(L)}
f <- function(...) {
  L <- list(...)
  return(L)
}
f(1,2,3)
f(c(1,2), c(3,4,5))
f(c("A", "B"), c(3,4,5))


f <- function(x, ...) {
  print(x)
  L <- list(...)
  return(L)
}

f(c("A", "B"), c(3,4,5), "Uno")
f(x = c("A", "B"), c(3,4,5), "Uno")
f(c("A", "B"), x = c(3,4,5), "Uno")
f(c("A", "B"), c(3,4,5), x = "Uno")

f <- function(..., x) {
  print(x)
  return(list(...))
}


# Es variable el número de argumentos, así como el número de elementos
#  de cada uno.

# Definir una función que devuelva algunas medidas de las data que se le pase
# La entrada a la función será una serie de conjuntos de datos, y la salida:
#  media, varianza, mínimo y máximo de cada uno de los conjuntos.
f <- function(...) {
  datos <- list(...)
  # lapply aplica una función sobre una lista
  medias <- lapply(datos, mean)
  varianzas <- lapply(datos, var)
  maximos <- lapply(datos, max)
  minimos <- lapply(datos, min)

  for(i in 1:length(datos)) {
    # La función cat es para visualizar cosas
    cat("Distribución ",i,": \n")
    cat("Media: ", medias[[i]], "Varianza: ", varianzas[[i]],
        "Maximo: ", maximos[[i]], "Minimo: ", minimos[[i]], "\n")
    cat("------------------------------------------------\n")
  }
}
f(c(1,2), c(1,3,5,7), c(-1,2,-5,6,9))


x <- rnorm(100)
y <- runif(50)
f(x, y)

x=seq(-1, 1, 0.1)
y=seq(1, -8, -0.1)
f(x, y)
