#GEOG250 HW3 Key


#read our file as a dataframe
datW <- read.csv("data/2011124.csv", stringsAsFactors = T)

#specify a column with a proper date format
#note the format here dataframe$column
datW$dateF <- as.Date(datW$DATE, "%Y-%m-%d")

#create a date column by reformatting the date to only include years
#and indicating that it should be treated as numeric data
datW$year <- as.numeric(format(datW$dateF,"%Y"))

#calculate the average daily temperature
#This temperature will be halfway between the minimum and maximum temperature
datW$TAVE <- datW$TMIN + ((datW$TMAX-datW$TMIN)/2)

# create data frames for Livermore and Morrisville

#----------------------- Q1 -----------------------#
datL <- datW[datW$NAME=="LIVERMORE, CA US",]
datM <- datW[datW$NAME=="MORRISVILLE 6 SW, NY US",]


#note I've named the histogram so I can reference it later

#---------------- Livermore ---------------#
h1 <- hist(datL$TAVE,
           freq=FALSE, 
           main = paste(levels(datM$NAME)[2]),
           xlim = c(-10,40),
           xlab = "Average daily temperature (degrees C)", 
           ylab="Relative frequency",
           col="grey50",
           border="white")
#the seq function generates a sequence of numbers that we can use to plot the normal across the range of temperature values
x.plot <- seq(-10,40, length.out = 100)

#the dnorm function will produce the probability density based on a mean and standard deviation.
y.plot <-  dnorm(seq(-10,40, length.out = 100),
                 mean(datL$TAVE,na.rm=TRUE),
                 sd(datL$TAVE,na.rm=TRUE))

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

#---------------- Morrisville ---------------#
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

#----------------------- Q2 -----------------------#

qnorm(0.95,
      mean(datL$TAVE, na.rm = T),
      sd(datL$TAVE, na.rm = T))
      
qnorm(0.05,
      mean(datL$TAVE, na.rm = T),
      sd(datL$TAVE, na.rm = T))

qnorm(0.95,
      mean(datM$TAVE, na.rm = T),
      sd(datM$TAVE, na.rm = T))

qnorm(0.05,
      mean(datM$TAVE, na.rm = T),
      sd(datM$TAVE, na.rm = T))

#----------------------- Q3 -----------------------#

1 - pnorm(qnorm(0.95,
                mean(datW$TAVE[datW$NAME=="ABERDEEN, WA US"],na.rm=TRUE),
                sd(datW$TAVE[datW$NAME=="ABERDEEN, WA US"],na.rm=TRUE)),
          mean(datW$TAVE[datW$NAME=="ABERDEEN, WA US"],na.rm=TRUE)+4,
          sd(datW$TAVE[datW$NAME=="ABERDEEN, WA US"],na.rm=TRUE))	

#----------------------- Q4 -----------------------#
hist(datW$PRCP[datW$NAME=="ABERDEEN, WA US"],
     freq=FALSE, 
     xlim = c(0,100),
     main = paste(levels(datW$NAME)[1]),
     xlab = "Daily precipitation", 
     ylab="Relative frequency",
     col="grey50",
     border="white")	