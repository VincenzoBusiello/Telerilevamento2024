library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)
library(viridis)


setwd("C:/TelExam")


                                  # lago in estate e inverno 2017
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


                                  # lago in estate e inverno 2018
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


                                  # lago in estate e inverno 2021
l21_1 <- rast("l21_1.tiff")
l21_2 <- rast("l21_2.tiff")
l21_3 <- rast("l21_3.tiff")
l21_4 <- rast("l21_4.tiff")
l21 <- c(l21_1, l21_2, l21_3, l21_4)

d21_1 <- rast("d21_1.tiff")
d21_2 <- rast("d21_2.tiff")
d21_3 <- rast("d21_3.tiff")
d21_4 <- rast("d21_4.tiff")
d21 <- c(d21_1, d21_2, d21_3, d21_4)

par(mfrow=c(5,2))
im.plotRGB(l17, 4,3,2)
im.plotRGB(d17, 4,3,2)
im.plotRGB(l18, 4,3,2)
im.plotRGB(d18, 4,3,2)
im.plotRGB(l19, 4,3,2)
im.plotRGB(d19, 4,3,2)
im.plotRGB(l20, 4,3,2)
im.plotRGB(d20, 4,3,2)
im.plotRGB(l21, 4,3,2)
im.plotRGB(d21, 4,3,2)

# calcolo l'NDWI seguendo la formula NDWI=(verde-NIR)/(verde+NIR)

# 2017
dif1_e = l17[[2]] - l17[[4]] # differenza tra GREEN e NIR
sum1_e = l17[[2]] + l17[[4]] # somma tra GREEN e NIR
ndwi1_e = dif1_e / sum1_e

dif1_i = d17[[2]] - d17[[4]] # differenza tra GREEN e NIR
sum1_i = d17[[2]] + d17[[4]] # somma tra GREEN e NIR
ndwi1_i = dif1_i / sum1_i

# 2018
dif2_e = l18[[2]] - l18[[4]] # differenza tra GREEN e NIR
sum2_e = l18[[2]] + l18[[4]] # somma tra GREEN e NIR
ndwi2_e = dif2_e / sum2_e

dif2_i = d18[[2]] - d18[[4]] # differenza tra GREEN e NIR
sum2_i = d18[[2]] + d18[[4]] # somma tra GREEN e NIR
ndwi2_i = dif2_i / sum2_i

# 2019
dif3_e = l19[[2]] - l19[[4]] # differenza tra GREEN e NIR
sum3_e = l19[[2]] + l19[[4]] # somma tra GREEN e NIR
ndwi3_e = dif3_e / sum3_e

dif3_i = d19[[2]] - d19[[4]] # differenza tra GREEN e NIR
sum3_i = d19[[2]] + d19[[4]] # somma tra GREEN e NIR
ndwi3_i = dif3_i / sum3_i

# 2020
dif4_e = l20[[2]] - l20[[4]] # differenza tra GREEN e NIR
sum4_e = l20[[2]] + l20[[4]] # somma tra GREEN e NIR
ndwi4_e = dif4_e / sum4_e

dif4_i = d20[[2]] - d20[[4]] # differenza tra GREEN e NIR
sum4_i = d20[[2]] + d20[[4]] # somma tra GREEN e NIR
ndwi4_i = dif4_i / sum4_i



# visualizzazione degli indici NDWI per ogni stagione e anno
par(mfrow=c(4,2))
plot(ndwi1_e, col=magma (100))
plot(ndwi1_i, col=magma (100))
plot(ndwi2_e, col=magma (100))
plot(ndwi2_i, col=magma (100))
plot(ndwi3_e, col=magma (100))
plot(ndwi3_i, col=magma (100))
plot(ndwi4_e, col=magma (100))
plot(ndwi4_i, col=magma (100))



# classificazione
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

#DEVO FARE ASSEGNAZIONE PERCENTUALI PER OGNI CLASSIFICAZIONE


# creo il dataframe
years <- c(2017, 2018, 2019, 2020, 2021)
water <- c(2.60, 3.90, 2.98, 2.25, 3.59)
soil <- c(13.81, 13.41, 24.94, 11.52, 10.55)
veg <- c(84.23, 82.70, 73.08, 86.23, 85.87)

tab <- data.frame(years, water, soil, veg)
tab


# per comporre il dataframe sono state compresse le classi comprendenti veg1, veg2, grassland in Veget.
#class <- c("Water", "Soil", "Veget.")
#p1 <- c(2.60, 13.18, 84.23)
#p2 <- c(3.9, 13.41, 82.7)
#p3 <- c(2.98, 24.94, 73.08)
#p4 <- c(2.25, 11.52, 86.23)
#p5 <- c(3.59, 10.55, 85.87)


 # imposto il grafico per mostrare i risultati
pw1 <- ggplot(tab, aes(x=class, y=p1, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
pw2 <- ggplot(tab, aes(x=class, y=p2, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
pw3 <- ggplot(tab, aes(x=class, y=p3, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
pw4 <- ggplot(tab, aes(x=class, y=p4, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
pw5 <- ggplot(tab, aes(x=class, y=p5, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
