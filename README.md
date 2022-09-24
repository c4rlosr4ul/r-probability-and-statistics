## r-probability-and-statistics
Codes written in R from my probability and statistics classes along with codes from my own research. :D
### To install R on debian-based distributions
#### $ sudo apt update 
#### $ sudo apt install software-properties-common dirmngr
#### $ wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
#### $ gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
#### $ sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
#### $ sudo apt update
#### $ sudo apt install r-base

##### Working with R shell...
#### $ sudo -i R 
##### Exit R shell whit...
#####

##### Stringr is necesary to run this scrip do
    # If you dont have the packages string
	# $ sudo -i R
	# > install.packages("stringr")
	# > install.packages("devtools")
	# > devtools::install_github("tidyverse/stringr")	




