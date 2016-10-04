#########
#Peer review
#########

### SETTING THE WORK DIRECTORY
wkdir = "~\\"
subdir = "Github\\Getting and Cleaning Data"

# create directory if it doesn't exist yet
dir.create(file.path(wkdir, subdir))
setwd(file.path(wkdir, subdir))
getwd()
#zip file download to director
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "peer_review_data.zip")

#unzip file
unzip("peer_review_data.zip")

## LOAD LIBRARIES NEEDED
library(plyr) # FOR DATA TRANSFORMATION

#INPUT DIRECTORY PATH WHERE THE EXTRACTED FILES IS
dir = paste0(getwd(),"\\UCI HAR Dataset\\")

#FILES OF INTEREST PATH 
activity_label = paste0(dir,"activity_labels.txt")
features = paste0(dir,"features.txt")
subject_test = paste0(dir,"test\\subject_test.txt")
X_test = paste0(dir,"test\\X_test.txt")
Y_test = paste0(dir,"test\\Y_test.txt")
subject_train = paste0(dir,"train\\subject_train.txt")
X_train = paste0(dir,"train\\X_train.txt")
Y_train = paste0(dir,"train\\Y_train.txt") 

print("ALL DATA FILES LINKED")

#DESCRIPTIVE DATA LOAD
row_values_activities = read.table(activity_label)
print("activity_label.txt Loaded")

col_values_features = read.table(features)
print("features.txt Loaded")

row_values_activities[,2] = tolower(row_values_activities[,2])
row_values_activities[,2] = gsub("_"," ",row_values_activities[,2])
feature_labels = col_values_features[grep("mean[()]|std[()]",col_values_features[,2]),2]
feature_labels = gsub("mean","Mean",feature_labels)
feature_labels = gsub("std","Std",feature_labels)
feature_labels = gsub("-","",feature_labels)

#TEST DATA LOAD
individual_id_test = read.table(subject_test)
print("subject_test.txt Loaded")
data_test = read.table(X_test)
print("X_test.txt Loaded")
row_id_test = read.table(Y_test)
print("Y_test.txt Loaded")
#TEST DATA FORMATTING WITH ACTIVITIES AND FEATURES
activity_id = row_values_activities[row_id_test[,1],2]
colnames(data_test) = feature_labels
full_data_test = cbind(activity_id,individual_id_test,data_test)
colnames(full_data_test)[1:2] = c("Activity","Individual ID")

#TRAIN DATA LOAD
individual_id_train = read.table(subject_train)
print("subject_train.txt Loaded")
data_train = read.table(X_train)
print("X_train.txt Loaded")
row_id_train = read.table(Y_train)
print("Ytrain.txt Loaded")

#TRAIN DATA FORMATTING WITH ACTIVITIES AND FEATURES
activity_id = row_values_activities[row_id_train[,1],2]
colnames(data_train) = feature_labels
full_data_train = cbind(activity_id,individual_id_train,data_train)
colnames(full_data_train)[1:2] = c("Activity","Individual ID")


#MERGING OF TRAIN AND TEST DATA SETS
full_data = rbind(full_data_train,full_data_test)
full_data[,"Individual ID"] = factor(full_data[,"Individual ID"])
full_data = full_data[,c(1,2,grep("Mean[()]|Std[()]",colnames(full_data)))]
print("Test and Train data set merged")
output_data_set = paste0(dir,"\\full data-set.txt")
write.table(full_data,output_data_set) # writes out full data-set

#FORMATTING TIDY DATA-SET
output = list()
k = 0 
for(i in 1:max(as.numeric(full_data[,"Individual ID"]))){
  for(j in unique(full_data[full_data[,"Individual ID"] == i,"Activity"])){
    k=k+1
    data = t(colMeans(full_data[full_data[,"Individual ID"] == i & full_data[,"Activity"] == j,3:68]))
    output[[k]] = cbind(i,j,data)
  }
}
summary_data = as.data.frame(do.call(rbind,output))



colnames(summary_data)[1:2] = c("Invididual ID","Activity")
print("Tidy data set created")


write.table(summary_data,"tidy data-set.txt") # writes out tidy data-set
data = read.table(output_file)
