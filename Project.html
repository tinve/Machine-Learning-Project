### Practical Machine learning project.

## Background

The data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants, doing the set of exercises, was collected, processed and published by [this group](http://groupware.les.inf.puc-rio.br/har).
Participant were asked to perform barbell lifts correctly and incorrectly in 5 different ways (denoted by letters A, B, C, D or E). Training data set can be downloaded from [here](https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv), and test data set - from [here](https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv) 
 
## Data cleaning

I have downloaded both csv files into my working directory and uploaded them to R workspace as data frames. All empty fields were filled with NA. Outcome (A, B, C, D or E) is stored in "classe" column.

```
library(caret)

## load datasets

full <- read.csv("pml-training.csv", stringsAsFactors = TRUE,
                                     na.strings = c("", "NA"))
testing <- read.csv("pml-testing.csv", stringsAsFactors = TRUE,
                                       na.strings = c("", "NA"))
```

Test set does not have answers, so I need cross validation to estimate model accuracy. The data set is large enough to split it into training (70%) and validation (30%) data sets, which are both still fairly large.
I also set seed for reproducibility.

```
# split full data set into training and validation

set.seed(123)
inTrain <- createDataPartition(full$classe, p = 0.7, list = FALSE)
training <- full[inTrain, ]
validation <- full[-inTrain, ]
```

Not all variables in the data set would make good predictors. So first I make a list of variable names that I want to drop from the data.
Variables "X", "user_name", and "problem_id" should not affect the prediction. Since I build classification rather than forecasting model, I should also drop all variables related to time ("raw_timestamp_part_1", "raw_timestamp_part_2", "cvtd_timestamp", "new_window" and "num_window").

```
# list of columns that should not affect the prediction

skipColumns <- c("X", 
                 "user_name", 
                 "raw_timestamp_part_1", 
                 "raw_timestamp_part_2", 
                 "cvtd_timestamp", 
                 "new_window", 
                 "num_window",
                 "problem_id")
```

Some columns miss too many values. I am going to drop all columns that have more than 50% of values missing.

```
# add columns that miss more than half of the values in training dataset

for (i in 0:dim(training)[2])
    {
    if (sum(is.na(training[ , i])) > 0.5 * length(training[ , i]))
        {
        skipColumns <- c(skipColumns, names(training[i]))
        }
    }
```

Now that I have the full list of irrelevant variables, I can delete them from my data frames.

```
# reduce number of predictors

training <- training[, ! names(training) %in% skipColumns]
validation <- validation[, ! names(validation) %in% skipColumns]
testing <- testing[, ! names(testing) %in% skipColumns]
```

## Model building

I build random forest model on clean training data set. It shall predict "classe" based on all other variables in data frame.

```
# build a random forest model

modFit <- train(classe ~ ., data = training, model = "rf")
```

I first want to check its accuracy on training data:

```
# run model on training data set, get accuracy on training set 

trainPrediction <- predict(modFit, training)
print(confusionMatrix(training$classe, trainPrediction))
```

This is what I get (truncated for brevity):

```
Confusion Matrix and Statistics

          Reference
Prediction    A    B    C    D    E
         A 3906    0    0    0    0
         B    0 2658    0    0    0
         C    0    0 2396    0    0
         D    0    0    0 2252    0
         E    0    0    0    0 2525

Overall Statistics
                                     
               Accuracy : 1          
                 95% CI : (0.9997, 1)
    No Information Rate : 0.2843     
    P-Value [Acc > NIR] : < 2.2e-16  
                                     
                  Kappa : 1          
 Mcnemar's Test P-Value : NA         
```
Not bad! The model predicts all the outcomes in training data with 100% accuracy. But this is not a correct estimate of the model accuracy, because the model might be overfitted on training dataset. 
I now apply my model to the validation data:

```
# run model on validation data set, estimate out of the sample error

validPrediction <- predict(modFit, validation)
print(confusionMatrix(validation$classe, validPrediction))
```
As expected, the confusion matrix is no longer strictly diagonal, and accuracy is below 100%:

```
Confusion Matrix and Statistics

          Reference
Prediction    A    B    C    D    E
         A 1672    2    0    0    0
         B    7 1130    2    0    0
         C    0    8 1015    3    0
         D    0    0   17  946    1
         E    0    0    2    1 1079

Overall Statistics
                                          
               Accuracy : 0.9927          
                 95% CI : (0.9902, 0.9947)
    No Information Rate : 0.2853          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.9908          
 Mcnemar's Test P-Value : NA          
```

Still, out of the sample error is less than 1%, so the model is pretty good!

## Submission

All that's left is to run the model on training set and write the answer for each of 20 cases into a separate file:

```
# run model on testing data set

answers <- predict(modFit, testing)
print(answers)

# write answers to individual files

for(i in 1:length(answers)) {
    filename = paste0("problem_id_", i, ".txt")
    write.table(answers[i], file=filename,
                quote=FALSE, row.names=FALSE, col.names=FALSE)
}
```
Out of sample accuracy 99% and a little bit of luck is enough to get 20 out of 20:

```
 [1] B A B A A E D B A A B C B A E E A B B B
Levels: A B C D E
```

The End.
