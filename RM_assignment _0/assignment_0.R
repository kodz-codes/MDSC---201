wal_data <- read.csv("Walmart.csv")
wal_data

# Importing caTools library
library(caTools)

# Setting the seed value = 123( any number could be choosen) for randomness
set.seed(123)

# setting the split ratio to 80% of the data and the target variable "Weekly_Sales"
split = sample.split(wal_data$Weekly_Sales, SplitRatio = 0.8)
print(split)

# splitting of wal_data to train, test datasets
training_dataset = subset(wal_data, split== TRUE)
test_dataset = subset(wal_data, split == FALSE)
# print(training_dataset)
# print(test_dataset)

# training the model using multiple linear regresser model using the training_dataset
mlr_model = lm(formula = Weekly_Sales ~ ., data = training_dataset)
# print(mlr_model)

# Predicting the test_dataset Results with our multiple linear regression model
y_pred = predict(mlr_model, newdata = test_dataset)
print(y_pred)

y_actual = test_dataset$Weekly_Sales
print(y_actual)
