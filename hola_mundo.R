	# If you dont have the packages string
	# $ sudo -i R
	# > install.packages("stringr")
	# > install.packages("devtools")
	# > devtools::install_github("tidyverse/stringr")	

	library('stringr')
	#that_is_a_commentariou XD
	variable <- c("hola_mundo")
	
	str_length(variable)
	#function that counts the number of characters 
	#of the value in the variable

	str_c(variable, collapse="")
	#the_message	
	#:D

	#If you want to run this code only put in the terminal
	# $ Rscript hola_mundo.R