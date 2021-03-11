#this section will look into the data in more detail.
#Each variable is investigated individually for possible outliers

library(wooldridge)
library(ggplot2)
library(dplyr)

data("bwght")
str(bwght)

bwght$male = as.factor(bwght$male)
bwght$white = as.factor(bwght$white)
bwght$bwght = as.numeric(bwght$bwght)
bwght$parity = as.factor(bwght$parity)
bwght$cigs = as.factor(bwght$cigs)

#analyzing birth weight data
hist(bwght$bwght)
boxplot(bwght$bwght)
boxplot(bwght$lbwght)
boxplot(bwght$bwghtlbs)
#outliers?
                    
#birth weight distribution
ggplot(bwght,mapping=aes(bwght))+geom_histogram(bins=50) #or stem(bwght$bwght)
#high concentration of birth weight from 100-150 ounces

#male
ggplot(bwght)+geom_boxplot(aes(x=male,y=bwght))
#boxplot doesn't seem to suggest a significant difference in birth weight for males or females
#But males have a slightly higher median

#white
ggplot(bwght)+geom_boxplot(aes(x=white,y=bwght))
#Again, boxplot doesnt seem to suggest a significant difference in birth weight when the child is white or not
#But white children have a slightly higher median

#parity
ggplot(bwght)+geom_boxplot(mapping=aes(x=parity,y=bwght))
#There is no significant difference in birth weight with parity, although 4th born children seem to have the highest IQR compared to other parities
#Medians are around the same

#cigs
ggplot(bwght)+geom_boxplot(mapping=aes(x=cigs,y=bwght))
#Plotting the boxplot shows quite a variation, but there doesn't seem to exist a direct correlation.

#family income
#plotting the boxplot and hist to observe the data show no outliers




