# GEOG250 Regression Example in Lecture 
# using the Iris data set

rm(list=ls())

# create a subset for Iris virginica only
flower <- iris[iris$Species == "virginica",]

# make a plot of sepal lenght vs. petal length
plot(flower$Sepal.Length, flower$Petal.Length,
     xlab = "Sepal length (cm)",
     ylab = "Petal length (cm)",
     main = "Iris virginica", 
     pch = 16, col = "purple")

# perform a linear regression
# ordinary least squares regression
# lm(dependent variable ~ independent variable)
# lm(y~x)
fit <- lm(flower$Petal.Length~flower$Sepal.Length)

# use the summary function to view the results
summary(fit)

# the residuals are stored in the summary
# let's make a plot of the reisduals
plot(flower$Sepal.Length,summary(fit)$residuals,
     xlab = "Sepal Length (cm)",
     ylab = "Residual Petal Length (cm)",
     main = "Regression Residuals",
     pch = 19, col = "blue")

# add a horizontal line at zero for reference
abline(h=0)

# let's check the normality of residuals
# first look at a histogram
hist(summary(fit)$residuals,
     xlab = "Residual petal length (cm)",
     main = "Regression Residuals",
     col = "lavender")

# now let's use qqnorm
qqline(summary(fit)$residuals)

# finally we can use a shapiro test
shapiro.test(summary(fit)$residuals)

# assumptions are met, we can interpret the results
summary(fit)

# now let's add the regression line to our plot
plot(flower$Sepal.Length, flower$Petal.Length,
     xlab = "Sepal length (cm)",
     ylab = "Petal length (cm)",
     main = "Iris virginica", 
     pch = 16, col = "purple")

# add the line using regression coefficients from the model summary
abline(summary(fit)$coefficients[,1],
       lty = "dashed",lwd = 2)

