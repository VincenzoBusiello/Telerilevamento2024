# Ci sono degli indici per calcolare la riflettanza e per calcolare la biomassa di un determinato sito. Gran parte di questi indici sfruttano due informazioni: 
# una inerente all'infrarosso vicino (le piante riflettono molto questa lunghezza d'onda; una inerente la banda del rosso, più vicina al NIR, perché le piante hanno 
# due reazioni fondamentali riflettanza all'infrarosso e la fotosintesi (perciò la banda del Rosso -> Ciclo di Calvin). 
# La riflettanza essendo una divisione tra energia riflessa e energia in entrata varrà tra 0 e 1; la si può assumere quindi anche con un numero da 0 a 100.
# si può creare un nuova banda che riassume i valori tra le due bande selezionate con una riflettanza uguale alla loro differenza. 
# Questa banda verrà riassunta dal DVI (difference vegetation index). 


library(terra)
library(imageRy)

# visualizzo la lista di file disponibili nel pacchetto imageRy
im.list()

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
# questa è una immagine del matogrosso che proviene dall'Earth Observatory (oppure su Visible Earth), un sito della NASA, da cui si possono ricavare le informazioni relative cercando il nome dell'immagine.
# è stata creata con un plot di tre bande (1=NIR, 2=Red, 3=Green) e poi salvate sul sito

im.plotRGB(m1992, r=1, g=2, b=3)
# inserisco la banda del NIR al posto della banda del Verde così da ottenere in verde ciò che è la foresta pluviale
im.plotRGB(m1992, r=2, g=1, b=3)
# inserisco NIR sulla banda del blu così da mettere in risalto il suolo nudo che verrà rappresentato in giallo; il fiume appare giallo perché l'acqua era torbida
im.plotRGB(m1992, r=2, g=3, b=1)

# importo l'immagine del mato grosso del 2006
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
im.plotRGB(m2006, r=1, g=2, b=3)
# inserisco la banda del NIR al posto della banda del Verde così da ottenere in verde ciò che è la foresta pluviale
im.plotRGB(m2006, r=2, g=1, b=3)
# inserisco NIR sulla banda del blu così da mettere in risalto il suolo nudo che verrà rappresentato in giallo; il fiume appare giallo perché l'acqua era torbida
im.plotRGB(m2006, r=2, g=3, b=1)

# plot delle tre bande per le due immagini
par(mfrow=c(2,3))
# NIR su R 1992 
im.plotRGB(m1992, r=1, g=2, b=3)
# NIR su G 1992
im.plotRGB(m1992, r=2, g=1, b=3)
# NIR su R 1992
im.plotRGB(m1992, r=2, g=3, b=1)
# NIR su R 2006
im.plotRGB(m2006, r=1, g=2, b=3)
# NIR su G 2006
im.plotRGB(m2006, r=2, g=1, b=3)
# NIR su B 2006
im.plotRGB(m2006, r=2, g=3, b=1)

# creazione di un indice per fare delle differenze quantitative per valutare il cambiamento del paesaggio


# riprendo la lista dei file a disposizione nel pacchetto imageRy

im.list()

# importo l'immagine "matogrosso_l5_1992219_lrg.jpg" assegnandole il nome m1992
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

# calcolo del DVI (difference vegetation index); utilizzo l'uguale perché è una operazione matematica
# si prende la banda del NIR e si esegue una sottrazione di pixel con la banda del Rosso; 
# se il risultato della sottrazione sarà alto allora quel pixel comprende una zona di vegetazione
# essendo in 8 bit, se il valore NIR sarà massimo allora la sottrazione sarà 255-0=255; al contrario sarebbe -255. 
dvi1992 = m1992[[1]] - m1992[[2]]
# si può scrivere anche utilizzando i nomi delle bande ma la prima banda dovrebbe essere richiamata con: m1992$matogrosso~2219_lrg_1; molto più complicato e meno intuitivo

# color palette da utilizzare per visualizzare la banda ricavata in DVI
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(dvi1992, col=cl)


# importo l'immagine del 2006 e calcolo il DVI

im.list()
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
dvi2006 = m2006[[1]] - m2006[[2]]


#esercizio: plotting delle due immagini DVI per metterle a confronto

par(mfrow=c(2,1))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)

# se le immagini a disposizione sono a bit differenti, si cambia indice utilizzando una normalizzazione. l'indice da utilizzare sarà NDVI (Normalized Difference Vegetation Index)
# NDVI = NIR-RED/NIR+RED; il risultato sarà compreso tra -1 e 1;
ndvi1992 = dvi1992 / (m1992[[1]] + m1992[[2]])
ndvi2006 = dvi2006 / (m2006[[1]] + m2006[[2]])

par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

# si può utilizzare anche una funzione di imageRy: im.ndvi(m1992, 1, 2)
