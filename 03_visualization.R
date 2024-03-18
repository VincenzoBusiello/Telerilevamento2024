# Visualizzazione dei dati satellitari in R utilizzando la libreria imageRy

library(terra)
library(imageRy)

# Tutte le funzioni di imageRy iniziano con "im.".

# im.list() fornisce la lista di tutti i dati disponibili in imageRy
im.list()

# importazione dei dati:
# im.import() visualizza direttamente l'immagine importata
# es: mato <- im.import("matogrosso_ast_2006209_lrg.jpg")


# importo i dati assegnandoli ad una variabile;  la banda del blu è "b2".
# con questa immagine si visualizza tutto ciò che riflette la lunghezza d'onda del blu, quindi la seconda banda.
b2 <- im.import("sentinel.dolomites.b2.tif")

# richiamando il nome della variabile si visualizzano le informazioni di quell'oggetto: 
# classe, dimensione (numero di pixel divisi per riga e colonna); risoluzione (dimensione dei pixel 10,10 significa che ogni pixel è 10 m), ecc.


# cambio la scala dei colori con colorRampPalette() in cui si crea un vettore di colori
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

# multiframe utilizzando par(mfrow=c(2,2))
par(mfrow=c(2,2))
plot(b2, col=clg)
plot(b3, col=clg)
plot(b4, col=clg)
plot(b8, col=clg)

# exercise: plot the four band in one row
par(mfrow=c(1,4))
plot(b2, col=clg)
plot(b3, col=clg)
plot(b4, col=clg)
plot(b8, col=clg)

# multiframe utilizzando una stack
stacksent <- c(b2, b3, b4, b8)
plot(stacksent, col=clg)

dev.off() # comando per chiudere le finestre di visualizzazione di R
# visualizzazione del quarto elemento dello stack
plot(stacksent[[4]], col=clg)


# RGB plotting

# bisogna per prima cosa identificare le bande. Ad ogni banda ci sono un determinato numero di nanometri
# stacksent[[1]] = b2 = 490 nm = blue; 
# stacksent[[2]] = b3 = 560 nm = verde;
# stacksent[[3]] = b4 = 665 nm = rosso;
# stacksent[[4]] = b8 = 842 nm = NIR (nearinfrared)
# le informazioni all'interno di un computer sono concepite con elementi veri o falsi attraverso bit che valgono 0 o 1
# La vegetazione è la componente ambientale che più riflette il NIR. 

im.plotRGB(stacksent, r=3, g=2, b=1)
# im.plotRGB(stacksent, 3, 2, 1)
# per visualizzare la banda dell'infrarosso si imposta lo schema del falso colore, quindi il NIR verrà visualizzato come rosso
# con r=4 si imposta la banda dell'infrarosso al posto del rosso. 
im.plotRGB(stacksent, r=4, g=2, b=1)

# multiframe per visualizzare le differenze tra colori naturali e NIR sostituito al rosso. L'ultimo plot è in falso colore.
par(mfrow=c(1,3))
im.plotRGB(stacksent, r=3, g=2, b=1)
im.plotRGB(stacksent, r=4, g=2, b=1)
im.plotRGB(stacksent, r=4, g=3, b=2)

# sostituendo la banda del verde con il NIR si può descriminare la vegetazione annuale (più chiara) con la vegetazione arborea
par(mfrow=c(1,3))
im.plotRGB(stacksent, r=3, g=2, b=1)
im.plotRGB(stacksent, r=3, g=4, b=1)
im.plotRGB(stacksent, r=3, g=4, b=2)

# sostituzione della banda blu con il NIR. Serve per l'individuazione delle aree urbane
par(mfrow=c(1,3))
im.plotRGB(stacksent, r=3, g=2, b=1)
im.plotRGB(stacksent, r=3, g=2, b=4)
im.plotRGB(stacksent, r=3, g=2, b=4)

# multiframe finale con la funzione par() in cui vengono visualizzate 
par(mfrow=c(2,2))
im.plotRGB(stacksent, r=3, g=2, b=1)
im.plotRGB(stacksent, r=4, g=3, b=2)
im.plotRGB(stacksent, r=3, g=4, b=2)
im.plotRGB(stacksent, r=3, g=2, b=4)

# pairs() è una funzione che mostra la correlazione tra le varie bande. Sulla diagonale si hanno le 4 bande con istogrammi che mostrano la distribuzione dei valori
# i grafici nella matrice triangolare inferiore mostrano le correlazioni tra le bande. prendendo in considerazione la banda NIR si evidenzia come tale banda aggiunge più informazioni rispetto alle bande del visibile, infatti la correlazione è minore con queste ultime
pairs(stacksent)
