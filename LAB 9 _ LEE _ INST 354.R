# Sang Hwa Lee _ LAB 9 _ INST 354 

kick <- read.csv('C:/Users/sangh/Downloads/kickstarter_lab9.csv', header = TRUE)

head(kick)

str(kick)


# 1. Is a difference between 'music'  and  'art'  campaigns in terms of how much money is pledged? Run a two-sample t test to determine this. 

kick$category <- as.factor(kick$category)
mean(subset(kick$usd.pledged,kick$category == "Music"))
mean(subset(kick$usd.pledged,kick$category == "Art"))



kick$category2cat[kick$category == "Music"] <- 0
kick$category2cat[kick$category == "Art"] <- 1
kick$category2cat <- as.factor(kick$category2cat)
t.test(kick$usd.pledged ~ kick$category2cat, na.rm=TRUE)

# Answer: Yes, There is a difference.
# Art campaigns  = 4805.333, and Music campaigns = 3857.936 .


# 2. Is there is a difference between 'music'  and  'art'  campaigns in terms of their rate of success?  Run a chi-square test to determine this.

kick$state <- as.factor(kick$state)

results_table <- table(kick$category2cat, kick$state)
rownames(results_table) <- c("Music","Art")
colnames(results_table) <- c("Successful","Failed")
results_table


# Music successful = 8, failed = 12 means( rate is 40%)   and   Art successful = 6, failed = 6 (rate is 50%). 
# Let's run a chi-square test to see if this difference is statistically significant. 

chisq.test(results_table) 


# Answer: It turns out that this difference is statistically significant, (chi-square(1) = 0.033862 p = 0.854). 



# 3. Is there a significant relationship between the number of backers and the amount of money that is pledged? 
#    Compute a correlation and it's associated p value to determine this.

cor(kick$usd.pledged, kick$backers)

# Answer : There seems to be a positive relationship between the two variables (r = 0.73)


cor.test(kick$usd.pledged, kick$backers)

# Answer : P value < 2.2e-16, so the correlation is statistically significant.


# 4. Is there a significant relationship between the number of backers and the amount of money that is pledged, after controlling for the location of the kickstarter campaign? 
#    Run a regression model using the number of backers and country to predict the amount of money pledged. 

mod1 <- lm(kick$usd.pledged ~ kick$backers + kick$country + kick$category2cat)
summary(mod1)

# It looks like there is still a positive relationship between the  number of backers and the amount of money that is pledged  (b = 41.373, p < 0.1), after controlling for other variables. 

