#String Manipulations
library(stringr)
stringr::str_c("sai"," ","ramu","vj    ")
a <- c("   hello   ")
nchar(a)
str_length(a)
str_to_upper(a)
str_sub(a, start=2, end=-4)
str_trim(a, side="left")
