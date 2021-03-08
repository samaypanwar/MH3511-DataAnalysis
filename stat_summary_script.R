library(tidyverse)
data  = read.csv("healthcare-dataset-stroke-data.csv", header = TRUE)
summary(data)
str(data)

data$stroke = as.factor(data$stroke)
data$hypertension = as.factor(data$hypertension)
data$heart_disease = as.factor(data$heart_disease)
data$bmi <- as.numeric(levels(data$bmi))[data$bmi]

str(data)

ggplot(data) + 
  geom_bar(mapping = aes(stroke),
           position = 'identity')
summary(data)

ggplot(data)+
  geom_bar(
    mapping = aes(x = ever_married, fill = stroke),
    position = 'fill') +
  xlab('Ever married') +
  ylab('Proportions') +
  ggtitle('Plot of marriage')
#married people seem to be more prone to stroke

ggplot(data) +
  geom_bar(
    mapping = aes(x = gender, fill = stroke),
    position = 'fill')+
  xlab('Gender') +
  ylab('Proportions') +
  ggtitle('Plot of gender')
#same proportions of stroke in males and females

ggplot(data)+
  geom_bar(mapping = aes(hypertension, fill = stroke),
           position = 'fill')+
  ylab("Proportions")+
  xlab("Hypertension")
#higher chance of stroke among people with hypertension

ggplot(data)+
  geom_bar(mapping = aes(heart_disease, fill = stroke),
           position = 'fill')+
  ylab("proportions")+
  xlab("Heart Disease")
#those with heart disease have a higher change of stroke

ggplot(data)+
  geom_bar(mapping = aes(smoking_status, fill = stroke),
           position = 'fill')+
  xlab("Smoking status")+
  ylab("Proportion")
#formerly smoked seem to have a higher proportion of stroke.
#but never smoked and smokes have the same proportion

ggplot(data, mapping = aes(avg_glucose_level, fill = stroke)) +
  geom_histogram(bins = 20)+
  xlab('Average Glucose Level')
#double peak graph
#does not seem to have any correlation

ggplot(data)+
  geom_histogram(mapping = aes(age, fill = stroke),
                 bins = 20)+
  xlab("Age")
# seems to be uniformly distributed.
# older people have a higher change of stroke
  
ggplot(data)+
  geom_bar(mapping =aes(work_type, fill = stroke),
           position = 'fill')+
  xlab("Work type")
#self emplyed people seem to have a higher chance of stroke

ggplot(data)+
  geom_bar(mapping = aes(Residence_type, fill = stroke),
           position = 'fill')+
  xlab("Residence type")+
  ylab("Proportion")
#does not seem to have a difference in residence type

xpt <- seq(0,75, by=0.03)
n_den <- dnorm(xpt, mean(data$bmi, na.rm = TRUE), sd(data$bmi, na.rm = TRUE))
ypt <- n_den * (length(data$bmi) - 201) * 3

ggplot()+
  geom_histogram(data = data, mapping = aes(bmi, fill = stroke),
                 binwidth = 3)+
  geom_line(mapping = aes(x = xpt, y = ypt), col = 'dodgerblue')


#does not seem to have a relation
ggplot(data)+
  geom_boxplot(mapping = aes(y = bmi, stroke))
#plotting the boxplot seem to suggest that higher bmi has a higher chance of stroke



