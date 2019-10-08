##############################################################
################## This script provides examples for   #######
################## an introduction to R basic concepts #######
##############################################################

# anything after the '#' is a comment
# the program ignores comments, but they are essential for documentation

# R is just a sophisticated calculator
1+10


# we can easily create a sequence from 100 to 130
100:130

# if you enter an imcomplete command R will show '+' until you finish it
5-
  
# R will give you an error message if it doesn't understand the command you've entered
3 % 5 

# we can create a vector, or one dimensional set of numbers
1:6

# using the assignment symbol '<-' we can create an object the computer will store in memory
die <- 1:6

# we can do all kinds of math on objects
die - 1

die/2

die*die

#R includes a wide variety of functions that you can use to perform sophistacated tasks
# you type arguments inside the parentheses after a function
# for example, let's calculate the mean of a vector from 1 to 6
mean(1:6)

mean(die)

# you can even nest functions
round(mean(die))

#some functions have more than one argument
sample(x = die, size = 1)

##############################################################
# now let's have a look at some of our data
##############################################################

# first we need to specify our working directory
# this is where R will autmatically look for files, unless we specify otherwise
# the 'getwd' function will tell us where we are
getwd()

# before going further, make your own folder on the server and copy out data into it

# now we can use 'setwd' to set the directory to our working folder
setwd("Z:/Geog250_F19/loranty/")
setwd("/Volumes/class/Geog250_F19/loranty/")
# we can use the 'read.csv' command to read in our thaw depth data
read.csv("data/thaw_depth.csv")

# what happened? we need to create an object, so that we can manipulate the data
td <- read.csv("data/thaw_depth.csv")

# We can use brackets to look at rows and columns in a two-dimensional matrix or data frame. 
td[1,1]

# Let's try the 36th row in the 5th column
td[36,5]

# we can use the 'head' command to look at the first few rows of our data frame
head(td)

# and 'tail' to look at the end
tail(td)

# We can subset using matrix notation and logical statements
# For example, what if we want only data from the site called labeled bfg
# note here the double equals sign denotes equivalence
td.bfg <- td[td$site=="bfg",]


# we can make a histogram
hist(td$td,freq=F,
     xlab = "Thaw Depth (cm)",
     main = "")

# we can also make a boxplot
boxplot(td$td~td$site)


median(td.bfg$td)
mean(td.bfg$td)
sd(td.bfg$td)
var(td.bfg$td)


############################################
# Home Work 1
############################################
sa <- read.csv("data/shrub_allometry.csv")

aln <- sa[sa$species=="aln",]
bet <- sa[sa$species=='bet',]
sal <- sa[sa$species=='sal',]
