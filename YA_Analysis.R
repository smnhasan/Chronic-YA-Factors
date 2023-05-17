#Logistic Regression

require(foreign)
require(MASS)
require(pROC)
require(survey)
require(ResourceSelection)
require(ROCR)
require(car)
require(ggplot2)
require(maptools)
require(dplyr)


## importing dataset

setwd('E:\\Assignment')

fd <- as.data.frame(read.spss('Final_data.sav',use.value.labels=F),stringsAsFactors = FALSE)

max(fd$age)

fd <- View(fd)

#outcome and key predictor
factor(fd$CA1)
fd$diarrhea <- ifelse(fd$CA1==9|fd$CA1==8 ,NA,fd$CA1)
factor(fd$diarrhea)
fd$diarrhea <- factor(fd$diarrhea,levels=c(1,2),labels = c('yes','no'))
factor(fd$diarrhea)

#household water test (100ml).
factor(fd$WQ26)
fd$WQ26 <- ifelse(fd$WQ26==991|fd$WQ26==992 ,NA,fd$WQ26)
fd$hhwq <- ifelse(fd$WQ26==0,0,ifelse(fd$WQ26==1|fd$WQ26==2|fd$WQ26==3|
                                        fd$WQ26==4|fd$WQ26==5|fd$WQ26==6|
                                        fd$WQ26==7|fd$WQ26==8|fd$WQ26==9|
                                        fd$WQ26==10,1,2))
factor(fd$hhwq)
fd$hhwq <- factor(fd$hhwq,levels=c(0,1,2),labels = c('Low','Moderate','High'))
factor(fd$hhwq)

#source water test (100ml).
factor(fd$WQ27)
fd$WQ27 <- ifelse(fd$WQ27==991|fd$WQ27==992 ,NA,fd$WQ27)
fd$swq <- ifelse(fd$WQ27==0,0,ifelse(fd$WQ27==1|fd$WQ27==2|fd$WQ27==3|
                                       fd$WQ27==4|fd$WQ27==5|fd$WQ27==6|
                                       fd$WQ27==7|fd$WQ27==8|fd$WQ27==9|
                                       fd$WQ27==10,1,2))
factor(fd$swq)
fd$swq <- factor(fd$swq,levels=c(0,1,2),labels = c('Low','Moderate','High'))
factor(fd$swq)

#Source water type (100ml).
factor(fd$WS1)
fd$WS1 <- ifelse(fd$WS1==99 ,NA,fd$WS1)
fd$swt <- ifelse(fd$WS1==11|fd$WS1==12|fd$WS1==13|fd$WS1==14|fd$WS1==21|
                   fd$WS1==31|fd$WS1==41|fd$WS1==51|fd$WS1==91|fd$WS1==92,1,2)
factor(fd$swt)
fd$swt <- factor(fd$swt,levels=c(1,2),labels = c('Improved','Unimproved'))
factor(fd$swt)

#Child Age
fd$cage <- fd$CAGE_11

#Child sex
fd$csex <- fd$HL4
fd$csex <- factor(fd$csex,levels=c(1,2),labels = c('Male','Female'))
factor(fd$csex)

#Residence.
fd$residence <- fd$HH6.x
fd$residence <- factor(fd$HH6.x,levels=c(1,2,3,4,5),labels = c('Rural','Urban','Urban','Urban','Rural'))
factor(fd$residence)

#Division.
fd$division <- fd$HH7.x
fd$division <- factor(fd$HH7.x,levels=c(10,20,30,40,45,50,55,60),labels = c("Barisal","Chattogram","Dhaka","Khulna","Mymensingh","Rajshahi","Rangpur","Sylhet"))
factor(fd$HH7.x)

#Education.
factor(fd$melevel)
fd$melevel <- ifelse(fd$melevel==9,NA,fd$melevel)
fd$melevel <- factor(fd$melevel,levels=c(0,1,2,3),labels = c('Primary','LSecondary','S/HSecondary','Higher'))
factor(fd$melevel)

#Wealth index Status.
factor(fd$windex5.x)
fd$windex <- ifelse(fd$windex5.x==0,NA,fd$windex5.x)
factor(fd$windex)
fd$windex <- factor(fd$windex,levels=c(1,2,3,4,5),labels = c('Poor','Poor','Middle','Rich','Rich'))
factor(fd$windex)

#Religion.

fd$religion <- ifelse(fd$HC1A==9,NA,fd$HC1A)
factor(fd$religion)
fd$religion <- factor(fd$religion,levels=c(1,2,3,4),labels = c('Islam','Others','Others','Others'))
factor(fd$religion)

#household sex.
fd$HHSEX <- factor(fd$HHSEX,levels=c(1,2),labels = c('Male','Female'))
factor(fd$HHSEX)

#Mother Age.
fd$WAGE <- factor(fd$WAGE,levels=c(1,2,3,4,5,6,7),labels = c('15-19','20-34','20-34','20-34','35+','35+','35+'))
factor(fd$WAGE)

#Type of toilet facility.
fd$tf <- ifelse(fd$WS11==99,NA,fd$WS11)
fd$tf <- ifelse(fd$WS11<24,1,2)
fd$tf <- factor(fd$tf,levels=c(1,2),labels = c('Improved','Unimproved'))
factor(fd$tf)

#Salt Iodization.
fd$si <- ifelse(fd$SA1==9,NA,fd$SA1)
fd$si <- ifelse(fd$si==2|fd$si==3,1,2)
fd$si <- factor(fd$si,levels=c(1,2),labels = c('Yes','No'))
factor(fd$si)

#Height for Age Stunned.
fd$stunned <- ifelse(fd$HAZ2==99.97|fd$HAZ2==99.98|fd$HAZ2==99.99,NA,fd$HAZ2)
fd$stunned <- ifelse(fd$stunned<=-2,1,2)
fd$stunned <- factor(fd$stunned,levels=c(1,2),labels = c('Yes','No'))
factor(fd$stunned)

#Weight for Age Wasted.
fd$wasted <- ifelse(fd$WHZ2==99.97|fd$WHZ2==99.98|fd$WHZ2==99.99,NA,fd$WHZ2)
fd$wasted <- ifelse(fd$wasted<=-2,1,2)
fd$wasted <- factor(fd$wasted,levels=c(1,2),labels = c('Yes','No'))
factor(fd$wasted)

#Household own any animals
fd$animal <- ifelse(fd$HC17==9,NA,fd$HC17)
fd$animal <- factor(fd$animal,levels=c(1,2),labels = c('Yes','No'))
factor(fd$animal)

#househol member
median(fd$HH48)
fd$hhmem <- ifelse(fd$HH48<5,1,2)
fd$hhmem <- factor(fd$hhmem,levels=c(1,2),labels = c('less 5','5/5+'))
factor(fd$hhmem)

#Toilet facility shared
fd$tfshared <- ifelse(fd$WS15==9,NA,fd$WS15)
fd$tfshared <- factor(fd$tfshared,levels=c(1,2),labels = c('Yes','No'))
factor(fd$tfshared)

#Treat water to make safer for drinking
fd$watertreat <- ifelse(fd$WS9==8|fd$WS9==9,NA,fd$WS9)
fd$watertreat <- factor(fd$watertreat,levels=c(1,2),labels = c('Yes','No'))
factor(fd$watertreat)

design1 <- svydesign(id=~fd$HH1,  weights=~fd$chweight,data=fd)

str(fd)
fd <- subset(fd, !is.na(diarrhea))
fd <- subset(fd, !is.na(hhwq))
str(fd)

logit1 <- (svyglm(relevel(factor(diarrhea), ref = "no") ~ hhwq, family=quasibinomial(link=logit), data=fd, design=design1 , na.action = na.omit, rescale=TRUE))
summary(logit1) #sig

model.or <- cbind(exp(coef(logit1)),exp(confint(logit1)))
colnames(model.or) <- c('odds ratio','ci(2.5%)','ci(97.5%)')
model.or #for odds ratio and ci


logit1 <- (svyglm(relevel(factor(diarrhea), ref = "no") ~ hhwq + swq + swt + cage + csex + residence + division +
                                                          windex  + tf   + animal + melevel +
                                                          hhmem + tfshared + watertreat, family=quasibinomial(link=logit), data=fd, design=design1, na.action = na.omit))
summary(logit1) #sig

model.or <- cbind(exp(coef(logit1)),exp(confint(logit1)))
colnames(model.or) <- c('odds ratio','ci(2.5%)','ci(97.5%)')
model.or #for odds ratio and ci



library(tableone)
library(labelled)
library(cobalt)
library(MatchIt)
library(tidyr)
library(WeightIt)

m.out <- weightit(diarrhea ~  swq + swt + cage + csex + residence + division +
                    windex  + tf   + animal + si + melevel.1 +
                    hhmem + tfshared + watertreat, fd, estimand = "ATE", method = "cbps")
set.cobalt.options(binary = "std")

# library(cobalt)
# bal.tab(m.out,m.threshold=0.1)
# 
# bal.plot(m.out, var.name = 'hhwq',which='both')

# love.plot(bal.tab(m.out,m.threshold=0.1),
#           stat = "mean.diffs",myVars,stars = "raw", abs=F)


# new.names <- c(age = "Age (Years)",
#                educ = "Education (Years)",
#                married = "Married (Y/N)",
#                nodegree = "Degree Earned (Y/N)",
#                race_white = "Race: White",
#                race_black = "Race: Black",
#                race_hispan = "Race: Hispanic",
#                re74 = "Earnings in 1974 ($)",
#                re75 = "Earnings in 1975 ($)"
# )


love.plot(m.out, 
          drop.distance = TRUE, 
          var.order = "unadjusted",
          abs = TRUE,
          line = F, 
          thresholds = c(m = .1),
          # var.names = new.names,
          colors = c("red", "blue"),
          shapes = c("triangle filled", "circle filled"),
          sample.names = c("Unweighted", "PS Weighted"),
          limits = c(0, .82),
          position = c(.89, .95)) +
  theme(legend.box.background = element_rect(), 
        legend.box.margin = margin(1, 1, 1, 1))

m.out$weights
w <- get_w_from_ps(m.out$ps,
              fd$diarrhea,
              estimand = "ATE",
              focal = NULL,
              treated = NULL,
              subclass = NULL,
              stabilize = FALSE)

design1 <- svydesign(id=fd$HH1,  weights=m.out$s.weights,data=fd)


summary(m.out$weights)
summary(w)


logit1 <- (svyglm(relevel(factor(diarrhea), ref = "no") ~ hhwq + swq + swt + cage + csex + residence + division +
                    windex  + tf   + animal  + si + melevel +
                    hhmem + tfshared + watertreat, family=quasibinomial(link=logit), data=fd, design=design1, na.action = na.omit))
summary(logit1) #sig

model.or <- cbind(exp(coef(logit1)),exp(confint(logit1)))
colnames(model.or) <- c('odds ratio','ci(2.5%)','ci(97.5%)')
model.or #for odds ratio and ci






#####Only for Love plot

########PS mETHOD


## importing dataset

setwd('E:\\Update - Ecoli\\Bangladesh MICS6 SPSS Datasets')

wm <- as.data.frame(read.spss('wm.sav',use.value.labels=F),stringsAsFactors = FALSE)

wm<- wm[with(wm, order(HH1, HH2, LN)),]

hh <- as.data.frame(read.spss('hh.sav',use.value.labels=F),stringsAsFactors = FALSE)

hh<- hh[with(hh, order(HH1, HH2)),]

ch <- as.data.frame(read.spss('ch.sav',use.value.labels=F),stringsAsFactors = FALSE)

ch<- ch[with(ch, order(HH1, HH2, LN)),]

merdat <- left_join(x = ch, y = wm, by=c("HH1", "HH2","LN"))

merdat2 <- left_join(x = merdat, y = hh, by=c("HH1", "HH2"))
str(merdat2)
merdat$melevel
# x1 <- c(1,1,2,2,3,3)
# x2 <- c(2,3,1,3,1,2)
# x <- data.frame(x1,x2)
# x
# 
# y1 <- c(1,2,3)
# y2 <- c(100,150,130)
# y <- data.frame(y1,y2)
# 
# xy <- merge(x,y,by.x="x2",by.y="y1")

## subsetting datasets

f <- c('CA1','WQ26','WQ27','WS1','CAGE_11','HL4','HH6.x','HH7.x',
       'melevel','windex5.x','HC1A','HHSEX','ethnicity','WAGE','WS11',
       'EC3A','SA1','MT1','MT2','MT3','WAZ2',
       'HAZ2','WHZ2','HC17','HH48','HC15','HC14','WS15',
       'WS3','WS9','chweight','HH1','stratum',"melevel")

fd <- merdat2[,f]
fd$WAGE
design1 <- svydesign(id=fd$HH1, weights=fd$chweight,data=fd)

#outcome and key predictor
factor(fd$CA1)
fd$diarrhea <- ifelse(fd$CA1==9|fd$CA1==8 ,NA,fd$CA1)
factor(fd$diarrhea)
fd$diarrhea <- factor(fd$diarrhea,levels=c(1,2),labels = c('yes','no'))
factor(fd$diarrhea)

#household water test (100ml).
factor(fd$WQ26)
fd$WQ26 <- ifelse(fd$WQ26==991|fd$WQ26==992 ,NA,fd$WQ26)
fd$hhwq <- ifelse(fd$WQ26==0,0,ifelse(fd$WQ26==1|fd$WQ26==2|fd$WQ26==3|
                                        fd$WQ26==4|fd$WQ26==5|fd$WQ26==6|
                                        fd$WQ26==7|fd$WQ26==8|fd$WQ26==9|
                                        fd$WQ26==10,1,2))
# factor(fd$hhwq)
# fd$hhwq <- factor(fd$hhwq,levels=c(0,1,2),labels = c('Low','Moderate','High'))
# factor(fd$hhwq)

#source water test (100ml).
factor(fd$WQ27)
fd$WQ27 <- ifelse(fd$WQ27==991|fd$WQ27==992 ,NA,fd$WQ27)
fd$swq <- ifelse(fd$WQ27==0,0,ifelse(fd$WQ27==1|fd$WQ27==2|fd$WQ27==3|
                                       fd$WQ27==4|fd$WQ27==5|fd$WQ27==6|
                                       fd$WQ27==7|fd$WQ27==8|fd$WQ27==9|
                                       fd$WQ27==10,1,2))
# factor(fd$swq)
# fd$swq <- factor(fd$swq,levels=c(0,1,2),labels = c('Low','Moderate','High'))
# factor(fd$swq)

#Source water type (100ml).
factor(fd$WS1)
fd$WS1 <- ifelse(fd$WS1==99 ,NA,fd$WS1)
fd$swt <- ifelse(fd$WS1==11|fd$WS1==12|fd$WS1==13|fd$WS1==14|fd$WS1==21|
                   fd$WS1==31|fd$WS1==41|fd$WS1==51|fd$WS1==91|fd$WS1==92,1,2)
# factor(fd$swt)
# fd$swt <- factor(fd$swt,levels=c(1,2),labels = c('Improved','Unimproved'))
# factor(fd$swt)

#Child Age
fd$cage <- fd$CAGE_11

#Child sex
fd$csex <- fd$HL4
# fd$csex <- factor(fd$csex,levels=c(1,2),labels = c('Male','Female'))
# factor(fd$csex)

#Residence.
# factor(fd$HH6.x)
fd$residence <- fd$HH6.x
# fd$residence <- factor(fd$HH6.x,levels=c(1,2,3,4,5),labels = c('Rural','Urban','Urban','Urban','Rural'))
# factor(fd$residence)

#Division.
# factor(fd$HH7.x)
fd$division <- fd$HH7.x
# fd$division <- factor(fd$HH7.x,levels=c(10,20,30,40,45,50,55,60),labels = c("Barisal","Chattogram","Dhaka","Khulna","Mymensingh","Rajshahi","Rangpur","Sylhet"))
# factor(fd$HH7.x)

#Education.
factor(fd$melevel)
fd$melevel <- ifelse(fd$melevel==9,NA,fd$melevel)
# fd$melevel <- factor(fd$melevel,levels=c(0,1,2,3),labels = c('Primary','LSecondary','S/HSecondary','Higher'))
# factor(fd$melevel)

#Wealth index Status.
factor(fd$windex5.x)
fd$windex <- ifelse(fd$windex5.x==0,NA,fd$windex5.x)
# factor(fd$windex)
# fd$windex <- factor(fd$windex,levels=c(1,2,3,4,5),labels = c('Poor','Poor','Middle','Rich','Rich'))
# factor(fd$windex)

#Religion.

fd$religion <- ifelse(fd$HC1A==9,NA,fd$HC1A)
# factor(fd$religion)
# fd$religion <- factor(fd$religion,levels=c(1,2,3,4),labels = c('Islam','Others','Others','Others'))
# factor(fd$religion)

#household sex.
# factor(fd$HHSEX)
# fd$HHSEX <- factor(fd$HHSEX,levels=c(1,2),labels = c('Male','Female'))
# factor(fd$HHSEX)

#Mother Age.
# factor(fd$WAGE)
# fd$WAGE <- factor(fd$WAGE,levels=c(1,2,3,4,5,6,7),labels = c('15-19','20-34','20-34','20-34','35+','35+','35+'))
# factor(fd$WAGE)

#Type of toilet facility.
fd$tf <- ifelse(fd$WS11==99,NA,fd$WS11)
fd$tf <- ifelse(fd$WS11<24,1,2)
# fd$tf <- factor(fd$tf,levels=c(1,2),labels = c('Improved','Unimproved'))
# factor(fd$tf)

#Salt Iodization.
fd$si <- ifelse(fd$SA1==9,NA,fd$SA1)
fd$si <- ifelse(fd$si==2|fd$si==3,1,2)
# fd$si <- factor(fd$si,levels=c(1,2),labels = c('Yes','No'))
# factor(fd$si)

#Height for Age Stunned.
fd$stunned <- ifelse(fd$HAZ2==99.97|fd$HAZ2==99.98|fd$HAZ2==99.99,NA,fd$HAZ2)
fd$stunned <- ifelse(fd$stunned<=-2,1,2)
# fd$stunned <- factor(fd$stunned,levels=c(1,2),labels = c('Yes','No'))
# factor(fd$stunned)

#Weight for Age Wasted.
fd$wasted <- ifelse(fd$WHZ2==99.97|fd$WHZ2==99.98|fd$WHZ2==99.99,NA,fd$WHZ2)
fd$wasted <- ifelse(fd$wasted<=-2,1,2)
# fd$wasted <- factor(fd$wasted,levels=c(1,2),labels = c('Yes','No'))
# factor(fd$wasted)

#Household own any animals
fd$animal <- ifelse(fd$HC17==9,NA,fd$HC17)
# fd$animal <- factor(fd$animal,levels=c(1,2),labels = c('Yes','No'))
# factor(fd$animal)

#househol member
median(fd$HH48)
fd$hhmem <- ifelse(fd$HH48<5,1,2)
# fd$hhmem <- factor(fd$hhmem,levels=c(1,2),labels = c('less 5','5/5+'))
# factor(fd$hhmem)

#Toilet facility shared
fd$tfshared <- ifelse(fd$WS15==9,NA,fd$WS15)
# fd$tfshared <- factor(fd$tfshared,levels=c(1,2),labels = c('Yes','No'))
# factor(fd$tfshared)

#Treat water to make safer for drinking
fd$watertreat <- ifelse(fd$WS9==8|fd$WS9==9,NA,fd$WS9)
# fd$watertreat <- factor(fd$watertreat,levels=c(1,2),labels = c('Yes','No'))
# factor(fd$watertreat)

fd <- fd[32:52]
library(tableone)
library(labelled)
library(cobalt)
myVars <- names(fd)
myVars

library(MatchIt)
library(tidyr)
fd <- na.omit(fd)
library(WeightIt)
m.out <- weightit(diarrhea ~  swq + swt + cage + csex + residence + division +
                    windex  + tf   + animal  + si + melevel.1 +
                    hhmem + tfshared + watertreat, fd, estimand = "ATE", method = "cbps")

set.cobalt.options(binary = "std")

# library(cobalt)
# bal.tab(m.out,m.threshold=0.1)
# 
# bal.plot(m.out, var.name = 'hhwq',which='both')

# love.plot(bal.tab(m.out,m.threshold=0.1),
#           stat = "mean.diffs",myVars,stars = "raw", abs=F)


# new.names <- c(age = "Age (Years)",
#                educ = "Education (Years)",
#                married = "Married (Y/N)",
#                nodegree = "Degree Earned (Y/N)",
#                race_white = "Race: White",
#                race_black = "Race: Black",
#                race_hispan = "Race: Hispanic",
#                re74 = "Earnings in 1974 ($)",
#                re75 = "Earnings in 1975 ($)"
# )


love.plot(m.out, 
          drop.distance = TRUE, 
          var.order = "unadjusted",
          abs = TRUE,
          line = F, 
          thresholds = c(m = .1),
          # var.names = new.names,
          colors = c("red", "blue"),
          shapes = c("triangle filled", "circle filled"),
          sample.names = c("Unweighted", "PS Weighted"),
          limits = c(0, .82),
          position = c(.89, .95)) +
  theme(legend.box.background = element_rect(), 
        legend.box.margin = margin(1, 1, 1, 1))

