# Installing new packages in R
# Utilizzando la funzione install.packages() si possono installare librerie. Di default R prende le librerie dal CRAN.
# Lanciando la funzione può richiedere di scegliere la città di provenienza per terminare l'installazione.

install.packages("terra")

# Una volta installato il pacchetto si richiama la funzione library per caricare il pacchetto.
# Può essere utilizzata anche per controllare se è già presente il pacchetto.

library("terra")
