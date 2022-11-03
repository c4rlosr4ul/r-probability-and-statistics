  library(openxlsx)
  library(readxl)
  library(readr)
  
  data_to_use_in_R <- read_excel("data_to_use_in_R.xlsx")
  datos <- data_to_use_in_R
  View(data_to_use_in_R)
  
  c1 <-  datos[["x"]]
  c2 <-  datos[["y"]]
  c3 <- C(1,1,1)
  
  vf <- -(datos[["x"]]^2 + datos[["y"]]^2)
   
  
  # No me alcanzó en tiempo :c