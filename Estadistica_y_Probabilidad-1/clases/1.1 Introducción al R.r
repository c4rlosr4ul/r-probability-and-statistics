#-------------------#
#      Sesión 1     #
# Introducción al R #
#  Mg. Javier Vega  #
#-------------------#
# ---
#---- Inicio ----
# ---
contributors()

# Esto es un comentario de una sola línea
mi_variable = 15
mi_variable = 15 # Este comentario es de una línea también

# {
#   "Y este es un comentario
#   de varias líneas"
# }

# Puedes encontrar cuál es tu directorio de trabajo con la función getwd()
getwd()

#Puedes cambiar el directorio de trabajo usando la función setwd()
setwd("C:\otro_directorio")

# Ver archivos
list.files()

# Ver directorios
list.dirs()


# ---
#---- Operadores Aritméticos ----
# ---
10 + 30
40 - 10
2*5 # Multiplicación de dos números
50 * 5
5/2 # División real de dos números
18 / 4
5^2 # Potenciación
5^2.3 # Potenciación, exponente real
5 ^ 3
5%%2 # Módulo: resto de dividir un número por otro
11%%3
25 %% 2
10 %% 3
5%/%2 # División entera: se devuelve la parte entera solamente

8 - 3 + 2
-3 + 4 * 2


# ---
#---- Operadores Relacionales ----
# ---
0 < 6 # True
6 < 0 # False
50 < 10.5 # False
10.5 < 11.3 # True
10 < 10 # False

10 <= 20 # True
10 <= 10 # True
10 >= 20 # False
20 >= 20 # True

10 == 10 # True
10 == 11 # False
11 == 10 # False
10 != 10 # False
10 != 11 # True

# Las comparaciones de cadenas funcionan de manera similar:
'Hello' == 'Hello' # True
'Hello' == 'Goodbye' # False
'Hello' == 'HELLO' # False
'Goodbye' != 'Hello' # True

42 == 'Hello' # False
42 == '42' # False
10 == 10.0 # True

a = 2
b = 3
a < b # True
a > b # False
a >= b # False
a <= b # True
a <= a # True

d <- a == 20
print(d)


# ---
#---- Operadores Lógicos ----
# ---
# Operador or
TRUE | TRUE    # True
TRUE | FALSE   # True
FALSE | TRUE  # True
FALSE | FALSE  # False
1 < 2 | 3 < 1  # True
3 < 1 | 1 > 6  # False
1 == 1 | 1 > 2 # True
1 == 1 | 1 < 2 # True

# Operador and
TRUE & TRUE    # True
TRUE & FALSE   # False
FALSE & TRUE  # False
FALSE & FALSE  # False
1 < 2 & 3 < 1  # False
3 < 1 & 1 > 6  # False
1 == 1 & 1 > 2 # False
1 == 1 & 1 < 2 # True


5 | 0 # 1 | 0 (true | false)
5 & 0 # 1 & 0 (true & false)
0 & 0
1 & 1
-1 & 5


isTRUE(0)
isTRUE(5)
isTRUE(1)
isTRUE(TRUE)
isTRUE(1==1)

TRUE + FALSE
TRUE + TRUE
FALSE + FALSE
TRUE == 1
(1==1) == 1
(1==1) == T

TRUE & TRUE

!TRUE

TRUE | TRUE
T | T
F | T


# ---
#---- Paquetes ----
# ---
# Los paquetes que hemos llamado en nuestra sesión actual: sessionInfo()
sessionInfo()

# Podemos ver qué paquetes tenemos ya instalados: installed.packages() sin argumentos
installed.packages()

# Instalar un paquete inexistente
install.packages("un_paquete_falso")

# Instalando un package llamado ggplot2:
install.packages("ggplot2")

# Cargando el package
library(car)
library(ggplot2)
sessionInfo()

# Descargando el package
detach("package:ggplot2", unload = TRUE)
sessionInfo()


# ---
#---- Imprimir ----
# ---
help(reserved)
?reserved

cat("Welcome to UNMSM !")
print("Welcome to UNMSM !")

# Podemos usar el signo igual para una asignación, pero <- es el característico de R
# Adicionando 2 numeros en R
numb1 <- 8
numb2 = 4
numb1 + numb2 -> sum

print(paste("The sum is", sum))
cat(paste("The sum is", sum))

a <- 10
b <- 20

print(a)
print(paste("el dato a vale:", a))

sprintf("la suma de a + b es %s,y la de a-b es %s",a+b, a-b)

cat("a es igual a:", a, "la suma de a + b es:", a+b)


# ---
#---- Variables ----
# ---
# Para conocer los objetos y funciones que contiene nuestra sesión, usamos la función ls()
ls()

newEnv <- "GFG"
newEnv

ls()
  
# Borrar newEnv
rm(newEnv)
ls()


Exp1289 = 1
muestra.ini = 1
muestra.ini.ajuste = 1
JAVIER123 = 1
javier = 1
Javier_123.5 = 1
las_variables_pueden_contener_guiones = 1
las.variables.pueden.contener.puntos = 1

nombre = "Pepito Conejo"
Nombre = "Numa Nigerio"
nomBre = "Fulanito Mengánez"
nombre
Nombre
nomBre

x = 3.8 # Error
x 1 = 100 # Error

  x1 = 100
x1


# ---
#---- Tipos de Objeto ----
# ---
x <- 1:5
class(x) # "integer", números enteros positivos

x3 <- x - 3
x3
class(x3)

x2 <- x + 0.1
x2
class(x2) # "numeric", número que contiene decimales y <= 0

x4 <- x - 5.3
x4
class(x4)

j = 0
class(j)


y <- "1"
class(y)

y <- "H"
class(y)

y <- "Hola"
class(y)

y1 <- c("A", "B", "C")
class(y1)
# [1] 
# Entero si solo si es mayor igual que cero o sea un natural :UNMSM 


y2 <- c("Avión", "Barco", "Carro")
class(y2)


j <- T
class(j)

j1 <- (5 < 4)
class(j1)
