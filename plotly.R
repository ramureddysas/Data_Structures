
#install.packages("plotly")

library(ggplot2)

library(plotly)

adsl<- admiral::admiral_adsl

 

#plot with ggplot

bar<-ggplot(data=adsl , mapping = aes(x=AGE , y=TRTDURD, colour = SEX ))+geom_boxplot(fill_alpha("blue"))

bar 

 

#plot with plot_ly

plot<- plot_ly(adsl , x= ~AGE ,y= ~TRTDURD , type = "box" , color = ~ARMCD)

plot

 

scat<- plot_ly(adsl , x= ~AGE ,y= ~TRTDURD , type = "scatter" , color = ~ARMCD)

scat

 

 

line<- plot_ly(adsl , x= ~AGE ,y= ~TRTDURD , type = "scatter" , mode="markers+lines")

line<- line%>% layout(title="scatter figure")

line

 

#plot with high charts

#install.packages("highcharter")

adsl1<- head(adsl)

library(highcharter)

hchart(adsl, hcaes(x=ARMCD , y=AGE), type="bar")|>

  hc_title(text="AGE and ARAMCD difference")
