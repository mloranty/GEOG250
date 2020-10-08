

datM <- datW[datW$NAME=="LIVERMORE, CA US",]


#make a histogram for the first site in our levels
#main= is the title name argument.
#Here you want to paste the actual name of the factor not the numeric index
#since that will be more meaningful. 
#note I've named the histogram so I can reference it later
h1 <- hist(datM$TAVE,
           freq=FALSE, 
           main = paste(levels(datM$NAME)[5]),
           xlim = c(-30,40),
           xlab = "Average daily temperature (degrees C)", 
           ylab="Relative frequency",
           col="grey50",
           border="white")
#the seq function generates a sequence of numbers that we can use to plot the normal across the range of temperature values
x.plot <- seq(-30,40, length.out = 100)

#the dnorm function will produce the probability density based on a mean and standard deviation.
y.plot <-  dnorm(seq(-30,40, length.out = 100),
                 mean(datM$TAVE,na.rm=TRUE),
                 sd(datM$TAVE,na.rm=TRUE))

#create a density that is scaled to fit in the plot  since the density has a different range from the data density.
#!!! this is helpful for putting multiple things on the same plot
#!!! It might seem confusing at first. It means the maximum value of the plot is always the same between the two datasets on the plot. Here both plots share zero as a minimum.
y.scaled <- (max(h1$density)/max(y.plot)) * y.plot

#points function adds points or lines to a graph  
#the first two arguments are the x coordinates and the y coordinates.

points(x.plot,
       y.scaled, 
       type = "l", 
       col = "royalblue3",
       lwd = 4, 
       lty = 2)