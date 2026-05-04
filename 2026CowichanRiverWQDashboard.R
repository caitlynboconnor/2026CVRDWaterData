# Cowichan River Water Quality Monitoring 2026


#```{r setup, include=FALSE}
#library(flexdashboard)
library(ggplot2)
library(tidyverse)
library(plotly)
#```
install.packages("dplyr")
library(Dplyr)
### **Data provided by CVRD Environmental Services Division**


# cbo formatting PH Skutz fall data
pHSkutzData <- read.csv("https://raw.githubusercontent.com/caitlynboconnor/2026CVRDWaterData/refs/heads/main/pH%20Skutz%202026-04-28%2015_28_21%20PDT.csv")
pHSkutzData <- pHSkutzData[, -c(1,6:8)]
pHSkutzData$Site <- "Skutz Falls - Remote (km 32)"
pHSkutzData$DateTime <- as.POSIXct(pHSkutzData$DateTime, format = "%m/%d/%Y %H:%M") 

# cbo couldn't get this line to work - long term this would be good to have in case file gets read in wrong
#pHSkutzData <- pHSkutzData %>% mutate_at(vars(Temp, pH), as.numeric)

# cbo check to make sure the data looks right
head(pHSkutzData)

# cbo PH Skutz ggplot basic
pHSkutzPlot <- ggplot(data = pHSkutzData, aes(x=DateTime, y=pH)) +
  geom_line() + geom_point() +
  xlab("") + ylab("pH") + ggtitle("Skutz Falls") + theme_classic()

ggplotly(pHSkutzPlot)


# cbo formatting DO Skutz fall data
DOSkutzData <- read.csv("https://raw.githubusercontent.com/caitlynboconnor/2026CVRDWaterData/refs/heads/main/DO%20Skutz%202026-04-28%2015_26_52%20PDT.csv")
DOSkutzData <- DOSkutzData[,-c(1,6:9)]
DOSkutzData$Site <- "Skutz Falls - Remote (km32)"
DOSkutzData$Date.Time..PDT. <- as.POSIXct(DOSkutzData$Date.Time..PDT., format = "%m/%d/%Y %H:%M")

# cbo check to make sure the data looks right
head(DOSkutzData)

# cbo DO Skutz ggplot  
DOSkutzPlot <- ggplot(data = DOSkutzData, aes(x=Date.Time..PDT., y=Measured.DO....mg.L..W.DO.22225580.)) +
  geom_line() + geom_point() + 
  xlab("") + ylab("Measured DO") + ggtitle("Skutz Falls") + theme_classic()

ggplotly(DOSkutzPlot)
