# misura della variabilità: prendendo una immagine si possono misurare i valori di riflettanza per ogni pixel. 
# Vedendo come riflette ogni pixel per le bande si forma una grafico. Più sono simili i punti, più sarà compatta la nuvola di punti. 
# Maggiore è la variabilità in termini spettrali maggiore sarà la variabilità a livello ambientale e quindi saranno presenti più nicchie ecologiche e più specie
# Si può applicare la stessa variabilità per la geomorfologia. Ciò si può fare con la deviazione standard: presa una curva normale, la ds sarà il 68% dei dati. 
# Maggiore è la deviazione standard, maggiore sarà la variabilità ecosistemica/geomorfologica. Si possono creare delle mappe di variabilità con delle moving window
# Avendo una immagine satellitare la si sottopone ad una finestra di 3 pixel di lato, si calcola la deviazione standard di ogni pixel e la si riporta sul pixel centrale
#così facendo si ottiene una mappa completa con tutte le deviazioni standard degli intervalli dati dalla grandezza della moving window. 



library(terra) 
library(imageRy)
install.packages("viridis")
library(viridis)

im.list() # apro la lista di immagini all'interno del pacchetto imageRy

sent -> im.import("sentinel.png")

im.plotRGB(sent, 1,2,3) 
# NIR = banda 1 --> tutto ciò che è vegetazione verrà rappresentato in rosso
# Red = Banda 2
# Green = Banda 3

im.plotRGB(sent, 2,1,3)

# Per calcolare la deviazione standard bisogna scegliere una delle variabili, in questo caso uno dei livelli, su cui calcolarla. 
# Il livello che discrimina di più gli oggetti è il NIR. 

# assegno il livello 1 di sent alla variabile nir

nir <- sent[[1]]
cl <- colorRampPalette(c("black", "blue", "green", "white"))(100)
plot(nir, col=cl)

# la funzione focal() viene utilizzata per il calcolo della variabilità attraverso la "moving window". 
# il secondo argomento della funzione focal() è una matrice esplicata con la funzione matrix() in cui verrà inserito il range di pixel della moving window,
# numero di pixel per colonna e per riga; il terzo argomento è la funzione di standard deviation sd

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

# utilizzo la gamma di colori viridis proveniente dal pacchetto viridi
viridisc <- colorRampPalette(viridis(7))(256)
plot(sd3, col=viridisc)
# la variabilità viene indicata con la differenza di colore: dove è stato rimarcato il giallo vi è maggiore variabilità. Vengono risaltati molto di più i bordi.
# più è piccola la finestra maggiore sarà la misura di dettaglio della deviazione standard. 

sd7 <- focal(nir, matrix (1/49, 7, 7), fun=sd)
plot(sd7, col=viridisc)

# creo uno stack per poter vedere le differenze tra le due deviazioni standard
stacksd <- c(sd3,sd7)
plot(stacksd, col=viridisc)

sd13 <- focal(nir, matrix (1/169, 13, 13), fun=sd)
plot(sd13, col=viridisc)

stacksd <- c(sd3, sd7, sd13)

# la banda che più viene scelta per eseguire questi calcoli è quella del NIR perché è più discriminante. Se non ci fosse l'infrarosso allora si potrebbe ovviare
# con le componenti principali, delle quali la prima componente comprenderà la più ampia variabilità. Essendo le bande originali molto correlate tra loro si 
# esegue l'analisi delle componenti principali così da avere la componente con la più alta variabilità. 
