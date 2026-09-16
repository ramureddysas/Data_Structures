#Vector Operations

#Create a variable
#Create a Vector
#add a new element to the vector
#Access the vector
#Access the two values from the same vector
# Delete a vector
#delete a value from the vector
#Check the length of the vector
# Replace a value in vector
# add two vectors
# create a dataframe using vectors
# create a list using vectors
# delete a value in vector
# Create a vector using multiple data type
#Check the type of the data structure
#convert the vector into list
# Create an another variable using a value from the vector
#Type conversion


value_1<-100
                
vector_ex<-c(2,3,4,5) #14

vector_ex[4]<-400

vector_ex

length(vector_ex)
class(vector_ex)

vector_ex[5]<-300

vector_ex[7]<-700

vector_ex[7]<-NA

class(vector_ex)

vector_ex[8]<-""
  
vector_ex<-vector_ex[-8]

vector_ex

vector_ex<-as.numeric(vector_ex)

is.numeric(vector_ex)

vector_list<-as.list(vector_ex)

class(vector_list)

vector_list

class(vector_ex)

length(vector_ex)

vector_ex<-vector_ex[8]<-""

vector_ex
class(vector_ex)

gh
class(gh)

#Vector index in R starts from 1, unlike most programming languages where the index starts from 0.


vector_ex[c(2,3)]<-100

vector_ex_13<-vector_ex[c(-2,-7)]  # delete the value from the 2nd position <-13

length(vector_ex_13)

length(vector_ex)

class(vector_ex)

vector_string<-c("anjana","R","Shiny")

class(vector_string)

mix_vector<-c(vector_ex,vector_string)

mix_vector

class(mix_vector)

single_string_vector<-c("R")
class(single_string_vector)
length(single_string_vector)

mix_vec_2<-c(vector_ex,single_string_vector)

mix_vec_2

class(mix_vec_2)


length(mix_vec_2)

string<-c("Shiny")
length(string)


nchar(mix_vec_2)

list_1<-list("R","Shiny",3,2,6.7)

list_1

length(list_1)

nchar(list_1)

list_vec<-list(vector_ex,vector_string)
list_vec

length(list_vec)

nchar(list_vec)


class(list_vec)

# access all but 1st element
vector_string[-1] 

# cannot mix positive and negative integers
vector_string[c(2, -4)]


#Using character vector as index
#This type of indexing is useful when dealing with named vectors. We can name each elements of a vector.

x <- c("first"=3, "second"=0, "third"=9)
is.numeric(x)
names(x)
x["second"]

x <- c(-3,-2,-1,0,1,2)
# modify 2nd element
x[2] <- 0; x        
# modify elements less than 0
x[x<0] <- 5; x   
# truncate x to first 4 elements
x <- x[1:4]; x      


#How to delete a vector in R?
x <- c(-3,-2,-1,0,1,2)
x <- NULL
x
x[4] 

# repeat sequence of vector 2 times
numbers <- rep(c(2,4,6), times = 2)

cat("Using times argument:", x[5],numbers)

paste0(x[4],"example string",numbers,vector_string)

cat(x[4],"example string",numbers,vector_string)


print("example",numbers)

numbers <- c(1, 2, 3, 4, 5)
length(numbers)
# iterate through each elements of numbers
for (i in numbers) {
  print("ikadaki vachindhi")
  print(i)
print("endki vachindhi")
  }


#Arithmetic operations
a <- c(1, 3, 5, 7)    
b <- c(2, 4, 6, 8)  

data.frame(a,b)
# Perform and print the element-wise operations  
print(a + b)  # To perform addition  
print(a - b)  # To perform subtraction  

example_vector <- c(1,2,3)

#+ adds to each value in the vector
example_vector + 10

example_vector2 <- c(1.6, 2.5, 3.5)

round(example_vector2)

x <- c("R","Is","Fun!")
y <- c("Kaggle","Is","Fun!")

paste(x, y)
paste0(x,y)
cat(x,y)
# Using dplyr package
library(dplyr)

# Original vector
original_vector <- c(1, 2, 3, 4, 5)

# Create a new vector with elements greater than 2
new_vector <- subset(original_vector, original_vector > 2)
new_vector


# Create a numeric vector of length 5 initialized with zeros
x = vector("numeric", 5)
# Print the label for the numeric vector
print("Numeric Type:")
# Print the numeric vector
print(x)

# Define the first vector
x = c(10, 20, 30, 20, 20, 25, 29, 26)

# Define the second vector
y = c(10, 50, 30, 20, 20, 35, 19, 56)

# Define the third vector
z = c(10, 40, 30, 20, 20, 25, 49, 26)


intersect(x,y)
intersect(x,y,z)
# Find the common elements among all three vectors
result = intersect(intersect(x,y),z)


vector = c()  # Initialize an empty vector
values = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)  # Create a vector containing values from 0 to 9
for (i in 1:length(values))  # Loop through each element in the 'values' vector
  vector[i] <- values[i]  # Append each value to the 'vector'
print(vector)  # Print the final vector containing all values

# create a vector of strings
vector1 <- c("Science", "is","fun")

# using paste() and separate vector strings with whitespace
result1 <- paste(vector1, collapse = " ")


my_letters <- c("a","b","c","d","a","a","f")

# Get only those values of my_letters contained within c("a","c")
my_letters[my_letters %in% c("a","c")]
