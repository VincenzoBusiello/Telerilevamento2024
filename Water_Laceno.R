library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)
library(viridis)


setwd("C:/TelExam")


lu17_1 <- rast("luglio17_1.tiff")
lu17_2 <- rast("luglio17_2.tiff")
lu17_3 <- rast("luglio17_3.tiff")
lu17_4 <- rast("luglio17_4.tiff")
luglio17 <- c(lu17_1, lu17_2, lu17_3, lu17_4)

im.plotRGB(luglio17, 4,1,2) # combinazione di bande che permette di identificare meglio a livello visivo la superficie ricoperta di acqua

ndwi1 <- im.classify(luglio17, num_clusters=3)
plot(ndwi1, col=viridis (100))
#classe1: Acqua
#Classe2: Altro
#Classe3: Cop. Fol.

tot1 <- ncell(ndwi1)
f1 <- freq(ndwi1)
prop1 = f1 / tot1
perc1 = prop1 * 100 # trasformo i dati in percentuali


lu18_1 <- rast("luglio18_1.tiff")
lu18_2 <- rast("luglio18_2.tiff")
lu18_3 <- rast("luglio18_3.tiff")
lu18_4 <- rast("luglio18_4.tiff")
luglio18 <- c(lu18_1, lu18_2, lu18_3, lu18_4)

im.plotRGB(luglio18, 4,1,2)


