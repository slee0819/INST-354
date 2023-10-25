kickstarter354 <- read.csv('C:/Users/sangh/Downloads/kickstarter354.csv', header = TRUE)

# 1) How many rows and columns does the dataset have?
# In order to get rows and columns...

nrow(kickstarter354) # this is for the number of rows
ncol(kickstarter354) # this is for the number of columns
dim(kickstarter354) # this is for the dimensions (rows, columns)

# Answer : There are 497 rows and 14 cloumns.

# 2) What are the variables in the kickstarter dataset? Which ones might be relevant in trying to determine whether a kickstarter was successful or not?

str(kickstarter354)

# Answer : 
# - ID				       - Names
# - Categories 			 - Main categories
# - Currencies			 - Deadlines
# - Goals				     - Launched
# - Pledged			     - States
# - Backers 			   - Countries
# - Usd.pledged      - Column 1

# It might be countries, goals, currencies, Usd.pledged 


# 3) Which variables have NA values in them?

# To find NA valuem I have to use the summary function with each variable.

kickstarter354$currencies <- factor(kickstarter354$currencies)
summary(kickstarter354$currencies)

kickstarter354$goals <- factor(kickstarter354$goals)
summary(kickstarter354$goals)

kickstarter354$states <- factor(kickstarter354$states)
summary(kickstarter354$states)

# Answer: There are 3 variables have NA value : currencies, goals, states


# 4-1) What was the average number of people who backed a kickstarter project in this dataset? 
# 4-2) What was the highest number of "usd.pledged" for a kickstarter project in this dataset?

mean(kickstarter354$backers)

max(kickstarter354$usd.pledged)

# Answer : 80.42857(4-1),   303877(4-2)


# 5) What is the code you might use to subset the dataset to only include non-NA values for the variable called "state"? 

which(is.na(kickstarter354$states))

kickstarter354$states != 0

Value <- kickstarter354[kickstarter354$states != 0,]
head(Value)

example_subset <- kickstarter354[kickstarter354$states != 0,]
head(example_subset)

noNAvalue <- kickstarter354[!is.na(kickstarter354$states),]
dim(noNAvalue)
