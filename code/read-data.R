#########################################
#########################################
### Research project:                 ###
### characterizing seasonal epidemics ###
### Emily Ramos, Nick Reich           ###
### Modified 11/17/14                 ###
#########################################
#########################################


############################
### The data and setting ###
############################

#We have data from a children’s hospital in the U.S. reporting weekly counts of laboratory-confirmed viral infections. Specifically, we have data on the following viruses from 2001-2012 (unless other time range specified): flu A, flu B, RSV, Adenovirus, Parainfluenza, HMPV (2006-), Rhinovirus, Pertussis, Enterovirus, Diarrhea Viruses, Coronavirus (2009-). 

## data should be stored in hospital-surv-data/data
require(reshape2)
require(ggplot2)

## load data
dat <- read.csv("chco.csv")

## fix dates
dat$Date <- as.Date(dat$Date..Month.Year., "%m/%d/%y")
dat <- dat[,-which(colnames(dat)=="Date..Month.Year.")]

## melt data -- maybe should change to dplyr syntax!
dat_melted <- melt(dat, id="Date")

## nice all-pathogen plot
qplot(x=Date, ymin=0, ymax=value, geom="linerange", data=dat_melted, color=variable) + facet_grid(variable~., scales="free_y") + theme(legend.position="none")

#####################
### The questions ###
#####################

#The goal of this project is to, for a given pathogen, describe the characteristics of the annual epidemic curves. Some follow clear seasonal patterns others less so. Starting with some of the ones that do have strongly seasonal characteristics (e.g. RSV, flu A and B, HMPV, Enterovirus, Coronavirus), we want to create a few metrics to evaluate the average behavior and the variability in average behavior across years. Some example metrics we could use:

#• the “season” for each of these infections may not coincide with the calendar year. Is there a more appropriate “start” time to use than January 1 if we want to evaluate each “year” differently?

#• average and sd of week with peak incidence

#• average and sd number of weeks it takes to observe X% (80? 90? 100?) of the annual cases

#• avg and sd number of weeks pre and post peak.

#• avg and sd total number of cases
#RSV
rsv <- dat_melted[which(dat_melted$variable == "RSV"),]
summary(rsv$value)
mean(rsv$value)
#8.56
sd(rsv$value)
#13.83

#Total.Flu.A
FluA <- dat_melted[which(dat_melted$variable == "Total.Flu.A"),]
summary(FluA$value)
mean(FluA$value)
#7.5
sd(FluA$value)
#29.55

#Flu.B
FluB <- dat_melted[which(dat_melted$variable == "Flu.B"),]
summary(FluB$value)
mean(FluB$value)
#1.20
sd(FluB$value)
#3.88

#HMPV
### Should I replace NA's with 0's??????????????
HMPV <- dat_melted[which(dat_melted$variable == "HMPV"),]
summary(HMPV$value)
mean(HMPV$value)
#too many missing
sd(HMPV$value)
#too many missing

#Paraflu
Paraflu <- dat_melted[which(dat_melted$variable == "Paraflu"),]
summary(Paraflu$value)
mean(Paraflu$value)
#3.74
sd(Paraflu$value)
#4.35

#Adenovirus
Adenovirus <- dat_melted[which(dat_melted$variable == "Adenovirus"),]
summary(Adenovirus$value)
mean(Adenovirus$value)
#2.8
sd(Adenovirus$value)
#2.51

#Rhinovirus
Rhinovirus <- dat_melted[which(dat_melted$variable == "Rhinovirus"),]
summary(Rhinovirus$value)
mean(Rhinovirus$value)
#8.6
sd(Rhinovirus$value)
#14.0

#Coronavirus
####### Again, too many NAs???????????????????????????????????
Coronavirus <- dat_melted[which(dat_melted$variable == "Coronavirus"),]
summary(Coronavirus$value)
mean(Coronavirus$value)
#
sd(Coronavirus$value)
#

#B..Pertussis
BPertussis <- dat_melted[which(dat_melted$variable == "B..Pertussis"),]
summary(BPertussis$value)
mean(BPertussis$value)
#4.81
sd(BPertussis$value)
#5.16

#Enterovirus
Enterovirus <- dat_melted[which(dat_melted$variable == "Enterovirus"),]
summary(Enterovirus$value)
mean(Enterovirus$value)
#1.66
sd(Enterovirus$value)
#2.46

#Diarrhea.Viruses
DiaVirus <- dat_melted[which(dat_melted$variable == "Diarrhea.Viruses"),]
summary(DiaVirus$value)
mean(DiaVirus$value)
#1.63
sd(DiaVirus$value)
#2.30

##################
### The Goals  ###
##################

# The goals of this effort are to create a write-up with definitions and justifications of the different metrics chosen, along with tables and figures to display the results.



