#Importing the Dataset
song_data <- read.csv("q1.csv")

#a) correlation coefficient calculation
cor_coeff<- cor(song_data$Months, song_data$'X.Songs')
cor_coeff
print(cor_coeff)

# Scatterplot
plot(song_data$Months, song_data$X.Songs, main = "Scatter Plot",
     xlab = "Months", ylab = "#Songs")

# Add the fitted line to the plot
abline(a = 12.9, b = 21.1,lwd = 4, col = "red", label = equation) 