# immagini iperspettrali: sono sistemi dotati di centinaia di bande. 
# Le variabili che sono accumunate da due dimensioni si possono racchiudere in un'unica dimensione. (?)
# Se abbiamo due bande correlate tra loro che spiegano il 50% dei dati ognuna, si possono sfruttare le componenti principali facendo passare due assi tra la nuvola dei punti in modo tale che il 90% dei punti
# sia spiegato dalla PC1 e il 10% dalla PC2. Avendo un set originario con due bande correlate fra loro, invece di utilizzare gli assi originali si utilizzano dei nuovi assi che rappresentano le Principal Component
# così da avere con il primo di questi la maggiore rappresentazione dei dati (circa il 90% nell'esempio del Prof.).

# Analisi Multivariata

library(imageRy)
library(terra)
library(viridis)

im.list()

# importo le bande delle dolomiti

b2 <- im.import("sentinel.dolomites.b2.tif") # blue (490 nm)
b3 <- im.import("sentinel.dolomites.b3.tif") # green (560 nm)
b4 <- im.import("sentinel.dolomites.b4.tif") # red (665 nm)
b8 <- im.import("sentinel.dolomites.b8.tif") # NIR (842 nm)

# creo uno stack delle 4 bande
sentdo <- c(b2, b3, b4, b8)
# visualizzo le informazioni relative allo stack di immagini
sentdo

# visualizzo lo stack
im.plotRGB(sentdo, r=4, g=3, b=2)
# il rosso dell'immagine rappresenta la componente NIR 
im.plotRGB(sentdo, r=3, g=4, b=2)
# il verde dell'immagine rappresenta la componente NIR


# correlazione tra le bande 2, 3, 4, 8. Utilizza l'indice di Pearson e misura la correlazione tra variabili in un range che va da -1 a 1. La correlazione non è causalità! 
pairs(sentdo)
# Le immagini in diagonale e in verde mostrano le correlazioni tra le bande. Rosso, Verde e Blu sono correlate tr loro, il NIR ha una correlazione minore con le altre bande.
