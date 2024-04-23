# Importing data frome external sources.

library(terra)
library(imageRy)

# impostazione della cartella di lavoro. Utilizzando Windows bisogna cambiare i backslash (\)
# del percorso con gli slash (/)
setwd("C:/Telerilevamento2024")
# importazione dell'immagine con la funzione rast. Questa crea degli oggetti come raster spaziali. Fa parte del pacchetto terra.
eclissi <- rast("eclissi.png")
# il warning message è riferito alla estensione spaziale dell'immagine, la quale in questo caso è sconosciuta
im.plotRGB(eclissi, r=1, g=2, b=3)

#difference between bar
dif = eclissi[[1]] - eclissi[[2]]
plot(dif)

# importing data from Copernicus

soil <- rast("c_gls_SSM1km_202404210000_CEURO_S1CSAR_V1.2.1.nc")
plot(soil)
plot(soil[[1]])

# come ritagliare l'immagine della porzione che può interessare definendo la x minima e x massima e y minima e y massima inserendole in un array
ext <- c(25, 30, 55, 88)
soilcrop <- crop(soil, ext)
plot(soilcrop)
