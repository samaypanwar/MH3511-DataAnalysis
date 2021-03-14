#this section will look into the data in more detail.
#Each variable is investigated individually for possible outliers

library(wooldridge)
library(ggplot2)
library(dplyr)
library(ggridges)
library(viridis)
library(hrbrthemes)

data("bwght")

################
#basic summaries
str(bwght)
summary(bwght)

bwght$male = as.factor(bwght$male)
bwght$white = as.factor(bwght$white)
bwght$bwght = as.numeric(bwght$bwght)
bwght$parity = as.factor(bwght$parity)


############################
#analyzing birth weight data
summary(bwght$bwght)
xbar <- mean(bwght$bwght)
s <- sd(bwght$bwght)

hist(bwght$bwght)
boxplot(bwght$bwght)
boxplot(bwght$lbwght)
boxplot(bwght$bwghtlbs)
#outliers?
                    
#birth weight distribution
xpt = seq(0,200, by=0.03)
n_den <- dnorm(xpt, mean(bwght$bwght), sd(bwght$bwght))
ypt <- n_den * length(bwght$bwght) * 5
ggplot()+
  geom_histogram(data = bwght,mapping=aes(bwght), binwidth = 5)+
  geom_line(aes(x = xpt, y = ypt), col = 'red')#or stem(bwght$bwght)
#looks normal
#high concentration of birth weight from 100-150 ounces

#test for normality
qqnorm(bwght$bwght)
qqline(bwght$bwght, col = 'red')
#longer tails on both sides 
#more like a t-distribution/lorentzian
shapiro.test(bwght$bwght)
#p-value = 8.818e-15, not normal

###############
#male
ggplot(bwght)+geom_boxplot(aes(x=male,y=bwght))
#boxplot doesn't seem to suggest a significant difference in birth weight for males or females
#But males have a slightly higher median

###############
#white
ggplot(bwght)+geom_boxplot(aes(x=white,y=bwght))
#Again, boxplot doesnt seem to suggest a significant difference in birth weight when the child is white or not
#But white children have a slightly higher median

##############
#parity
ggplot(bwght)+geom_boxplot(mapping=aes(x=parity,y=bwght))
#There is no significant difference in birth weight with parity, although 4th born children seem to have the highest IQR compared to other parities
#Medians are around the same

###################
#cigs
ggplot(bwght)+geom_boxplot(mapping=aes(x=cigs,y=bwght))
#Plotting the boxplot shows quite a variation, but there doesn't seem to exist a direct correlation.

#plot for all participants
ggplot(bwght)+
  geom_histogram(aes(cigs))

#isolating smokers
smokers <- bwght[bwght$cigs != 0,]
boxplot(smokers$cigs)
ggplot(smokers)+
  geom_histogram(aes(cigs), bins = 15)
median(smokers$cigs)

#some data exploration for cigs and cigs pricing and taxes
ggplot(bwght)+
  geom_jitter(mapping = aes(x = cigs, y = bwght,col = cigprice))+
  scale_color_gradient(low="blue", high="red")
ggplot(bwght)+
  geom_jitter(mapping = aes(x = cigs, y = bwght,col = cigtax))+
  scale_color_gradient(low="blue", high="red")
#cigarette number is also agnostic with tax and price

#cig packs
bwght$packs <- as.factor(bwght$packs)
ggplot(bwght)+geom_boxplot(mapping=aes(x=packs,y=bwght))
#no point using packs, they basically just divided the cig number

#################
#family income
#plotting the boxplot and hist to observe the data show no outliers

ggplot(bwght)+geom_jitter(mapping = aes(x = bwght, y = faminc), col = 'slategrey')
ggplot(bwght)+geom_jitter(mapping = aes(x = bwght, y = lfaminc), col = 'slategrey')
#no trend


#further data exploration with income
ggplot(bwght)+geom_jitter(mapping = aes(x = bwght, y = faminc, col = white))
#whites seems to have a higher income

#plot for purely income

ggplot(bwght)+
  geom_histogram(aes(faminc))+
  xlab('family income')
boxplot(bwght$faminc)

############
#education
bwght$fatheduc = as.factor(bwght$fatheduc)
ggplot(bwght)+
  geom_boxplot(aes(x = fatheduc, y = bwght))
#does not seem to have much trend
bwght$motheduc = as.factor(bwght$motheduc)
ggplot(bwght)+
  geom_boxplot(aes(x = motheduc, y = bwght))
#also no trend


#plot for purely fatheduc
ggplot(bwght)+
  geom_histogram(aes(fatheduc), binwidth = 1)+
  xlab("Father's education level")
boxplot(bwght$fatheduc)
median(bwght$fatheduc, na.rm = TRUE)

#plot for purely motheduc
ggplot(bwght)+
  geom_histogram(aes(motheduc), binwidth = 1)+
  xlab("Mother's education level")
boxplot(bwght$motheduc)
median(bwght$motheduc, na.rm = TRUE)

#look at max education of parents
bwght$motheduc = as.numeric(bwght$motheduc)
bwght$fatheduc = as.numeric(bwght$fatheduc)
maxeduc <- pmax(bwght$fatheduc, bwght$motheduc, na.rm = TRUE)
maxeduc <- as.factor(maxeduc)
ggplot()+
  geom_boxplot(aes(x = maxeduc, y = bwght$bwght))
#also no trend

