x <- read.csv("suicide-rates-overview-1985-to-2016\\master.csv")

#us specific

united.states.suicide <- x[x$ï..country=='United States',]
year <- united.states.suicide$year
sex <- united.states.suicide$sex
age <- united.states.suicide$age
gdp <- united.states.suicide$gdp_for_year....
gdp.capita <- united.states.suicide$gdp_per_capita....
generation <- united.states.suicide$generation
response <- united.states.suicide$suicides.100k.pop

plot(united.states.suicide$year, united.states.suicide$suicides.100k.pop, 
     main="Suicides per 100k in the United States from 1985 to 2015", xlab="Year", ylab="Suicides/100k")

united.states.suicide.female <- united.states.suicide[united.states.suicide$sex == "female",]

plot(united.states.suicide.female$year, united.states.suicide.female$suicides.100k.pop, 
     main="Suicides per 100k for females in the United States from 1985 to 2015", xlab="Year", ylab="Suicides/100k")

united.states.suicide.male <- united.states.suicide[united.states.suicide$sex == "male",]

plot(united.states.suicide.male$year, united.states.suicide.male$suicides.100k.pop, 
     main="Suicides per 100k for males in the United States from 1985 to 2015", xlab="Year", ylab="Suicides/100k")

united.states.suicide.5to14years <- united.states.suicide[united.states.suicide$age == "5-14 years",]
plot(united.states.suicide.5to14years$year, united.states.suicide.5to14years$suicides.100k.pop, 
     main="Suicides per 100k for 5 to 14 year olds in the United States from 1985 to 2015", xlab="Year", ylab="Suicides/100k")

united.states.suicide.male.5to14years <- united.states.suicide.male[united.states.suicide.male$age == "5-14 years",]
plot(united.states.suicide.male.5to14years$year, united.states.suicide.male.5to14years$suicides.100k.pop, 
     main="Suicides per 100k for 5 to 14 year old males in the United States from 1985 to 2015", xlab="Year", ylab="Suicides/100k")

united.states.suicide.female.5to14years <- united.states.suicide.female[united.states.suicide.female$age == "5-14 years",]
plot(united.states.suicide.female.5to14years$year, united.states.suicide.female.5to14years$suicides.100k.pop, 
     main="Suicides per 100k for 5 to 14 year old females in the United States from 1985 to 2015", xlab="Year", ylab="Suicides/100k")

#united.states.fit <- lm(response ~ year + sex * age + gdp + generation)
#united.states.fit <- lm(response ~ year + sex * age + gdp.capita) #year had a p-value of .79
united.states.fit <- lm(response ~ sex * age + gdp.capita)
#united.states.fit <- lm(response ~ year + sex * age)
summary(united.states.fit)

fit.residuals <- residuals(united.states.fit)
qqnorm(fit.residuals, pch = 1, xlab = "Fitted values", ylab = "Residuals", 
       main="Residuals vs Fitted Values of suicides per 100k in the United States")
qqline(fit.residuals, col = "red", lwd = 2)

plot(fit.residuals, xlab = "Fitted values", ylab = "Residuals", 
     main="Residuals Scatterplot of Suicides per 100k in the United States")

