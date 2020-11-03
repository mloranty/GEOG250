# inference code challenge script

# read in the thaw depth data
thaw <- read.csv("data/thaw_depth.csv", stringsAsFactors = T)

# calculate the mean, sd, and sample size
x <- mean(thaw$td[thaw$site=="wws"])
s <- sd(thaw$td[thaw$site=="wws"])
n <- length(thaw$td[thaw$site=="wws"])

# determine the maximum value from the wws site
m <- max(thaw$td[thaw$site=="wws"])

# now calculate the z-score
z <- (m-x)/s

# use the round function to round the z-score to the nearest hundredth for use in Table A2
z <- round(z,digits=2)

# create the histogram from the activity
hist(thaw$td,probability = T,
     xlim = c(0,100),main="",
     xlab = "Thaw Depth (cm)",
     ylab = "Probability")

lines(1:100,dnorm(1:100,mean(thaw$td),sd(thaw$td)),
      lwd=2)

polygon(c(m:100,100:m),
        c(dnorm(m:100,mean(thaw$td),sd(thaw$td)),rep(0,length(m:100))),
        col = "blue")