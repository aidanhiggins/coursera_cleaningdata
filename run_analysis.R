
output <- function() {
  # Load the dplyr library
  library(dplyr)
  # Load the test files
  x_test_file <- read.table("./test/X_test.txt")
  y_test_file <- read.table("./test/y_test.txt")
  subject_test_file <- read.table("./test/subject_test.txt")
  
  # Load the train files
  x_train_file <- read.table("./train/X_train.txt")
  y_train_file <- read.table("./train/y_train.txt")
  subject_train_file <- read.table("./train/subject_train.txt")
  
  # Create all of the column names required, most from 'features.txt'
  y.subject.headers <- c('activity','subject')
  subject_headers <- read.table("./features.txt")
  headers.char <- as.character(subject_headers$V2)
  data.headers <- c(y.subject.headers, headers.char)
  # Format the column headers to remove possible duplicates
  valid_column_names <- make.names(names=data.headers, unique=TRUE, allow_ = TRUE)
  
  # Bind the activity and subject files
  test_act_subj <- cbind(y_test_file, subject_test_file)
  train_act_subj <- cbind(y_train_file, subject_train_file)
  
  # Bind the activity and subject data to the actual data
  test_file_input <- cbind(test_act_subj, x_test_file)
  train_file_input <- cbind(train_act_subj, x_train_file)
  
  # Assign the column names to the train and test data
  colnames(train_file_input) <- valid_column_names
  colnames(test_file_input) <- valid_column_names
  
  # Merge all of the test & train data to a single dataset
  all_input_data <- rbind(test_file_input, train_file_input)
  
  # Extract the names of the columns required
  cols_required <- grep('activity|subject|\\.mean\\.|\\.std\\.', names(all_input_data), value=TRUE)
  # Extract all of the data required
  data_mean_std <- all_input_data[,cols_required]
  
  # Load the activity labels and label itself
  activities <- read.table("./activity_labels.txt")
  colnames(activities) <- c('id', 'activity')
  
  # Appropriately labels the data set with descriptive variable names. 
  activites_col_named <- activities$activity[data_mean_std$activity]
  # Replace the activity column id with the name of the activity in the dataset
  data_mean_std$activity <- activites_col_named
  
  # Load the data.table library and convert the data to a data.table
  library(data.table)
  data_mean_std_tbl <- data.table(data_mean_std)
  # Group the data by activity and subject and calculate the average
  grpd_avg <- data_mean_std_tbl[, lapply(.SD,mean), by=c('activity','subject')]
  
  # Output results to file
  write.table(grpd_avg, file="./grpd_output.txt", row.name=FALSE)
}
