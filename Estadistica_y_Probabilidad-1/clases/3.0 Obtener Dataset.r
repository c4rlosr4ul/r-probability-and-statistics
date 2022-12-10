#---------------------#
#      Sesión 3       #
# Lectura y Escritura #
#   Mg. Javier Vega   #
#---------------------#
# Para limpiar el workspace, por si hubiera algun dataset o informacion cargada
rm(list = ls()) # borra todo

# Cambiar el directorio de trabajo
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


# ---
#---- Leer desde archivos planos ----
# ---
# read.table(file, header, sep, dec, skip)
# file: nombre o ruta donde están alojados los datos.
#   Puede ser un url o una dirección del computador.
# header: valor lógico, se usa TRUE si la primera
#   línea de la base de datos tiene los nombres de
#   las variables, caso contrario se usa FALSE.
# sep: tipo de separación interna para los datos
#   dentro del archivo. Los valores usuales son:
#    sep=','  archivo con extensión .csv.
#    sep=''   archivo es bloc de notas con
#             espacios por la barra espaciadora.
#    sep='\t' archivo es bloc de notas con
#             espacios por la barra tabuladora.
# dec: símbolo con el cual se indican los decimales.
# skip: lineas que se van a omitir desde el principio.

# Es también posible usar file.choose() para que
#  se abra un ventana y adjuntar el archivo manualmente.

# Un error frecuente es escribir la dirección o
#  ubicación del archivo usando \, en lugar de usar /.

# --- Leer desde archivo csv ---
datos <- read.table(file='D:/Data Learning/R/Estadistica/aptos.csv',
                    header=TRUE, sep=',')
head(datos)


# --- Leer desde archivo txt ---
# 1.0
# Bloc de notas con barra espaciadora --> barra_de_espacios.txt
datos <- read.table(file.choose(),
                    header=TRUE, sep='')
head(datos)

# 2.0
# Bloc de notas con barra tabuladora
datos <- read.table(file='tabulacion.txt',
                    header=TRUE, sep='\t')
head(datos)


# --- Leer utilizando skip ---
datos <- read.table(file='D:/Data Learning/R/Estadistica/medidas_cuerpo.csv',
                    header=TRUE, sep=',', skip=3)
head(datos)
datos <- read.table(file='D:/Data Learning/R/Estadistica/medidas_cuerpo.csv',
                    header=TRUE, sep=',')
head(datos)
datos <- read.table(file='medidas_cuerpo.txt',
                    header=TRUE, sep='\t', skip=15)
head(datos)

# --- Leer desde url ---
enlace <- 'https://raw.githubusercontent.com/fhernanb/datos/master/aptos2015'
datos <- read.table(file=enlace, header=TRUE)
head(datos)



# ---
#---- Escritura ----
# ---
# Coma como separador y punto como separador decimal
write.csv(datos, "mi_df.csv", row.names = FALSE)

# Punto y coma como separador y coma como separador decimal
write.csv2(datos, "mi_df2.csv", row.names = FALSE)



# ---
#---- Leer desde Excel ----
# ---
# readxl()
# Si los datos están disponibles en un archivo
#  de Excel, y dentro hay hojas con la información
#  a utilizar, se recomienda usar el paquete
#  readxl (Wickham and Bryan 2019) y la función readxl
install.packages("readxl")
library(readxl)

# Error
datos <- read_excel('excel_hojas.xlsx', sheet='fuma')
datos <- read_excel('excel_hojas.xlsx', sheet='Fuma')
head(datos)
head(as.data.frame(datos))

datos <- read_excel(file.choose(), sheet='Bebe')
head(datos)
head(as.data.frame(datos))
