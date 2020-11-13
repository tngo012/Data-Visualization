library(tidyverse)
library(dplyr)
library(ggplot2)
library(sf)
library(rnaturalearthdata)
library(sf)
library(sp)
library(raster) 
library(ggmap)
library(data.table)
library(rgdal)
# Heat Map

# load data
costco <- read.csv('costcos-geocoded.csv')
ppg <- read.csv('ppg2008.csv')

# remove first two columns
ppg <- ppg[ -c(1, 2)]

# compute correlation coefficients
cormat <- round(cor(ppg),2)
melted_cormat <- melt(cormat)

# plot the heat map
ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile(color = "white")



# Spatial Chart

# pick the longitude and latitude from dataframe
df <- costco[c("Longitude","Latitude")]
# create spatial data
coordinates(chi_dat) <- df
crs.geo1 <- CRS("+proj=longlat")
proj4string(chi_dat) <- crs.geo1

plot(chi_dat, pch=20, col='steelblue')
# plot us map and the data
us <- readOGR(dsn="C:/map", layer="cb_2018_us_nation_5m")
plot(us)
points(chi_dat, pch=20, col="red")



# Contour Plot

ggplot(data = df, aes(x = Longitude, y = Latitude)) +
  geom_point(alpha=0.1, col="red") +
  geom_density2d(color="black") +
  ggtitle("Contour Plot") 
  theme_bw()

