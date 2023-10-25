#Before starting the lab 

bankchurn <- read.csv('C:/Users/sangh/Downloads/bankchurn_ex4.csv', header = TRUE)


# 1
nrow(bankchurn)

ncol(bankchurn)

is.na(bankchurn)


# 2
min(bankchurn$CreditScores)

max(bankchurn$CreditScores)

mean(bankchurn$CreditScores)


xtabs(~ CreditScores, data = bankchurn, subset = EstimatedSalary)


# 4
min(bankchurn$Age)

max(bankchurn$Age)

mean(bankchurn$Age)


# 5
cor(bankchurn$CreditScores, bankchurn$Age)

cor.test(bankchurn$CreditScores, bankchurn$Age)


# 6

mod1 <- lm(bankchurn$CreditScores ~ bankchurn$Age + bankchurn$Gender + bankchurn$Geographies)
summary(mod1)


