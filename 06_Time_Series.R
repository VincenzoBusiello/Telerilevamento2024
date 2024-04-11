# Serie Temporali: si prendono immagini in diversi periodi per poter vedere il cambiamento


library(terra)
library(imageRy)


im.list()


EN01 <- im.import("EN_01.png")
EN13 <- im.import("EN_13.png")

par(mfrow=c(2,1))
# im.plotRGB.auto() visualizza le immagini utilizzando le bande 1,2,3
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

# facendo la differenza tra due bande si riesce a quantificiare la magnitudo del cambiamento tra la prima banda e la seconda
difEN = EN01[[1]] - EN13[[1]]
cl <- colorRampPalette(c("blue","white","red")) (100)
plot(difEN, col=cl)
