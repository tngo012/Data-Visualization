# Libraries
library(tidyverse)
library(hrbrthemes)
library(ggplot2)

# load data
df <- read_csv('birth-rate.csv')
df1 <- read_csv('crimeratesbystate-formatted.csv')
df2 <- read_csv('education.csv')


# plot histogram
ggplot(df, aes(x=`2008`)) +
  geom_histogram(binwidth=1, color='darkred', fill='red') +
  ggtitle('World birth rate in 2008')
  theme_ipsum() +
  theme(
    plot.title = element_text(size=15)
  )
  
  
# box plot
ggplot(df, aes(x=`2008`)) +
  geom_boxplot() +
  xlab("2008") +
  ggtitle("World birth rate in 2008")


library(plotly)

fig <- plot_ly(
  type = "indicator",
  mode = "number+gauge",
  value = 7,
  domain = df1$murder,
  title = list(text = "<b>Murder</b>"),
  gauge = list(
    shape = "bullet",
    axis = list(range = list(NULL, 10)),
    threshold = list(
      line = list(color = "red", width = 2),
      thickness = 0.75,
      value = 15),
    steps = list(
      list(range = c(0, 10), color = "lightgray"),
      list(range = c(0, 10), color = "gray"))),
  height = 150, width = 600) 
fig <- fig %>%
  layout(margin = list(l= 100, r= 10))

fig


# plot reading and math in us
ggplot(df2, aes(x=reading, y=math))+
  geom_point() +
  geom_abline() +
  ggtitle("Relationship between reading and math among the states")









