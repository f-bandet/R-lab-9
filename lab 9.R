# Name: Faye Bandet
# Date: 10/24/19
# ISTA 116 Section B || Section Leader : Jacob Heller
# Lab Assignment 9
# Collaborator(s): Nick Ackerman

download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData")
load("ames.RData")

#1
mean(ames$Gr.Liv.Area)
# The mean for the above ground living area is 1499.69 feet squared.

#2
ames.gr.liv.area.sample <- mean(sample(ames$Gr.Liv.Area, 50, replace = FALSE))
ames.gr.liv.area.sample
# This sample had a mean of 1513.66 from 50 values. It changes for each sample when it is run. It is different because it is only 50 of 2930 values factored into the mean.

#3
par(mfrow = c(2, 1))
area.xlim <- range(ames$Gr.Liv.Area)
# Create plotting space.

#4
hist(ames$Gr.Liv.Area, xlim = c(area.xlim))
abline(v=mean(ames$Gr.Liv.Area), col = "red", lwd = 2)
# Plots a histogram, then a vertical red line at the mean of the data.

#5
sampl = sample(ames$Gr.Liv.Area, 50, replace = FALSE)
hist(sampl,, xlim = c(area.xlim))
abline(v = ames.gr.liv.area.sample, col = "red", lwd = 2)
# There is a significant difference in the histograms. It is rational because the second histogram only uses a sample of 50 out of the total data points, without replacement. Both histograms have th emean in a similar location. both plots have a right skew, but the sample plots are heavier skewed than the actual plot.The second plot has most values distributed between 500 and 2500. 

#6
area.means.10 <- replicate(5000, {mean(sample(ames$Gr.Liv.Area, 10, replace = FALSE))})
hist(area.means.10)
# This histgram appears to have a normal distribution. The mean is around 1500. This looks like the actual mean from problem #1. The sample was run 5000 times so it makes sense to find a similar mean.

#7
area.means.50 <- replicate(5000, {mean(sample(ames$Gr.Liv.Area, 50, replace = FALSE))})
area.means.100 <- replicate(5000, {mean(sample(ames$Gr.Liv.Area, 100, replace = FALSE))})
# Used replicate function with two larger sample data sets.

#8
par(mfrow = c(3, 1))
area.means.10.xlim <- range((area.means.10))
# Set up plotting space. Created vatiable for the range of area.means.10.

#9
hist(area.means.10, breaks = 20, xlim = c(area.means.10.xlim))
hist(area.means.50, breaks = 20, xlim = c(area.means.10.xlim))
hist(area.means.100, breaks = 20, xlim = c(area.means.10.xlim))
# All the histograms apprar to have good normal distributions. This is because the samples were replicated many times. The most accurate plot would be the area.mean.100 plot so I would choose that one. The wider range of values used will find a mean closest to 1500.

#10
mean(sample(ames$Gr.Liv.Area, 1, replace = FALSE))
mean(sample(ames$Gr.Liv.Area, 2930, replace = FALSE))
# Sample 2930 returns 1499.69, whereas sample 1 returns 1708. This is because a sample with size 1 only uses one value and is not a good representation for the mean of a whole data set. A larger sample size, such as 2930, will return an accurate mean for the whole data set.
