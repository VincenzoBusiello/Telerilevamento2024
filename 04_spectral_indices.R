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
