## r-probability-and-statistics
Codes written in R from my probability and statistics classes along with codes from my own research. :D
### To install R on debian-based distributions
```bash
$ sudo apt update 
$ sudo apt install software-properties-common dirmngr
$ wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
$ gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
$ sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
$ sudo apt update
$ sudo apt install r-base
```
#### Working with R shell...
```bash
$ sudo -i R
``` 
##### Exit R shell whit...
```R
    >q()
```
##### Stringr is necesary to run this scrip do my hola_mundo
###### If you dont have the packages string
```bash
$ sudo -i R
```
```R
    >install.packages("stringr")
    >install.packages("devtools")
    >devtools::install_github("tidyverse/stringr")	
```
#### If you want to run this code only put in the terminal
```bash
$ Rscript hola_mundo.R
```



