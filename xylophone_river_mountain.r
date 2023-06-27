#Project Home
#Loading Libraries 
library(dplyr)
library(ggplot2)
library(caret)
library(readxl)

#1 
mydata <- read_excel("myData.xlsx")

#2
#Explore the data
str(mydata)
head(mydata)

#3
#Check for missing values
sum(is.na(mydata))

#4
# Impute missing values
imputed_data <- mydata %>% 
  group_by(variable) %>% 
  mutate(imputed_value = replace(value, is.na(value), mean(value, na.rm = TRUE)))

#5
#Split the data into train and test
set.seed(123)
splitIndex <- createDataPartition(imputed_data$target, p = .70, list = F)
train <- imputed_data[splitIndex,]
test <- imputed_data[-splitIndex,]

#6
#Create a modelspec and fit the model
#Logistic Regression
model_spec <- train %>%
  select(-target) %>%
  modelSpec(
    class = "factor",
    formula = target ~ .
  )

model_fit <- train %>%
  fitSpec(
    model_spec
  )

#7
#Check the model performance
train_pred <- predict(model_fit, train)
confusionMatrix(train_pred, train$target)

#8
#Predict on Test data
test_pred <- predict(model_fit, test)

#9
#Check the accuracy on test Data
confusionMatrix(test_pred, test$target)

#10
#Plot the ROC curve
plotROC(test_pred, test$target)

#11
#Create a Decision Tree
library(rpart)
tree_fit <- rpart(
  formula = target ~ .,
  data = train
)

#12
#Predicting on Test Data
tree_pred <- predict(tree_fit, test, type = "class")

#13
#Check the accuracy on test Data
confusionMatrix(tree_pred, test$target)

#14
#Plot the ROC curve
plotROC(tree_pred, test$target)

#15
#Create a K Nearest Neighbor model
knn_model <- train %>%
  select(-target) %>%
  knn(train$target, k = 5)

#16
#Predict on Test Data
knn_pred <- predict(knn_model, test)

#17
#Check the accuracy on Test Data
confusionMatrix(knn_pred, test$target)

#18
#Plot the ROC curve
plotROC(knn_pred, test$target)

#19
#Create a Random Forest model
library(randomForest)
rf_model <- randomForest(
  formula = target ~ .,
  data = train
)

#20
#Predict on Test Data
rf_pred <- predict(rf_model, test)

#21
#Check the accuracy on Test Data
confusionMatrix(rf_pred, test$target)

#22
#Plot the ROC curve
plotROC(rf_pred, test$target)

#23
#Perform feature selection 
library(rfe)
ctrl <- rfeControl(
  functions = rfFuncs,
  method = "repeatedcv",
  repeats = 5,
  verbose = FALSE
)

#24
#Perform recursive feature elimination
feat_selection <- rfe(
  x = train %>% select(-target),
  y = train$target,
  sizes = c(1:ncol(train)),
  rfeControl = ctrl
)

#25
#Create a new model with selected features
selected_features <- train %>%
  select(feat_selection$selectedFeatures) %>%
  select(-target)

#26
#Create a new model with selected features
model_spec2 <- train %>%
  select(-target) %>%
  select(feat_selection$selectedFeatures) %>%
  modelSpec(
    class = "factor",
    formula = target ~ .
  )

#27
#Fit the model to training data
model_fit2 <- train %>%
  fitSpec(
    model_spec2
  )

#28
#Check the new model performance
train_pred2 <- predict(model_fit2, train)
confusionMatrix(train_pred2, train$target)

#29
#Predict on Test data with new model
test_pred2 <- predict(model_fit2, test)

#30
#Check the accuracy on test Data
confusionMatrix(test_pred2, test$target)

#31
#Plot the ROC curve
plotROC(test_pred2, test$target)

#32
#Create a Support Vector Machine model
library(kernlab)
svm_model <- ksvm(
  formula = target ~ .,
  data = train,
  type = "C-svc",
  kernel = "rbfdot"
)

#33
#Predict on Test Data
svm_pred <- predict(svm_model, test)

#34
#Check the accuracy on Test Data
confusionMatrix(svm_pred, test$target)

#35
#Plot the ROC curve
plotROC(svm_pred, test$target)

#36
#Create a Naive Bayes model
library(naivebayes)
nb_model <- naive_bayes(
  formula = target ~ .,
  data = train
)

#37
#Predict on Test Data
nb_pred <- predict(nb_model, test)

#38
#Check the accuracy on Test Data
confusionMatrix(nb_pred, test$target)

#39
#Plot the ROC curve
plotROC(nb_pred, test$target)

#40
#Evaluate the performance of all models
model_list <- list(
  "Logistic Regression" = list(pred = test_pred, RMSE = NA),
  "Decision Tree" = list(pred = tree_pred, RMSE = NA),
  "K Nearest Neighbor" = list(pred = knn_pred, RMSE = NA),
  "Random Forest" = list(pred = rf_pred, RMSE = NA),
  "Feature Selection" = list(pred = test_pred2, RMSE = NA),
  "Support Vector Machine" = list(pred = svm_pred, RMSE = NA),
  "Naive Bayes" = list(pred = nb_pred, RMSE = NA)
)

#41
#Calculate RMSE for each model
for(i in seq_along(model_list)){
  model_list[[i]][["RMSE"]] <- RMSE(model_list[[i]][["pred"]], test$target)
}

#42
#View the model list and RMSE
model_list

#43
#Plot the RMSE for each model
ggplot(model_list) +
  geom_bar(
    aes(x = names(model_list), y = RMSE),
    stat = "identity"
  ) +
  labs(
    title = "Model Performance Comparison",
    x = "Models",
    y = "RMSE"
  )

#44
#Select the best model
best_model <- model_list %>%
  filter(RMSE == min(RMSE)) %>%
  names()

cat("The best model is:", best_model)

#45
#Retrain the best model on entire data
final_model <- mydata %>%
  select(-target) %>%
  select(best_model) %>%
  modelSpec(
    class = "factor",
    formula = target ~ .
  )

final_fit <- mydata %>%
  fitSpec(final_model)

#46
#Prediciting on Original Data
predictions <- predict(final_fit, mydata)

#47
#View the Confusion Matrix
confusionMatrix(predictions, mydata$target)

#48
#View the ROC Curve
plotROC(predictions, mydata$target)

#49
#Make Predictions on New Data
newdata <- read_excel("newData.xlsx")

#50
#Predict on new data
newdata_pred <- predict(final_fit, newdata)