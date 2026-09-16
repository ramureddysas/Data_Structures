#Clinical Plots
#spiderplot using plotly
# also known as radiar plots
library(plotly)

#Create a sample dataset for the spider plot 
categories <- c("Math", "Science", "English", "History", "Art") 
values <- c(80, 70, 85, 90, 75)

plot_1<- plot_ly(type="scatterpolar", r=values, theta=categories, fill="twoself", mode="line")

# Customize layout 
fig <- plot_1 %>% layout( polar = list( radialaxis = list( visible = T, range = c(0, 100) , linecolor="red") ), title = 'Student A Performance' )
fig

# KM plot usuing plotly

library(plotly)
library(survival)

# Load the lung dataset from the survival package 
data(veteran) 
# Fit the Kaplan-Meier survival curve using the Surv function 
km_fit <- survfit(Surv(time, status) ~ sex, data = veteran) 
# Create the Kaplan-Meier plot using 
 km_plot <- plot_ly() %>%
  add_lines( x = km_fit$time,   y = km_fit$surv,  color = "red", 
 line = list(width = 4), name = paste("Group", levels(factor(km_fit$strata))) ) %>%
  layout( title = "Kaplan-Meier Survival Curve", xaxis = list(title = "Time (in days)"), yaxis = list(title = "Survival Probability"), 
          showlegend = TRUE ) 
 
 km_plot

 
 library(plotly)
 
 x= list("Sales", "Consulting", "Net revenue", "Purchases", "Other expenses", "Profit before tax")
 measure= c("relative", "relative", "total", "relative", "relative", "total")
 text= c("+60", "+80", "", "-40", "-20", "Total")
 y= c(60, 80, 0, -40, -20, 0)
 data = data.frame(x=factor(x,levels=x),measure,text,y)
 
 fig <- plot_ly(
   data, name = "20", type = "waterfall", measure = ~measure,
   x = ~x, textposition = "outside", y= ~y, text =~text,
   connector = list(line = list(color= "rgb(63, 63, 63)"))) 
 fig <- fig %>%
   layout(title = "Profit and loss statement 2018",
          xaxis = list(title = ""),
          yaxis = list(title = ""),
          autosize = TRUE,
          showlegend = TRUE)
 
 fig 
 
 data <- data.frame( study = c("Study 1", "Study 2", "Study 3", "Study 4", "Study 5"), 
                     estimate = c(1.2, 0.8, 1.5, 1.1, 0.9), # Point estimates (e.g., odds ratios) 
                     lower_ci = c(1.0, 0.6, 1.2, 0.9, 0.7), # Lower bound of 95% CI 
                     upper_ci = c(1.5, 1.0, 1.9, 1.3, 1.1)
                     ) 
 
                     # Upper bound of 95% CI )
                     
                     # Create the forest plot using plotly 
forest_plot <- plot_ly(data = data) %>% 
  add_segments( x = ~lower_ci, y = ~study, xend = ~upper_ci, yend = ~study, line = list(color = 'black', width = 2), 
              name = "Confidence Interval" ) %>%
     add_markers( x = ~estimate, y = ~study, marker = list(symbol = 'circle', size = 8, color = 'red'), name = "Point Estimate" ) %>% 
  layout( title = "Forest Plot Example", xaxis = list(title = "Effect Size (Point Estimate)"), yaxis = list(title = "Study"), 
          showlegend = FALSE ) # Show the plot forest_plot
forest_plot 
