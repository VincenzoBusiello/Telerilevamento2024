library(terra)
library(viridis)

setwd("C:/Telerilevamento2024/Lac17-24") # imposto la cartella di lavoro 
lac1 <- rast("lac1.jpg") # importo l'immagine attraverso la funzione rast()
nir1 <- rast("nir1.jpg") # importo l'immagine infrarosso

# utilizzo le bande del vicino infrarosso e del verde per poter mettere in evidenza il corpo idrico. 

dif = lac1[[1]] - nir1
sum = lac1[[1]] + nir1
wat1 = dif/sum

plot(wat1, col=viridis (1000))

lac2 <- rast("lac2.jpg")
nir2 <- rast("nir2.jpg")

dif2 = lac2[[1]] - nir2
sum2 = lac2[[1]] + nir2
wat2 = dif2/sum2

plot(wat2, col=viridis (1000))

par(mfrow=c(1,2))
plot(wat1, col=viridis (1000))
plot(wat2, col=viridis (1000))
