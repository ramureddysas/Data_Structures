#A list is a vector but with heterogeneous data elements. A list in R is created with the use of the list() function.
#creating a list


ist_1 <- list(1,2,3,4,5)
list_1

a <- c(1,2,5, 5.6)
b <- c("rshiny" , "ramu" , "sai" , "vijay")

multi_list <- list(1,a,b,0.1)
multi_list
names(multi_list) <- c("numeric" , "numeric_vec" , "character_vec" , "decimal")
#create a variable by loading the a values from the multi list
multi_list[[2]][3]
multi_list[2][3]
cat(multi_list[[3]][2],multi_list[[4]][1],multi_list[[3]][3])
multi_list$numeric_vec
class(multi_list$numeric_vec)
class(a)
cat(multi_list$character_vec[4],multi_list$numeric_vec[4],multi_list$numeric[1])


list_info <- list("Blue", "Yellow", c(12, 13, 14), TRUE, 13.12, 103.4)
print(list_info)

# Creating a named list
my_named_list <- list(name = "Sudheer", age = 25, city = "Delhi")

# Printing the named list
print(my_named_list)


#Naming List Elements
#Creating  a list which contains a matrix and a vector
list_name <- list(matrix(c(1,2,3,4,5,6), nrow = 2), c("mon","tue","wed"))
#Naming elements in the list
names(list_name) <- c("Matrix", "half_week")
#displaying list
print(list_name)
#Merging Lists

#Creating lists
lista <- list(2,4,6)
listb <- list("Jan", "Feb", "Mar")
#Merging lists
merge_list <- c(lista, listb)
#output merged list
print(merge_list)
#Converting List to Vector

lista <- list(1:3)
listb <- list(4:6)
#Converting lists to vector
cva <- unlist(lista)
cvb <- unlist(listb)
print(cva)
print(cvb)
print(is.vector(cvb))




# R program to access
# components of a list

# Creating a list by naming all its components
empId = c(1, 2, 3, 4)
empName = c("Debi", "Sandeep", "Subham", "Shiba")
numberOfEmp = 4
empList = list(
  "ID" = empId,
  "Names" = empName,
  "Total Staff" = numberOfEmp
)
print(empList)

# Accessing components by names
cat("Accessing name components using $ command\n")
print(empList$Names)
print(empList[[2]])
print(empList[[1]][4])

empList$`Total Staff` = 5
empList


empList[[1]][5] = 5
empList[[2]][5] = "Kamala"

cat("After modified the list\n")
print(empList)


# Creating another list
empAge = c(34, 23, 18, 45)


# creating a list
my_numbers = list(1,5,6,3,3)
#adding number at the end of list
append(my_numbers, 45)
#printing list
my_numbers

duplicate(my_numbers)

print(empList[-3])

# Deleting a inner level components
cat("After Deleting sandeep from name\n")
print(empList[[2]][-2])


# Create two lists.
lst1 <- list(1,2,3)
lst2 <- list("Sun","Mon","Tue")

# Merge the two lists.
new_list <- c(lst1,lst2)

# Print the merged list.
print(new_list)
Geek_list <- list(c("Geeks", "For", "Geeks"),  
                  matrix(c(1:9), nrow = 3),  
                  list("Geek", 12.3)) 

# Naming each element of the list 
names(Geek_list) <- c("This_is_a_vector",  
                      "This_is_a_Matrix",  
                      "This_is_a_listwithin_the_list") 
# To remove the last element.      
Geek_list[4] <- NULL


#to convert from list to vector we should use the unlist() not as.vector()


# Create a new list containing a vector, text and a matrix

new_list <- list( c(1,2,3), 
                  "R is Fun!", 
                  matrix(seq(1,6,1),2,3))


new_list <- list(vector = c(1,2,3),         
                 char_string = "R is Fun!", 
                 my_matrix = matrix(seq(1,6,1),2,3))

names(new_list)  # Access names

names(new_list) <- c("obj1","obj2","obj3") # Assign new names

new_list[1:2]       # Take a slice of the first 2 objects

new_list[2]    

new_list[["obj3"]]

length(new_list)    # Return the length of a list

str(new_list)       # Get an overview of the list's structure

summary(new_list) 
