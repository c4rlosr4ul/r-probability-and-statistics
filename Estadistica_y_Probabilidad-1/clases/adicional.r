

# --- 5.0 ---
x = Tabla[,4]
y = Tabla[,3]
table(x, y, dnn = c("Frecuencia", "Nota Promedio"))

x = Tabla[,4]
y = c()
for (i in (1:length(x))) {
  #y = cbind(y, paste("Grupo", i))
  #y = cbind(y, paste("Categoria", toupper(letters[i])))
  y = cbind(y, paste("De", Tabla[i, 1], "a", Tabla[i, 2]))
}
#y
table(x, y, dnn = c("Frecuencia", "Nota"))
