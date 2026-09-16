 
#install.packages(ggplot2)

library(ggplot2)

val<- c(23,34,45,55,66,88)
val

barplot(val, xlab="score")


data <- data.frame(
  quarter=c("Q1", "Q1", "Q2", "Q2", "Q3", "Q3", "Q4", "Q4"),
  product=c("A", "B", "A", "B", "A", "B", "A", "B"),
  profit=c(10, 14, 12, 11, 13, 15, 16, 18)
)
data

barplot<-ggplot2::ggplot(data=data, mapping=aes(x=product, y=profit, fill=quarter, color=quarter)) +
  geom_bar(stat="identity") + labs(title = "score", x="sports", y="activites"
          ) + theme_linedraw()

barplot<- barplot+scale_fill_manual(values=data$quarter)
barplot  

# add colors and themes

barplot_2<-ggplot2::ggplot(data=data, mapping=aes(x=quarter, y=profit)) 
barplot_3<-barplot_2+ geom_col(fill="#0099f9", color="#ffffff")
barplot_4<-barplot_3+ theme_classic()+ labs(title = "products", subtitle = "simple barplot")
barplot_4+ theme(plot.title =element_text(color="red", size=56), 
                 axis.title.x = element_text( color="green", size=27),
                 
                 plot.subtitle = element_text(face = "bold", hjust = 0.5)) + 

labs(x="quarter2020", y="profit2025")

# visualization with plotly

#install.packages("plotly")
library(plotly)
plot_ly(economics, x = ~pop)
plot_ly(economics, x = ~date, y = ~pop)
adsl_1<-admiral::admiral_adsl
plot_ly(adsl_1, x=~TRTDURD, y=~AGE)
fig<-plot_ly(adsl_1, x=~TRTDURD, y=~AGE,marker = list(size = 10,
                                                      color = 'rgba(255, 182, 193, .9)',
                                                      line = list(color = 'rgba(152, 0, 0, .8)',
                                                                  width = 2)))
fig <- fig %>% layout(title = 'Styled Scatter',
                      yaxis = list(zeroline = FALSE),
                      xaxis = list(zeroline = FALSE))
fig

fig_2<-plot_ly(adsl_1, x=~SEX, y=~AGE, type="bar", color = ~ARMCD)
fig_2

fig_2 <- fig_2 %>% layout(title = 'Styled Scatter',
                      yaxis = list(range(c(0,max(adsl_1$AGE)))),
                      xaxis = list(zeroline = FALSE))

fig_2
fig_3 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species)
fig_3
# Swimmer plot with ggplot

library(swimplot)
swimmer_plot(df=adsl_1,id='AGE',end='SUBJID',fill='lightblue',width=.85)

arm_plot <- swimmer_plot(df=ClinicalTrial.Arm,id='id',end='End_trt',name_fill='Arm',
                         id_order='Arm',col="black",alpha=0.75,width=.8)


df <- data.frame(SUBJID = seq(100, 120, by=1),
                 STDY = 0,
                 ENDY= c(10,13,15,18,19,23,30,32,33,33,36,40,42,45,46,46,
                         48,50,51,52,55),
                 COHORT = sample(c("group1","group2"),21,replace = TRUE),
                 Status = c("Ongoing","Discontinue","Ongoing",
                            "Discontinue","Ongoing","Discontinue",
                            "Ongoing", "Discontinue", "Ongoing",
                            "Discontinue", "Ongoing", "Discontinue",
                            "Ongoing", "Discontinue","Ongoing",
                            "Discontinue", "Ongoing", "Discontinue",
                            "Ongoing", "Discontinue","Ongoing"),
                 DISC = c(10,13,15,18,19,23,30,32,33,33,36,40,42,45,46,
                          46,48,50,51,52,55),
                 PDDAY = c(5,6,NA,NA,NA,15,20,NA,NA,21,NA,NA,30,NA,NA,
                           NA,45,NA,43,NA,41),
                 CRDAY = c(NA,NA,10,12,14,NA,NA,9,NA,NA,25,NA,NA,NA,41,
                           NA,NA,40,NA,48,NA)) %>%
  arrange(SUBJID, ENDY)
