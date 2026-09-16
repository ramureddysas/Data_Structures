#Functions
#defining a function without parameters

function_1 <- function() {
  print("hello")
}
function_1()

#defining a function with parameters

function_2 <- function(name,age){
  print(name)
  print(age)
  paste("my name is",name)
}

function_2(name="Vijay",age=32)
function_2(age=32,name="Vijay")
function_2("Vijay",32)

#below calls will get errors
function_2(name="Vijay")
function_2(name="Vijay",age=)
function_2(name="Vijay",age=32,x=24)

#defining a function with default parameter value 

function_3 <- function(country="USA"){
  paste("I am from",country)
}

function_3()
function_3("India")

#defining a function using return function inside of for loop

function_4 <- function(){
  for (i in 1:5) {
    print(i^2)
    return(5)
  }
}
function_4()

#defining a function using return function outside of for loop

function_5 <- function(){
  for (i in 1:5) {
    print(i^2)
  }
  return(5)
}
function_5()
#defining a function using for loop with arguments

function_6 <- function(x,y){
  for (i in 1:5) {
    power=i^2
    print(power)
  }
  return(power+x+y)
}
function_6(4,5)


#define a function to print a table (2x1=2, etc.)

function_7 <- function(x=2,test){
  for (y in 1:10) {
    table=x*y
    table2 <- paste(x,"*",y,"=",table)
    print(table2)
  }
}

function_7()

function_8 <- function(a,b){
  for (i in 1:b) {
    table=a*i
    table2 <- paste(a,"*",i,"=",table)
    print(table2)
  }
}

function_8(6,10)

#define a function to check a numeric type using if condition

function_9 <- function(number,b){
  if(is.numeric(number)){
    for (i in 1:b) {
      table=number*i
      table2 <- paste(number,"*",i,"=",table)
      print(table2)
    }  
  } else {
    print("Enter a valid number")
  }
  
}

function_9(8,10)
function_9("8",10)

#define a function to check a numeric type by if condition using logical operator

function_10 <- function(number,b){
  if(is.numeric(number) & is.numeric(b)){
    for (i in 1:b) {
      table=number*i
      table2 <- paste(number,"*",i,"=",table)
      print(table2)
    }  
  } else {
    print("Enter a valid number")
  }
  
}
function_10(5,10)
function_10(5,"10")

#define a function to check a numeric type by if condition using logical operator

function_11 <- function(number,b){
  #value <<- 444 
  #value <- 55
  if(is.numeric(number) | is.numeric(b)){
    for (i in 1:b) {
      cnt <- number*i
      table2 <- paste(number,"*",i,"=",cnt)
      print(table2)
    }  
  } else {
    print("Enter a valid number")
  }
  
}

function_11(5,"10")
#error call
function_11("5",10)
