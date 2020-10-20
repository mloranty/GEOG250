#GEOG250 HW4 Key


#read our file as a dataframe
datW <- read.csv("data/2011124.csv", stringsAsFactors = T)

#specify a column with a proper date format
#note the format here dataframe$column
datW$dateF <- as.Date(datW$DATE, "%Y-%m-%d")

#create year and month columns by reformatting the date to only include years
#and indicating that it should be treated as numeric data
datW$year <- as.numeric(format(datW$dateF,"%Y"))
datW$month <- as.numeric(format(datW$dateF,"%m"))
datW$day <- as.factor(format(datW$dateF,"%a"))
#convert level to number for factor data type
#you will have to reference the level output or look at the row of data to see the character designation.
datW$siteN <- as.numeric(datW$NAME)

#calculate the average daily temperature
#This temperature will be halfway between the minimum and maximum temperature
datW$TAVE <- datW$TMIN + ((datW$TMAX-datW$TMIN)/2)

head(datW)

# calculate mean monthly precip
precipMonth <- aggregate(datW$PRCP, by=	list(datW$year, datW$month, datW$siteN), FUN="sum",na.rm=TRUE)	
colnames(precipMonth) <- c("year","month","siteN","MMP")

hist(precipMonth$MMP[precipMonth$siteN == 1 & precipMonth$month == 10 ],
     freq=FALSE, 
     main = paste(levels(datW$NAME)[1]),
     xlab = "MAAP", 
     ylab="Relative frequency",
     col="grey50",
     border="white")	

shapiro.test(precipMonth$MMP[precipMonth$siteN == 1 & precipMonth$month == 10 ])

# calculate mean yearly precip
precipYear <- aggregate(datW$PRCP, by=	list(datW$year, datW$siteN), FUN="sum",na.rm=TRUE)	
colnames(precipYear) <- c("year","siteN","MMP")

t3 <- aov(MMP~as.factor(siteN), precipYear)
summary(t3)

TukeyHSD(t3)

t2 <- kruskal.test(MMP~as.factor(siteN), precipYear)
TukeyHSD(t2)
