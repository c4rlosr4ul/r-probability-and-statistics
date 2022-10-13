#that_is_a_commentary XD

# If you don't have the packages string
# $ sudo -i R
# > install.packages("stringr")
# > install.packages("devtools")
# > devtools::install_github("tidyverse/stringr")	

library('stringr')
variable <- c("hola_csmares")
var1 <- c("hola_csmares tiene >>")
var2 <- c("caracteres :P")

str_c(variable, collapse="")
str_c(var1, collapse="")
str_length(variable)
str_c(var2, collapse="")

#function that counts the number of characters 
#of the value in the variable

#the_message	
#:D

#If you want to run this code only put in the terminal
# $ Rscript hola_mundo.R