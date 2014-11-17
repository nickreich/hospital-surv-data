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
qplot(x=Date, ymin=0, ymax=value, geom="linerange", data=dat_melted, color=variable) + 
    facet_grid(variable~., scales="free_y") + theme(legend.position="none")
