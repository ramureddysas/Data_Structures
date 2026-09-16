#joins from dplyr
#Create Emp Data Frame 
emp_df=data.frame( emp_id=c(1,2,3,4,5,6), name=c("Smith","Rose","Williams","Jones","Brown","Brown"), superior_emp_id=c(-1,1,1,2,2,2), dept_id=c(10,20,10,10,40,50) ) 
# Create dept Data Frame 
dept_df=data.frame( dept_id=c(10,20,30,40), dept_name=c("Finance","Marketing","Sales","IT") )

#inner join
emp_df
dept_df
df2 <- merge(x = emp_df, y = dept_df, by = "dept_id") 
print(df2)
library(dplyr)
# inner join using dplyr package An inner_join() only keeps observations from x 
#that have a matching key in y.
df2 = emp_df %>% inner_join(dept_df, by = "dept_id")
df2
# left join using dplyr package  keeps all observations in x.
df3 = emp_df %>% left_join(dept_df, by = "dept_id")
df3
# right join using dplyr package A right_join() keeps all observations in y.
df4 = emp_df %>% right_join(dept_df, by = "dept_id")
df4
# full join using dplyr package  keeps all observations in x and y.
df5 = emp_df %>% full_join(dept_df, by = "dept_id")
df5
