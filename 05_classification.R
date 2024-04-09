# i modi per quantificare quanta vegetazione è stata persa durante gli anni sono due: 
# proporzione di due classi e differenza tra gli indici calcolati
# per creare una classe: selezione casuale di pixel; controllo il loro comportamento nello spazio spettrale (grafico con le bande sulle ascisse e ordinate); si creano così dei cluster; i pixel incogniti vengono classificati in base alle distanze (k) tra le medie dei cluster creati (training sights).
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

