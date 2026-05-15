# Cowichan River Water Quality River -pH, DO, Temp 
# Cowichan River = CR

# r setup 
library(readxl)
library(flexdashboard)
library(ggplot2)
library(tidyverse)
library(plotly)


###### pH ######

#Updating format of adding site and date

#pH Skutz Falls Data 
pHSkutzData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026pHSkutzData.xlsx")
pHSkutzData2026$Site <- "Skutz Falls"
pHSkutzData2026$DateTime <- as.POSIXct(pHSkutzData2026$DateTime, format = "%m/%d/%Y %H:%M")

#pH Saysells Data 
pHSaysellsData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026pHSaysells.xlsx")
pHSaysellsData2026$Site <- "Saysells"
pHSaysellsData2026$DateTime <- as.POSIXct(pHSaysellsData2026$DateTime, format = "%m/%d/%Y %H:%M")

#pH US Quamichan Data
pHUSQuamichanData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026pHUSQuamichan.xlsx")
pHUSQuamichanData2026$Site <- "US Quamichan (DS JUB)"
pHUSQuamichanData2026$DateTime <- as.POSIXct(pHUSQuamichanData2026$DateTime, format = "%m/%d/%Y %H:%M")

#pH Rotary Data
pHRotaryData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026pHUSJUBRotary.xlsx")
pHRotaryData2026$Site <- "Rotary (US JUB)"
pHRotaryData2026$DateTime <- as.POSIXct(pHRotaryData2026$DateTime, format = "%m/%d/%Y %H:%M")

#pH Trestle Data 
pHTrestleData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026pHTrestle.xlsx")
pHTrestleData2026$Site <- "Trestle"
pHTrestleData2026$DateTime <- as.POSIXct(pHTrestleData2026$DateTime, format = "%m/%d/%Y %H:%M")

#pH Didson Data
phDidsonData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026pHDidson.xlsx")
phDidsonData2026$Site <- "Didson"
phDidsonData2026$DateTime <- as.POSIXct(phDidsonData2026$DateTime, format = "%m/%d/%Y %H:%M")


#Combining the pH Data into the pH Master Sheet 
MasterCRpH2026 <- rbind(pHSkutzData2026, pHSaysellsData2026, pHUSQuamichanData2026, pHRotaryData2026, pHTrestleData2026, phDidsonData2026)
#Making Site Data into a categorical variable for analysis
MasterCRpH2026$Site <- factor(MasterCRpH2026$Site, levels = c("Skutz Falls", "Saysells", "US Quamichan (DS JUB)", "Rotary (US JUB)", "Trestle", "Didson"))

class(MasterCRpH2026)
dim(MasterCRpH2026)
str(MasterCRpH2026)
view(MasterCRpH2026)

#Create CR pH plot 
ggplot(MasterCRpH2026, aes(x = DateTime, y = pH, colour = Site, shape = Site)) +
  geom_point(alpha = 0.8, size = 0.9) + geom_line() + 
  xlab("") +
  ylab("pH") + ylim(6.5,9) +
  theme_bw()

#Can't get this to work
#Plotting pH CR
pHCRPlot2026 <- ggplot(MasterCRpH2026, aes(x = DateTime, y = pH, colour = Site, shape = Site)) +
  geom_point(alpha = 0.8, size = 0.9) + geom_line() + 
  xlab("") +
  ylab("pH") + ylim(6,10)
  theme_bw()

ggplot(pHCRPlot2026)  


###### DO ######

#DO Skutz Falls Data
DOSkutzData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026DOSkutz.xlsx")
DOSkutzData2026$Site <- "Skutz Falls"
DOSkutzData2026$DateTime <- as.POSIXct(DOSkutzData2026$DateTime, format = "%m/%d/%Y %H:%M")

#DO Saysells Data 
DOSaysellsData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026DOSaysells.xlsx")
DOSaysellsData2026$Site <- "Saysells"
DOSaysellsData2026$DateTime <- as.POSIXct(DOSaysellsData2026$DateTime, format = "%m/%d/%Y %H:%M")

#DO US Quamichan Data
DOUSQuamichanData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026DOUSQuamichan.xlsx")
DOUSQuamichanData2026$Site <- "US Quamichan (DS JUB)"
DOUSQuamichanData2026$DateTime <- as.POSIXct(DOUSQuamichanData2026$DateTime, format = "%m/%d/%Y %H:%M")

#DO Rotary Data 
DORotaryData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026DORotary.xlsx")
DORotaryData2026$Site <- "Rotary (US JUB)"
DORotaryData2026$DateTime <- as.POSIXct(DORotaryData2026$DateTime, format = "%m/%d/%Y %H:%M")

#DO Trestle Data 
DOTrestleData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026DOTrestle.xlsx")
DOTrestleData2026$Site <- "Trestle"
DOTrestleData2026$DateTime <- as.POSIXct(DOTrestleData2026$DateTime, format = "%m/%d/%Y %H:%M")

#DO Didson Data
DODidsonData2026 <- read_excel("N:/11. ENGINEERING PUBLIC WORKS/5275 Env Mgmt Watershed Mgmt/5275-20 Water Quality/5275-20 Cowichan River Water Quality Data 2026/2026DODidson.xlsx")
DODidsonData2026$Site <- "Didson"
DODidsonData2026$DateTime <- as.POSIXct(DODidsonData2026$DateTime, format = "%m/%d/%Y %H:%M")


#Combining the DO Site Data into the DO Master Sheet CR= Cowichan River
MasterCRDO2026 <- rbind(DOSkutzData2026, DOSaysellsData2026, DOUSQuamichanData2026, DORotaryData2026, DOTrestleData2026, DODidsonData2026)
#Making Site Data into a categorical variable for analysis
MasterCRpH2026$Site <- factor(MasterCRpH2026$Site, levels = c("Skutz Falls", "Saysells", "US Quamichan (DS JUB)", "Rotary (US JUB)", "Trestle", "Didson"))

#Create CR DO plot 
ggplot(MasterCRDO2026, aes(x = DateTime, y = DO, colour = Site, shape = Site)) +
  geom_point(alpha = 0.8, size = 0.9) + geom_line() + 
  xlab("") +
  ylab("DO") + 
  theme_bw()


###### Temp ######

# Temp plotting uses DO Data sheets
ggplot(MasterCRDO2026, aes(x = DateTime, y = Temp, colour = Site, shape = Site)) +
  geom_point(alpha = 0.8, size = 0.9) + geom_line() + 
  xlab("") +
  ylab("Temp") + 
  theme_bw()
