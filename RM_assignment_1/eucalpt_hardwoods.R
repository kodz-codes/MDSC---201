data <-  read.csv("eucalypt_hardwoods.csv")
data
# install.packages("caTools")
# install.packages("ggplot2")
library(ggplot2)
library(caTools)
set.seed(123)

# setting the split ratio to 80% of the data and the target variable "hardness"
split = sample.split(data$hardness, SplitRatio = 0.8)
print(split)

# splitting of data to train, test datasets
training_dataset = subset(data, split== TRUE)
test_dataset = subset(data, split == FALSE)
print(training_dataset)
print(test_dataset)

# training the model using multiple linear regresser model using the training_dataset
mlr_model = lm(formula = hardness ~ density, data = training_dataset)
print(mlr_model)

# Predicting the test_dataset Results with our multiple linear regression model
y_pred = predict(mlr_model, newdata = test_dataset)
print(y_pred)

y_actual = test_dataset$hardness
print(y_actual)

ggplot() + 
  geom_point(aes(x= training_dataset$density, 
                 y = training_dataset$hardness),
             colour = "red") +
  geom_line(aes(x= training_dataset$density, 
                y = predict(mlr_model, newdata = training_dataset)),
            colour = "blue") +
  ggtitle("Density Vs Hardness (Training Set Results)") +
  xlab("Density") +
  ylab("Hardness")

### Visualizing the Testing Set Results
ggplot() + 
  geom_point(aes(x= test_dataset$density, 
                 y = test_dataset$hardness),
             colour = "red") +
  geom_line(aes(x= test_dataset$density, 
                y = y_pred),
            colour = "blue") +
  ggtitle("Density Vs Hardness (Testing Set Results)") +
  xlab("Density") +
  ylab("Hardness")
