# i modi per quantificare quanta vegetazione è stata persa durante gli anni sono due: 
# proporzione di due classi e differenza tra gli indici calcolati
# per creare una classe: selezione casuale di pixel; controllo il loro comportamento nello spazio spettrale (grafico con le bande sulle ascisse e ordinate); 
# si creano così dei cluster; i pixel incogniti vengono classificati in base alle distanze (k) tra le medie dei cluster creati (training sights).
# una volta ottenuta la mappa classificata si possono quantificare i pixel che appartengono ad una o ad un'altra classe.

#installo il pacchetto "ggplot2"
install.packages("ggplot2")
# installo il pacchetto "patchwork"
install.packages("patchwork")

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

# recupero la lista di immagini disponibili su imageRy
im.list()

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# classificazione in tre clusters dell'immagine sun
sunc <- im.classify(sun, num_clusters=3)


# immagini del Mato Grosso
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
# classificazione delle immagini
m1992c <- im.classify(m1992, num_clusters=2)
# classe 1 = foresta
# classe 2 = antropizzazione

m2006c <- im.classify(m2006, num_clusters=2)
# classe 1 = antropizzazione
# classe 2 = foresta

# calcolo le frequenze
f1992 <- freq(m1992c)
f1992 # dona come risultato la frequenza di pixel per i pixel classificati come foresta e come antropizzazione

# calcola il totale dei pixel di un oggetto
tot1992 <- ncell(m1992c)

prop1992 = f1992 / tot1992
perc1992 = prop1992 * 100
# perc. foreste = 83%; perc. antropizzazione = 17%;

f2006 <- freq(m2006c)
f2006
tot2006 <- ncell(m2006c)
prop2006 = f2006 / tot2006
prop2006
perc2006 = prop2006 * 100
perc2006
# perc. foreste = 45%; perc. antropizzazione= 55%


# costruisco il dataset e creo i grafici
class <- c("forest", "human")
y1992 <- c(83,17)
y2006 <- c(45,55)

tabout <- data.frame(class, y1992, y2006)
tabout
View(tabout) # serve per vedere tabout in formato tabellare. Attenzione! è case sensitive

#ggplot2 grafici
ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")
ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")

# grazie a patchwork possiamo mettere insieme più grafici tramite l'assegnazione di questi a degli oggetti e poi sommandoli

p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")
p1 + p2

# imposto gli assi con uguali grandezza
p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1 + p2
