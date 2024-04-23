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

