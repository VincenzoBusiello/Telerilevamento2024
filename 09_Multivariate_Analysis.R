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


pairs(sentdo)
# pairs() è la funzione per poter calcolare la correlazione con il metodo di Pearson. Tra le bande blu, verde e rosso c'è un'alta correlazione (0.99 in un range che va da -1 (correlazione negativa) a 1(correlazione positiva))
# Le immagini in diagonale e in verde mostrano le correlazioni tra le bande. Rosso, Verde e Blu sono correlate tr loro, il NIR ha una correlazione minore con le altre bande.

# Principal Components Analysis

pcimage <- im.pca(sentdo)
# la prima stringa indica la variabilità di ogni banda

tot <- sum(1315.01800, 605.44274, 44.06567, 30.26080)
1315.01800 * 100 / tot # calcolo della percentuale della varianza spiegata dal primo asse PC1, il risultato è 65.92%
605.44274 * 100 / tot # 30.35%
44.06567 * 100 / tot # 2.21%
30.26080 * 100 / tot # 1.52%

vir <- colorRampPalette(viridis(7))(100)
plot(pcimage, col=viridis (100))
