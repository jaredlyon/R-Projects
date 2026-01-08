## Code for lab 1: more sophisticated plotting and data manipualtion

# Read in data 
d1=read.csv("http://faraway.neu.edu/biostats/lab1_dataset1.csv")

# Look at some of the data to know what you're dealing with
head(d1, n = 10)

# Count how many patients there are, how many patients are sick, and how many of those are women
dim(d1)
sum(d1$outcome == "sick")
sum(d1$sex == "female" & d1$outcome == "sick")

# Look at the first observation
d1[1, ]
# Look at the column called "sex"
head(d1$sex, n = 10)
# Look at the 5th entry of the column called "sex"
d1$sex[5]

# Were men and women assigned to groups evenly? 
# Calculate the number of men and women assigned to the placebo group
table(subset(d1, select = c("sex","treatment")))

# You could do something similar with aggregate, where you calculate the proportion of females of the sick patients
# First you need a function to calculate the fraction of females in a vector
prop.female <- function(vec){
  sum(vec == "female") / length(vec)
}

aggregate(sex ~ outcome, data = d1, FUN = prop.female)

## Make more sophisticated plots 
# Create some vectors to use for plotting
y.vec <- c(2, 4, 1, 8, 5, 11, 15, 9, 16)
x.vec <- seq(1, length(y.vec), 1)

#Make the simplest plot by only feeding the two required arguments
plot(x.vec, y.vec)

#Make the same plot, but change the axis labels and make it a line plot
plot(x.vec, y.vec, xlab = "X variable", ylab = "Y variable", type = "l")

#You can also do this via a data frame!
#First, make the data frame with the two columns. Then plot
xy.data <- data.frame(x.vec, y.vec)
plot(xy.data$x.vec, xy.data$y.vec)

#Make the same plot, but make the line thicker and add a legend
plot(x.vec, y.vec, xlab = "X variable", ylab = "Y variable", type = "l", lwd = 3)
legend("topleft", legend = "My Data", lwd = 3, col = "black")

#Make the same plot, but add another set of points and add them to the legend
plot(x.vec, y.vec, xlab = "X variable", ylab = "Y variable", type = "l", lwd = 3)
points(y.vec + 2 ~ x.vec, col = "red", type = "l",  lwd = 3)

legend("topleft", legend = c("My Data", "My New Data"), lwd = 3, col = c("black", "red"))

# What do you have to change in this last plot? Think about how you could specify beforehand the correct limits

#Make the same plot, but make axes larger and change y limits
plot(x.vec, y.vec, xlab = "X variable", ylab = "Y variable", type = "l", lwd = 3, 
     ylim = range(c(y.vec, y.vec + 2)), cex.axis = 2)
points(y.vec + 2 ~ x.vec, col = "red", type = "l",  lwd = 3)

legend("topleft", legend = c("My Data", "My New Data"), lwd = 3, col = c("black", "red"))

 
