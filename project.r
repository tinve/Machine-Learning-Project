library(caret)

## load datasets

full <- read.csv("pml-training.csv", stringsAsFactors = TRUE, na.strings = c("", "NA"))
testing <- read.csv("pml-testing.csv", stringsAsFactors = TRUE, na.strings = c("", "NA"))

# split full data set into training and validation

set.seed(123)
inTrain <- createDataPartition(full$classe, p = 0.7, list = FALSE)
training <- full[inTrain, ]
validation <- full[-inTrain, ]

# list of columns that should not affect the prediction

skipColumns <- c("X", 
                 "user_name", 
                 "raw_timestamp_part_1", 
                 "raw_timestamp_part_2", 
                 "cvtd_timestamp", 
                 "new_window", 
                 "num_window",
                 "problem_id")

# add columns that miss more than half of the values in training dataset

for (i in 0:dim(training)[2])
    {
    if (sum(is.na(training[ , i])) > 0.5 * length(training[ , i]))
        {
        skipColumns <- c(skipColumns, names(training[i]))
        }
    }

# reduce number of predictors

training <- training[, ! names(training) %in% skipColumns]
validation <- validation[, ! names(validation) %in% skipColumns]
testing <- testing[, ! names(testing) %in% skipColumns]

# build a random forest model

modFit <- train(classe ~ ., data = training, model = "rf")

# run model on training data set, get accuracy on training set 

trainPrediction <- predict(modFit, training)
print(confusionMatrix(training$classe, trainPrediction))

# run model on validation data set, estimate out of the sample error

validPrediction <- predict(modFit, validation)
print(confusionMatrix(validation$classe, validPrediction))

# run model on testing data set

answers <- predict(modFit, testing)
print(answers)

# write answers to individual files

for(i in 1:length(answers)) {
    filename = paste0("problem_id_", i, ".txt")
    write.table(answers[i], file=filename,
                quote=FALSE, row.names=FALSE, col.names=FALSE)
}
              