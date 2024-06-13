library(terra)
library(imageRy)
library(viridis)

setwd("C:/TelExam") # imposto la cartella di lavoro 
# Ad ogni immagine è assegnata una banda
lb1 <- rast("lb1.jpg") # blue
lb2 <- rast("lb2.jpg") # green
lb3 <- rast("lb3.jpg") # red
lb4 <- rast("lb4.jpg") # NIR

lbdo <- c(lb1,lb2,lb3,lb4)

db1 <- rast("db1.jpg") # blue
db2 <- rast("db2.jpg") # green
db3 <- rast("db3.jpg") # red
db4 <- rast("db4.jpg") # NIR

dbdo <- c(db1,db2,db3,db4)

par(mfrow=c(2,1)) #confronto delle due immagini sostituendo la banda del blu con quella NIR
im.plotRGB(lbdo, 4,3,2)
im.plotRGB(dbdo, 4,3,2)

# per mettere in risalto lo specchio d'acqua utilizzo l'indice NWDI (Normalized Difference Water Index)
# tale indice si comporta come l'NDVI, quindi ha valori massimi e minimi compresi tra 1 e -1. 
# per valori maggiori di 0.3 si assegna il pixel ad uno specchio d'acqua. Viene utilizzato proprio per quantificare l'innalzamento del livello d'acqua.

dif1 = lbdo[[2]]-lbdo[[4]] # differenza tra GREEN e NIR
sum1 = lbdo[[2]]+lbdo[[4]] # somma tra GREEN e NIR
nwat1= dif1/sum1 
plot(nwat1, col=viridis (1000))

dif2 = dbdo[[2]]-dbdo[[4]]
sum2 = dbdo[[2]]+dbdo[[4]]
nwat2= dif2/sum2
plot(nwat2, col=viridis (1000))

# sfrutto la classificazione per poter quantificare l'incremento della superficie idrica, paragonando le percentuali ottenute e assegnate all'acqua.
nwat1c <- im.classify(nwat1, num_clusters=4)
# classe 1: Antropizzazione 9.04   %
# classe 2: Suolo           21.12  %
# classe 3: Vegetazione     69.62  %
# classe 4: Acqua           0.22   %

nwat2c <- im.classify(nwat2, num_clusters=4)
# classe 1: Antropizzazione 15.13  %
# classe 2: Acqua           0.89   %
# classe 3: Suolo           61.30  %
# classe 4: Vegetazione     22.67  %

tot1 <- ncell(nwat1c)
f1 <- freq(nwat1c)
prop1 = f1 / tot1
perc1 = prop1 * 100 # trasformo i dati in percentuali

tot2 <- ncell(nwat2c)
f2 <- freq(nwat2c)
prop2 = f2 / tot2
perc2 = prop2 * 100

# creo una tabella in cui verranno inseriti i dati relativi ad ogni classe

class <- c("Altro", "Suolo", "Veg.", "Acqua")
pwat1 <- c(9.04, 21.12, 69.62, 0.22)
pwat2 <- c(15.13, 61.30, 22.67, 0.89)

tabout <- data.frame(class, pwat1, pwat2)
tabout
