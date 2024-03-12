# Visualizzazione dei dati satellitari in R con imageRy

library(terra)
library(imageRy)

# Tutte le funzioni di imageRy inizia con "im.".

# im.list() fornisce la lista di tutti i dati disponibili in imageRy
im.list()

# importare i dati assegnandoli ad una variabile di nome "mato" con:
mato <- im.import("matogrosso_ast_2006209_lrg.jpg")
mato
