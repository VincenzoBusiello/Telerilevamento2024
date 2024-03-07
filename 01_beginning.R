# First R script

# R as calculator
a <- 6 * 7
b <- 5 * 8
a + b 

# Arrays

flowers <- c(3, 6, 8, 10, 15, 18)
flowers 

insects <- c(10, 16, 25, 42, 61, 73)
insects

# Simple plot
plot(flowers, insects)

# Changing plot parameters

# Symols
plot(flowers, insects, pch=19)

# Symbol dimensions
plot(flowers, insects, pch=19, cex=2)

plot(flowers, insects, pch=19, cex=0.5)

# Color
plot(flowers, insects, pch=19, cex=.5, col="chocolate1")
