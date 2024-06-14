library(terra)
library(imageRy)
library(viridis)
library(ggplot2)
library(patchwork)


setwd("C:/TelExam") # imposto la cartella di lavoro 

# Ad ogni immagine è assegnata una banda
l17_1 <- rast("l17_1.tiff") #blue
l17_2 <- rast("l17_2.tiff") #green
l17_3 <- rast("l17_3.tiff") #red
l17_4 <- rast("l17_4.tiff") #NIR

l17 <- c(l17_1, l17_2, l17_3, l17_4) #costruisco l'immagine che andrò ad utilizzare assemblandola con le diverse bande.



d17_1 <- rast("d17_1.tiff") #blue
d17_2 <- rast("d17_2.tiff") #green
d17_3 <- rast("d17_3.tiff") #red
d17_4 <- rast("d17_4.tiff") #NIR

d17 <- c(d17_1, d17_2, d17_3, d17_4) #costruisco l'immagine che andrò ad utilizzare assemblandola con le diverse bande.


par(mfrow=c(2,1)) #confronto delle due immagini sostituendo la banda del blu con quella NIR
im.plotRGB(l17, 4,3,2)
im.plotRGB(d17, 4,3,2)


# per mettere in risalto lo specchio d'acqua utilizzo l'indice NWDI (Normalized Difference Water Index)
# tale indice si comporta come l'NDVI, quindi ha valori massimi e minimi compresi tra 1 e -1. 
# per valori maggiori di 0.3 si assegna il pixel ad uno specchio d'acqua. Viene utilizzato proprio per quantificare l'innalzamento del livello d'acqua.

dif1 = l17[[2]] - l17[[4]] # differenza tra GREEN e NIR
sum1 = l17[[2]] + l17[[4]] # somma tra GREEN e NIR
ndwi1= dif1 / sum1 
plot(ndwi1, col=viridis (1000))

dif2 = d17[[2]] - d17[[4]]
sum2 = d17[[2]] + d17[[4]]
ndwi2= dif2 / sum2
plot(ndwi2, col=viridis (1000))

# sfrutto la classificazione per poter quantificare l'incremento della superficie idrica, paragonando le percentuali ottenute e assegnate all'acqua.
l17c <- im.classify(ndwi1, num_clusters=4)

# classe 1: Altro                9.04   %
# classe 2: Suolo                21.12  %
# classe 3: Vege.                69.62  %
# classe 4: Acqua                0.22   %

d17c <- im.classify(ndwi2, num_clusters=4)

# classe 1: Altro                15.13  %
# classe 2: Acqua                0.89   %
# classe 3: Suolo                61.30  %
# classe 4: Vege.                22.67  %

tot1 <- ncell(l17c)
f1 <- freq(l17c)
prop1 = f1 / tot1
perc1 = prop1 * 100 # trasformo i dati in percentuali

tot2 <- ncell(d17c)
f2 <- freq(d17c)
prop2 = f2 / tot2
perc2 = prop2 * 100

# creo una tabella in cui verranno inseriti i dati relativi ad ogni classe

class <- c("water", "soil", "Fol. Cov.", "Grass")
pl17 <- c(2.13, 11.70, 31.67, 54.50)
pd17 <- c(7.22, 19.18, 9.80, 63.79)

tab <- data.frame(class, pl17, pd17)
tab

p1 <- ggplot(tab, aes(x=class, y=pl17, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100)) # imposto il grafico per mostrare i risultati
p2 <- ggplot(tab, aes(x=class, y=pd17, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1 + p2

