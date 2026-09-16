names_1 <- c("ramu","anjana","vijay","sai")
marks_1 <- c(1:4)
logic_1 <- c(TRUE,FALSE,FALSE, TRUE)
geneder <- c("male", "female", "male", "male")
subjects <- c("maths", "telugu", "hindi", "english")

class(names_1)
class(marks_1)
class(logic_1)
class(geneder)
length (logic_1)
str(logic_1)
str(names_1)
str(marks_1)
summary(geneder)
summary(marks_1)
summary(logic_1)
mean(marks_1)
mode(marks_1)
median(marks_1)

# create a data frame

data_fr1 <- data.frame(names_1, marks_1, logic_1, geneder,subjects)
data_fr1
length(data_fr1)
str(data_fr1)
class(data_fr1)
summary(data_fr1)
nchar(data_fr1)
dim(data_fr1)
nrow(data_fr1)
ncol(data_fr1)
head(data_fr1,2)
tail(data_fr1,2)
sort(data_fr1$names_1, decreasing = TRUE)

names(data_fr1)
colnames(data_fr1)
rownames(data_fr1)

# R program to create dataframe

# creating a data frame
friend.data <- data.frame(
  friend_id = c(1:5), 
  friend_name = c("Sachin", "Sourav", 
                  "Dravid", "Sehwag", 
                  "Dhoni"),
  stringsAsFactors = FALSE
)
# print the data frame
print(friend.data)
print(str(friend.data))

print(summary(friend.data)) 

# R program to expand
# the data frame

# creating a data frame
friend.data <- data.frame(
  friend_id = c(1:5), 
  friend_name = c("Sachin", "Sourav", 
                  "Dravid", "Sehwag", 
                  "Dhoni"),
  stringsAsFactors = FALSE
)

# Expanding data frame
friend.data$location <- c("Kolkata", "Delhi", 
                          "Bangalore", "Hyderabad",
                          "Chennai")
resultant <- friend.data
# print the modified data frame
print(resultant)

# print dimentions of the dataset


#Add Rows and Columns in R Data Frame

# Creating a dataframe representing products in a store
Products <- data.frame(
  Product_ID = c(101, 102, 103),
  Product_Name = c("T-Shirt", "Jeans", "Shoes"),
  Price = c(15.99, 29.99, 49.99),
  Stock = c(50, 30, 25)
)

# Print the existing dataframe
cat("Existing dataframe (Products):\n")
print(Products)

# Adding a new row for a new product
New_Product <- c(104, "Sunglasses", 39.99, 40)
Products <- rbind(Products, New_Product)

# Print the updated dataframe after adding the new product
cat("\nUpdated dataframe after adding a new product:\n")
print(Products)
# Adding a new column for 'Discount' to the dataframe
Discount <- c(5, 10, 8)  # New column values for discount
Products <- cbind(Products, Discount)

# Rename the added column
colnames(Products)[ncol(Products)] <- "Discount"  # Renaming the last column

# Print the updated dataframe after adding the new column
cat("\nUpdated dataframe after adding a new column 'Discount':\n")
print(Products)


#Remove Rows and Columns 


library(dplyr)
# Create a data frame
data <- data.frame(
  friend_id = c(1, 2, 3, 4, 5),
  friend_name = c("Sachin", "Sourav", "Dravid", "Sehwag", "Dhoni"),
  location = c("Kolkata", "Delhi", "Bangalore", "Hyderabad", "Chennai")
)

data

# Remove a row with friend_id = 3
data <- subset(data, friend_id != 3)

data


library(dplyr)
# Create a data frame
data <- data.frame(
  friend_id = c(1, 2, 3, 4, 5),
  friend_name = c("Sachin", "Sourav", "Dravid", "Sehwag", "Dhoni"),
  location = c("Kolkata", "Delhi", "Bangalore", "Hyderabad", "Chennai")
)
data

# Remove the 'location' column
data <- select(data, -location)

data 


# Creating two sample dataframes
df1 <- data.frame(
  Name = c("Alice", "Bob"),
  Age = c(25, 30),
  Score = c(80, 75)
)

df2 <- data.frame(
  Name = c("Charlie", "David"),
  Age = c(28, 35),
  Score = c(90, 85)
)

# Print the existing dataframes
cat("Dataframe 1:\n")
print(df1)

cat("\nDataframe 2:\n")
print(df2)

# Combining the dataframes using rbind()
combined_df <- rbind(df1, df2)

# Print the combined dataframe
cat("\nCombined Dataframe:\n")
print(combined_df)



# Creating two sample dataframes
df1 <- data.frame(
  Name = c("Alice", "Bob"),
  Age = c(25, 30),
  Score = c(80, 75)
)

df2 <- data.frame(
  Height = c(160, 175),
  Weight = c(55, 70)
)

# Print the existing dataframes
cat("Dataframe 1:\n")
print(df1)

cat("\nDataframe 2:\n")
print(df2)

# Combining the dataframes using cbind()
combined_df <- cbind(df1, df2)

# Print the combined dataframe
cat("\nCombined Dataframe:\n")
print(combined_df)

#working with Dplyr package
#LOAD THE ADLB dataset from the admiral package
#create a variable with dim 10 obsevarions and selected columns (6)

library(admiral)
#install.packages(admiral)

adlb <- admiral::admiral_adlb
colnames(adlb)
library(dplyr)
adlb <- dplyr::select(adlb, STUDYID, USUBJID, LBTESTCD, AVAL, PARAMCD, TRT01A)
dim(adlb)
adlb1 <- dplyr::sample_n(adlb,10)
dim(adlb1)
dplyr::filter(adlb1 , AVAL==38)
adlb1
output_dataset <- adlb1 %>%
  dplyr::arrange(LBTESTCD) %>% 
  dplyr::mutate(STUDYID = NULL) %>%
  dplyr::filter(PARAMCD == c("AST","BASO"))%>%
  dplyr::rename(TRT=TRT01A)%>%
  dplyr::select(2:5)%>%
  dplyr::group_by(PARAMCD)%>%z
  base::mean(AVAL)
output_dataset
