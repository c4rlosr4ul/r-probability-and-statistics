#----------------------------#
#          Sesión 3          #
# Introducción a Estadística #
#       Mg. Javier Vega      #
#----------------------------#
# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
rm(list = ls()) # borra todo

# Cambiar el directorio de trabajo
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

# ---
#---- Estadística ----
# ---
x <- seq(1:10)
x

# cumsum() : Suma acumulativa del vector
cumsum(x)

# mean() : Media aritmética
mean(x)

# sum() : Suma aritmética del vector
sum(x)

# length() : Longitud del vector
length(x)

#median	El percentil 0.5: la mediana
median(x)

#min	El mínimo de una serie de números
min(x)

#max	El máximo de una serie de números
max(x)

#range	Mínimo y máximo de un vector
range(x)
range(x)[1]
range(x)[2]

#prod	El producto de los elementos de un vector
prod(x)

#summary	Resumen de estadísticas de una serie de datos
summary(x)
summary(x)[1]
summary(x)[2]
summary(x)[3]
summary(x)[4]
summary(x)[5]
summary(x)[6]

#quantile	Los percentiles de una distribución
# Valores aceptados: [0, 1]
quantile(x, probs=c(0.25, 0.5, 0.75))
# Error, el % es negativo
quantile(x, probs=c(-0.25, 0.5, 1))
# Error, el % es mayor a 1
quantile(x, probs=c(0.25, 0.5, 1.75))
quantile(x, probs=c(0, 0.5, 1))
quantile(x, probs=c(0.01, 0.35, 0.84))

x <- rnorm(200)
x
quantile(x, probs=c(0.1,0.4,0.9))
quantile(x, probs=c(0.01, 0.35, 0.84))

# Generación de 100 datos de una normal
#  estandar, y un sumario de los mismos:
x <- rnorm(100)
summary(x)


#sample	Muestreo aleatorio (y permutaciones)
# Creación de permutaciones:
sample(10)
sample(5)

# Muestreo sin repetición:
sample(1:10, 5)
# Muestreo con repetición:
sample(1:10, 5, rep=T)
# Simulación de 10 tiradas de un dado equilibrado:
sample(1:6, 10, rep=T)


# NA = Not Available
# Para calcular algunas operaciones estadísticas en presencia de
#  NA utilizamos na.rm = TRUE:
a <- c(1,NA,3,4,5,NA,7,8,1,2,3,4,5,6,7,8,9)
sum(is.na(a)) # número de NA es los datos

# Error
sum(a)
sum(a, na.rm = TRUE)

length(a)
length(a) - sum(is.na(a))

mean(a, na.rm = TRUE) # media
median(a, na.rm = TRUE) # mediana
min(a, na.rm = TRUE) # mínimo
max(a, na.rm = TRUE) # máximo
range(a, na.rm = TRUE) # minimo y máximo
sd(a, na.rm = TRUE) # error estandar
summary(a)

prod(a, na.rm = TRUE)

# Los cuartiles pueden ser personalizados utilizando quantile()
a <- c(1,2,3,4,5,6,7,8,91,2,3,4,5,6,7,8,9)
summary(a)

# Estilo clásico (Cuartiles)
quantile(a, probs = c(0,0.25, 0.5, 0.75,1))
# Estilo Pareto (80-20)
quantile(a, probs = c(0,.2,.8,1))
# Estilo ABC
quantile(a, probs = c(0,.2,0.8,.9,1))
# Usado en Econometría
quantile(a, probs = c(0,.2,0.4, 0.6,.8,1))
