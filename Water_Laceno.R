library(terra) # Per la funzione rast()
library(imageRy) # Per im.plotRGB() e im.classify()
library(ggplot2) # Per la creazione dei boxplot
library(patchwork) # Per visualizzare i boxplot insieme
library(viridis) # Per utilizzare colorRampPalette adatte a chi soffre di deuteranomalia (daltonismo)

# Imposto la cartella di lavoro dove sono state posizionate le immagini relative all'altopiano Laceno.
# Tale codice ha l'obiettivo di quantificare la variazione della superficie del Lago Laceno tra la 
# stagione estiva e quella invernale e valutare l'andamento in un periodo compreso tra il 2017
# e il 2020. 
setwd("C:/TelExam")

# Le immagini sono state scaricate grazie al Copernicus Browser. 
# La porzione di interesse è un'area di 3.40 Km2. Le immagini sono state catturate 
# con Sentinel-2. Sono state scaricate le immagini relative alle bande del blu, verde, rosso e NIR

# Carico le immagini del lago in estate e inverno. Ogni banda viene assegnata ad un oggetto. 
# Queste vengono poi incluse in uno stack per creare una immagine che contenga tutte le bande. 
# Verrà fatto lo stesso per ogni anno.

                                  # estate e inverno 2017
l17_1 <- rast("l17_1.tiff")
l17_2 <- rast("l17_2.tiff")
l17_3 <- rast("l17_3.tiff")
l17_4 <- rast("l17_4.tiff")
l17 <- c(l17_1, l17_2, l17_3, l17_4)

d17_1 <- rast("d17_1.tiff")
d17_2 <- rast("d17_2.tiff")
d17_3 <- rast("d17_3.tiff")
d17_4 <- rast("d17_4.tiff")
d17 <- c(d17_1, d17_2, d17_3, d17_4)


                                  # in estate e inverno 2018
l18_1 <- rast("l18_1.tiff")
l18_2 <- rast("l18_2.tiff")
l18_3 <- rast("l18_3.tiff")
l18_4 <- rast("l18_4.tiff")
l18 <- c(l18_1, l18_2, l18_3, l18_4)

d18_1 <- rast("d18_1.tiff")
d18_2 <- rast("d18_2.tiff")
d18_3 <- rast("d18_3.tiff")
d18_4 <- rast("d18_4.tiff")
d18 <- c(d18_1, d18_2, d18_3, d18_4)


                                  # lago in estate e inverno 2019
l19_1 <- rast("l19_1.tiff")
l19_2 <- rast("l19_2.tiff")
l19_3 <- rast("l19_3.tiff")
l19_4 <- rast("l19_4.tiff")
l19 <- c(l19_1, l19_2, l19_3, l19_4)

d19_1 <- rast("d19_1.tiff")
d19_2 <- rast("d19_2.tiff")
d19_3 <- rast("d19_3.tiff")
d19_4 <- rast("d19_4.tiff")
d19 <- c(d19_1, d19_2, d19_3, d19_4)


                                  # lago in estate e inverno 2020
l20_1 <- rast("l20_1.tiff")
l20_2 <- rast("l20_2.tiff")
l20_3 <- rast("l20_3.tiff")
l20_4 <- rast("l20_4.tiff")
l20 <- c(l20_1, l20_2, l20_3, l20_4)

d20_1 <- rast("d20_1.tiff")
d20_2 <- rast("d20_2.tiff")
d20_3 <- rast("d20_3.tiff")
d20_4 <- rast("d20_4.tiff")
d20 <- c(d20_1, d20_2, d20_3, d20_4)

# imposto una visualizzazione delle immagini utilizzando la funzione par(), 
# creando una griglia di 4 righe e 2 colonne. Il plot viene impostato con la banda del NIR
# in prima posizione così da evidenziare al meglio la vegetazione e il lago.

par(mfrow=c(4,2))
im.plotRGB(l17, 4,3,2)
im.plotRGB(d17, 4,3,2)
im.plotRGB(l18, 4,3,2)
im.plotRGB(d18, 4,3,2)
im.plotRGB(l19, 4,3,2)
im.plotRGB(d19, 4,3,2)
im.plotRGB(l20, 4,3,2)
im.plotRGB(d20, 4,3,2)

# calcolo l'NDWI (Normalized Difference Water Index) seguendo la formula: 
# NDWI=(B3-B8)/(B3+B8)   McFeeters (1996)
# N.B.: B3 qui è la banda del verde così come impostata su sentinel. B8 è per il NIR. 
# si sfruttano queste due bande per poter mettere in risalto l'acqua. 

# 2017
# estate
dif1_e = l17[[2]] - l17[[4]] # differenza tra GREEN e NIR
sum1_e = l17[[2]] + l17[[4]] # somma tra GREEN e NIR
ndwi1_e = dif1_e / sum1_e

# inverno
dif1_i = d17[[2]] - d17[[4]] # differenza tra GREEN e NIR
sum1_i = d17[[2]] + d17[[4]] # somma tra GREEN e NIR
ndwi1_i = dif1_i / sum1_i

# 2018
# estate
dif2_e = l18[[2]] - l18[[4]] # differenza tra GREEN e NIR
sum2_e = l18[[2]] + l18[[4]] # somma tra GREEN e NIR
ndwi2_e = dif2_e / sum2_e

#inverno
dif2_i = d18[[2]] - d18[[4]] # differenza tra GREEN e NIR
sum2_i = d18[[2]] + d18[[4]] # somma tra GREEN e NIR
ndwi2_i = dif2_i / sum2_i

# 2019
# estate
dif3_e = l19[[2]] - l19[[4]] # differenza tra GREEN e NIR
sum3_e = l19[[2]] + l19[[4]] # somma tra GREEN e NIR
ndwi3_e = dif3_e / sum3_e

# inverno
dif3_i = d19[[2]] - d19[[4]] # differenza tra GREEN e NIR
sum3_i = d19[[2]] + d19[[4]] # somma tra GREEN e NIR
ndwi3_i = dif3_i / sum3_i

# 2020
# estate
dif4_e = l20[[2]] - l20[[4]] # differenza tra GREEN e NIR
sum4_e = l20[[2]] + l20[[4]] # somma tra GREEN e NIR
ndwi4_e = dif4_e / sum4_e

# inverno
dif4_i = d20[[2]] - d20[[4]] # differenza tra GREEN e NIR
sum4_i = d20[[2]] + d20[[4]] # somma tra GREEN e NIR
ndwi4_i = dif4_i / sum4_i


# Visualizzazione delle immagini elaborate attraverso l'indice NDWI, 
# suddividendoli per stagione estiva e invernale.
# La colorazione scelta è viridis perché la porzione di acqua verrà evidenziata in giallo, 
# il resto del territorio apparirà in una scala di blu. 
# Sfrutto sempre la stessa impostazione data da un par() con 4 righe e 2 colonne così da avere 
# a sinistra le immagini relative al lago in estate e a destra le immagini relative al lago in inverno

par(mfrow=c(4,2))
plot(ndwi1_e, col=viridis (100)) # 2017 estate
plot(ndwi1_i, col=viridis (100)) # 2017 inverno
plot(ndwi2_e, col=viridis (100)) # 2018 estate
plot(ndwi2_i, col=viridis (100)) # 2018 inverno
plot(ndwi3_e, col=viridis (100)) # 2019 estate
plot(ndwi3_i, col=viridis (100)) # 2019 inverno
plot(ndwi4_e, col=viridis (100)) # 2020 estate
plot(ndwi4_i, col=viridis (100)) # 2020 inverno


# classificazione che verrà visualizzata 
par(mfrow=c(4,2))

e17c <- im.classify(ndwi1_e, num_clusters=3)

# calcolo le percentuali di copertura per ogni classe per l'estate 2017

t17e <- ncell(e17c)
f17e <- freq(e17c)
prop17e = f17e / t17e
perc17e = prop17e * 100
perc17e

i17c <- im.classify(ndwi1_i, num_clusters=3)

# calcolo le percentuali di copertura per ogni classe per l'inverno 2017

t17i <- ncell(i17c)
f17i <- freq(i17c)
prop17i = f17i / t17i
perc17i = prop17i * 100
perc17i

e18c <- im.classify(ndwi2_e, num_clusters=3)

# calcolo le percentuali di copertura per ogni classe per l'estate 2018

t18e <- ncell(e18c)
f18e <- freq(e18c)
prop18e = f18e / t18e
perc18e = prop18e * 100
perc18e


i18c <- im.classify(ndwi2_i, num_clusters=3)

# calcolo le percentuali di copertura per ogni classe per l'inverno 2018

t18i <- ncell(i18c)
f18i <- freq(i18c)
prop18i = f18i / t18i
perc18i = prop18i * 100
perc18i

e19c <- im.classify(ndwi3_e, num_clusters=3)

# calcolo le percentuali di copertura per ogni classe per l'estate 2019

t19e <- ncell(e19c)
f19e <- freq(e19c)
prop19e = f19e / t19e
perc19e = prop19e * 100
perc19e

i19c <- im.classify(ndwi3_i, num_clusters=3)

# calcolo le percentuali di copertura per ogni classe per l'inverno 2019

t19i <- ncell(i19c)
f19i <- freq(i19c)
prop19i = f19i / t19i
perc19i = prop19i * 100
perc19i

e20c <- im.classify(ndwi4_e, num_clusters=3)

# calcolo le percentuali di copertura per ogni classe per l'estate 2020

t20e <- ncell(e20c)
f20e <- freq(e20c)
prop20e = f20e / t20e
perc20e = prop20e * 100
perc20e

i20c <- im.classify(ndwi4_i, num_clusters=3)

# calcolo le percentuali di copertura per ogni classe per l'inverno 2020

t20i <- ncell(i20c)
f20i <- freq(i20c)
prop20i = f20i / t20i
perc20i = prop20i * 100
perc20i

# creazione del dataframe in cui raccolgo le percentuali di copertura delle varie classi dividendole per stagione
season <- c("summer", "winter")
soil <- c(33.06, 68.72, 37.36, 84.02, 35.73, 60.29, 37.75, 81.31) # percentuali di suolo nudo
veg <- c(64.69, 23.82, 59.67, 13.50, 61.81, 27.47, 60.36, 15.59) # percentuali di vegetazione
water <- c(2.25, 7.46, 2.96, 2.49, 2.46, 12.23, 1.89, 3.09) # percentuali della dimensione del lago
# tali percentuali sono espresse in relazione alla superficie totale dell'area di studio

#
tab <- data.frame(season, soil, veg, water)
tab

View(tab) # permette la visualizzazione del dataframe in una versione tabellare

# creazione dei boxplot 

psoil <- ggplot(tab, aes(x=season, y=soil, color=season)) + 
geom_boxplot(outlier.colour="red", outlier.shape=8, outlier.size=4)+ 
ylim(c(0,100)) + 
xlab("Stagione") +
ylab("Suolo (%)") +
ggtitle("Suolo 2017-2020")

pveg <- ggplot(tab, aes(x=season, y=veg, color=season)) +
geom_boxplot(outlier.colour="red", outlier.shape=8, outlier.size=4) +
ylim(c(0,100)) + 
xlab("Stagione") +
ylab("Vegetazione (%)") +
ggtitle("Vegetazione 2017-2020")

pwater <- ggplot(tab, aes(x=season, y=water, color=season)) +
geom_boxplot(outlier.colour="red", outlier.shape=8, outlier.size=4) +
ylim(c(0,100)) + 
xlab("Stagione") +
ylab("Acqua (%)") +
ggtitle("Dimensione del lago 2017-2020")

# visualizzo i boxplot
psoil + pveg + pwater

# zoom sulla variabilità della quantità d'acqua tra estate ed inverno
pwater <- ggplot(tab, aes(x=season, y=water, color=season)) +
geom_boxplot(outlier.colour="red", outlier.shape=8, outlier.size=4) +
xlab("Stagione") +
ylab("Acqua (%)") +
ggtitle("Dimensione del lago 2017-2020")

pwater
