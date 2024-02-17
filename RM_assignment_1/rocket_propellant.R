data <-  read.csv("The Rocket propellant Data.csv")
data

# install.packages(("caTools"))
# install.packages("ggplot2")
library(ggplot2)
library(caTools)
set.seed(123)

# setting the split ratio to 80% of the data and the target variable "Age of Propellant"
split = sample.split(data$Shear.strength, SplitRatio = 0.8)
print(split)

# splitting of data to train, test datasets
training_dataset = subset(data, split== TRUE)
test_dataset = subset(data, split == FALSE)
print(training_dataset)
print(test_dataset)

# training the model using multiple linear regresser model using the training_dataset
mlr_model = lm(formula =  Shear.strength ~ Age.of.propellant, data = training_dataset)
print(mlr_model)

# Predicting the test_dataset Results with our multiple linear regression model
y_pred = predict(mlr_model, newdata = test_dataset)
print(y_pred)

y_actual = test_dataset$Shear.strength
print(y_actual)

ggplot() + 
  geom_point(aes(x= training_dataset$Age.of.propellant, 
                 y = training_dataset$Shear.strength),
             colour = "red") +
  geom_line(aes(x= training_dataset$Age.of.propellant, 
                y = predict(mlr_model, newdata = training_dataset)),
            colour = "blue") +
  ggtitle("Age of Propellant Vs Shear Strength (Training Set Results)") +
  xlab("Age of Propellant") +
  ylab("Shear Strength")

### Visualizing the Testing Set Results
ggplot() + 
  geom_point(aes(x= test_dataset$Age.of.propellant, 
                 y = test_dataset$Shear.strength),
             colour = "red") +
  geom_line(aes(x= test_dataset$Age.of.propellant, 
                y = y_pred),
            colour = "blue") +
  ggtitle("Age of Propellant Vs Shear Strength (Testing Set Results)") +
  xlab("Age of Propellant") +
  ylab("Shear Strength")

