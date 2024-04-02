#Importing the Dataset
mlr_data <- read.csv("q2.csv")

#Multiple linear regression model
mlr_model <- lm(GRE_Total ~ UGPA + GCPA, data = mlr_data)

summary(mlr_model)

#Extracting p-values of the independent variables
p_values <- summary(mlr_model)$coefficients[,4]
print(p_values)