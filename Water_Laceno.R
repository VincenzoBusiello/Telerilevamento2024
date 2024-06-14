library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)
library(viridis)


setwd("C:/TelExam")


                                  # lago in luglio 2017
l17_1 <- rast("l17_1.tiff")
l17_2 <- rast("l17_2.tiff")
l17_3 <- rast("l17_3.tiff")
l17_4 <- rast("l17_4.tiff")
l17 <- c(l17_1, l17_2, l17_3, l17_4)

im.plotRGB(l17, 4,3,2)

l17c <- im.classify(l17, num_clusters=5)
# class1: grassland    52.53%
# class2: soil         13.18%
# class3: veg1         14.52%
# class4: veg2         17.18%
# class5: water         2.60%




                                  # lago in luglio 2018
l18_1 <- rast("l18_1.tiff")
l18_2 <- rast("l18_2.tiff")
l18_3 <- rast("l18_3.tiff")
l18_4 <- rast("l18_4.tiff")
l18 <- c(l18_1, l18_2, l18_3, l18_4)
im.plotRGB(l18, 4,3,2)

l18c <- im.classify(l18, num_clusters=5)
# class1: grassland      27.19%
# class2: water            3.9%
# class3: veg2           26.19%
# class4: soil           13.41%
# class5: veg1           29.32%




                                  # lago in luglio 2019
l19_1 <- rast("l19_1.tiff")
l19_2 <- rast("l19_2.tiff")
l19_3 <- rast("l19_3.tiff")
l19_4 <- rast("l19_4.tiff")
l19 <- c(l19_1, l19_2, l19_3, l19_4)
im.plotRGB(l19, 4,3,2)

l19c <- im.classify(l19, num_clusters=5)
# class1: grassland      39.94%
# class2: water           2.98%
# class3: veg2           17.62%
# class4: veg1           15.52%
# class5: soil           24.94%




                                  # lago in luglio 2020
l20_1 <- rast("l20_1.tiff")
l20_2 <- rast("l20_2.tiff")
l20_3 <- rast("l20_3.tiff")
l20_4 <- rast("l20_4.tiff")
l20 <- c(l20_1, l20_2, l20_3, l20_4)
im.plotRGB(l20, 4,3,2)

l20c <- im.classify(l20, num_clusters=5)
# class1: veg2           28.61%
# class2: water           2.25%
# class3: soil           11.52%
# class4: veg1           30.61%
# class5: grassland      27.01%




                                  # lago in luglio 2021
l21_1 <- rast("l21_1.tiff")
l21_2 <- rast("l21_2.tiff")
l21_3 <- rast("l21_3.tiff")
l21_4 <- rast("l21_4.tiff")
l21 <- c(l21_1, l21_2, l21_3, l21_4)
im.plotRGB(l20, 4,3,2)

l21c <- im.classify(l21, num_clusters=5)
# class1: soil          10.55%
# class2: water         3.59%
# class3: grassland     33.38%
# class4: veg2          24.81%
# class5: veg1          27.68%


# calcolo le percentuali di copertura per ogni classe per il 2017
tot1 <- ncell(l17c)
f1 <- freq(l17c)
prop1 = f1 / tot1
perc1 = prop1 * 100
perc1

# calcolo le percentuali di copertura per ogni classe per il 2018
tot2 <- ncell(l18c)
f2 <- freq(l18c)
prop2 = f2 / tot2
perc2 = prop2 * 100
perc2

# calcolo le percentuali di copertura per ogni classe per il 2019
tot3 <- ncell(l19c)
f3 <- freq(l19c)
prop3 = f3 / tot3
perc3 = prop3 * 100
perc3

# calcolo le percentuali di copertura per ogni classe per il 2020
tot4 <- ncell(l20c)
f4 <- freq(l20c)
prop4 = f4 / tot4
perc4 = prop4 * 100
perc4

# calcolo le percentuali di copertura per ogni classe per il 2021
tot5 <- ncell(l21c)
f5 <- freq(l21c)
prop5 = f5 / tot5
perc5 = prop5 * 100
perc5

# class1: veg2           28.61%
# class2: water           2.25%
# class3: soil           11.52%
# class4: veg1           30.61%
# class5: grassland      27.01%

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
