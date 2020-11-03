#GEOG250 HW4 Key

rm(list=ls())

#------------- Q1 -------------#
#read our file as a dataframe
datW <- read.csv("data/2011124.csv", stringsAsFactors = T)

#specify a column with a proper date format
#note the format here dataframe$column
datW$dateF <- as.Date(datW$DATE, "%Y-%m-%d")

#create year, month, and day columns by reformatting the date to only include years
#and indicating that it should be treated as numeric data
datW$year <- as.numeric(format(datW$dateF,"%Y"))
datW$month <- as.numeric(format(datW$dateF,"%m"))
datW$day <- as.factor(format(datW$dateF,"%a"))

# create subsets for two sites
datM <- datW[datW$NAME == "MORRISVILLE 6 SW, NY US",]
datZ <- datW[datW$NAME == "MORMON FLAT, AZ US",]

# perform analysis of variance
aM <- aov(PRCP~day,
          data = datM)

aZ <- aov(PRCP~day,
          data = datZ)

#------------- Q2 -------------#
# look at differences between individual days using a Tukey test
TukeyHSD(aM)
TukeyHSD(aZ)

#------------- Q3 -------------#
# calculate mean monthly precip
precipMonth <- aggregate(datW$PRCP, by=	list(datW$year, datW$month, datW$NAME), FUN="sum",na.rm=TRUE)	
colnames(precipMonth) <- c("year","month","site","MMP")

pJul <- precipMonth[precipMonth$month==7,]	

shapiro.test(pJul$MMP[pJul$site == "ABERDEEN, WA US" ])
hist(pJul$MMP[pJul$site == "ABERDEEN, WA US" ])

t3 <- aov(MMP~as.factor(siteN), precipYear)
summary(t3)

TukeyHSD(t3)

t2 <- kruskal.test(MMP~as.factor(siteN), precipYear)
TukeyHSD(t2)
