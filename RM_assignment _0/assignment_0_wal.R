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
slr_model = lm(formula = Weekly_Sales ~ ., data = training_dataset)
# print(mlr_model)

# Predicting the test_dataset Results with our multiple linear regression model
y_pred = predict(slr_model, newdata = test_dataset)
print(y_pred)

y_actual = test_dataset$Weekly_Sales
print(y_actual)

# Visualizing the Training Set Results
library(ggplot2) # loading ggplot2
ggplot() + 
  geom_point(aes(x= training_dataset$CPI, 
                 y = training_dataset$Weekly_Sales),
             colour = "red") +  # scatter plot of training set data
  geom_line(aes(x= training_dataset$CPI, 
                y = predict(slr_model, newdata = training_dataset)),
            colour = "blue") +  # regression line
  ggtitle("Weekly Sales Vs CPI (Training Set Results)") + # setting title
  xlab("CPI") + # setting x label
  ylab("Weekly sales") # setting y label

### Visualizing the Testing Set Results
ggplot() + 
  geom_point(aes(x= test_dataset$CPI, 
                 y = test_dataset$Weekly_Sales),
             colour = "red") + # scatter plot of test set data
  geom_line(aes(x= test_dataset$CPI, 
                y = y_pred),
            colour = "blue") + # regression line
  ggtitle("Weekly Sales Vs CPI (Test Set Results)") + # setting title
  xlab("CPI") + # setting x label
  ylab("Weekly sales") # setting y label
