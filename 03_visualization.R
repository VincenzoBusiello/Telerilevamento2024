# Visualizzazione dei dati satellitari in R con imageRy

library(terra)
library(imageRy)

# Tutte le funzioni di imageRy inizia con "im.".

# im.list() fornisce la lista di tutti i dati disponibili in imageRy
im.list()

# importare i dati assegnandoli ad una variabile di nome "mato" con:
mato <- im.import("matogrosso_ast_2006209_lrg.jpg")
# im.import() visualizza direttamente l'immagine importata

# importo i dati assegnandoli ad una variabile di nome "b2".
# con questa immagine si visualizza tutto ciò che riflette la lunghezza d'onda del blu.
b2 <- im.import("sentinel.dolomites.b2.tif")
# cambio la scala dei colori con colorRampPalette() in cui passiamo un vettore di più elementi che corrispondono ai colori
# si possono cambiare le sfumature segnandole nelle parentesi esterne alla funzione
clg <- colorRampPalette(c("black", "grey", "light grey"))(3)
plot(b2, col=clg)
# imposto le sfumature a 100
clg <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(b2, col=clg)
# cambio la palette di colori da utilizzare
clg <- colorRampPalette(c("magenta", "royalblue2", "seagreen3", "yellow1"))(100)
plot(b2, col=clg)
# importo altre bande
b3 <- im.import("sentinel.dolomites.b3.tif")
plot(b3, col=clg)

b4 <- im.import("sentinel.dolomites.b4.tif")
plot(b4, col=clg)

b8 <- im.import("sentinel.dolomites.b8.tif")
plot(b8, col=clg)

# multiframe
par(mfrow=c(2,2))
plot(b2, col=clg)
plot(b3, col=clg)
plot(b4, col=clg)
plot(b8, col=clg)

# exercise: plot the four band in one row
par(mfrow=c(,4))
plot(b2, col=clg)
plot(b3, col=clg)
plot(b4, col=clg)
plot(b8, col=clg)

# creo una immagine satellitare con le bande b2, b3, b4, b8
stacksent <- c(b2, b3, b4, b8)
plot(stacksent, col=clg)

dev.off()
plot(stacksent[[4]], col=clg)
