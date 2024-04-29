# misura della variabilità: prendendo una immagine si possono misurare i valori di riflettanza per ogni pixel. 
# Vedendo come riflette ogni pixel per le bande si forma una grafico. Più sono simili i punti, più sarà compatta la nuvola di punti. 
# Maggiore è la variabilità in termini spettrali maggiore sarà la variabilità a livello ambientale e quindi saranno presenti più nicchie ecologiche e più specie
# Si può applicare la stessa variabilità per la geomorfologia. Ciò si può fare con la deviazione standard: presa una curva normale, la ds sarà il 68% dei dati. 
# Maggiore è la deviazione standard, maggiore sarà la variabilità ecosistemica/geomorfologica. Si possono creare delle mappe di variabilità con delle moving window
# Avendo una immagine satellitare la si sottopone ad una finestra di 3 pixel di lato, si calcola la deviazione standard di ogni pixel e la si riporta sul pixel centrale
#così facendo si ottiene una mappa completa con tutte le deviazioni standard degli intervalli dati dalla grandezza della moving window. 



library(terra) 

